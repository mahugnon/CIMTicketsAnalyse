"
I'm an internal database. I' m mainly a catch memory for the dashboard.
I have a singleton  which is the only instance that I provide to users.

"
Class {
	#name : #CIMDatabase,
	#superclass : #Object,
	#instVars : [
		'tbl_type_correction',
		'tbl_semaine_dev',
		'tbl_ft',
		'tbl_tps',
		'tbl_cim',
		'tbl_type_session',
		'tbl_cim_service',
		'tbl_test',
		'tbl_devizy',
		'tbl_message',
		'tbl_version_news',
		'tbl_dev',
		'tbl_modif',
		'tbl_biblio',
		'tbl_type_retour',
		'tbl_version',
		'tbl_theme',
		'tbl_retour',
		'tbl_module',
		'cimDatabaseServerPort',
		'lastUpdate'
	],
	#classInstVars : [
		'database'
	],
	#category : #'CIMTicketsDataModel-DataBase'
}

{ #category : #accessing }
CIMDatabase class >> database [
	database
		ifNil: [ database := self new cimDatabaseServerPort: '9599' ].
	^ database
]

{ #category : #accessing }
CIMDatabase class >> database: aCIMDatabase [ 
	database := aCIMDatabase
]

{ #category : #accessing }
CIMDatabase class >> resetCurrent [
	<script>
	database := nil.
	self database
]

{ #category : #controlling }
CIMDatabase class >> scheduleUpdate [
	<script>
	| scheduler when |
	scheduler := TaskScheduler new start.
	when := DateAndTime now + 2 seconds.
	^ scheduler
		do: [ self database
				updateFromServerWith:
					(IceBergProjectLocator locateRoot / 'resources/bibiothequeNames')
						pathString ]
		at: when
		every: 4 week
]

{ #category : #initialization }
CIMDatabase class >> setUpWith: biblioNamesPath [
	"This set up doesn't consider the number of developer."

	self resetCurrent.
	self database updateFromServerWith: biblioNamesPath
]

{ #category : #initialization }
CIMDatabase class >> setUpWith: ficheNavettePath and: biblioNamesPath [
	self resetCurrent.
	self database setUpWith: ficheNavettePath and: biblioNamesPath
]

{ #category : #'as yet unclassified' }
CIMDatabase class >> updateData: aBuilder [
	<worldMenu>
	(aBuilder item: #LoadingLastestTickets)
		order: 10;
		help: 'Load lastest tickets from CIM DBA database';
		label: 'LoadingLastestTickets';
		icon: CIMIconLibrary dashboardIcon;
		action: [ self database
				updateFromServerWith: IceBergProjectLocator locateRoot / 'bibliothequeNames' ]
]

{ #category : #accessing }
CIMDatabase >> allPBLibraries [
	^ tbl_biblio rows
]

{ #category : #accessing }
CIMDatabase >> allTickets [
	^ tbl_ft rows
]

{ #category : #accessing }
CIMDatabase >> cimDatabaseServerPort [
	^ cimDatabaseServerPort
]

{ #category : #accessing }
CIMDatabase >> cimDatabaseServerPort: aString [
	cimDatabaseServerPort := aString
]

{ #category : #utility }
CIMDatabase >> detectTblFrom: aCsvFile [
	| fileName |
	fileName := aCsvFile basenameWithoutExtension asLowercase.
	^ Tbl subclasses
		detect: [ :aTblSub | aTblSub name asLowercase = fileName ]
]

{ #category : #'as yet unclassified' }
CIMDatabase >> dropCreateDb [
	| tables |
	tables := {Tbl_biblio.
	Tbl_dev.
	Tbl_ft.
	Tbl_modif.
	Tbl_test.
	Tbl_tps.
	Tbl_type_correction.
	Tbl_type_session.
	Tbl_version.
	Tbl_version_news.
	Tbl_type_retour.
	Tbl_retour}.
	[ :job | 
	tables
		do: [ :each | 
			job
				progress: (tables indexOf: each) / tables size;
				title: 'loading  ' , each asString , '...'.
			each new initializeFromRestServer install ] ] asJob run
]

{ #category : #utility }
CIMDatabase >> joinTables [
	| todo |
	todo := OrderedDictionary
		newFromKeys: self joinTablesIntents
		andValues: self joinTablesJob.
	[ :job | 
	todo
		keysAndValuesDo: [ :key :value | 
			job
				progress: (todo indexOfKey: key) / todo size;
				title: key , '...'.
			value ] ] asJob run
]

{ #category : #utility }
CIMDatabase >> joinTablesIntents [
	^ {'joinnig TypeCorrection to Tickets'.
'joinnig Dev  to Tickets'.
	'removing useless tickes' . 
	'joining Libraries to Tickets'.
	'joinnig Versions to Tickets' .
	 'joinnig TypeSession to Tps'.
	'joinnig TpsDev to Tickets' . 
	'joinnig Tps to Test'.
	'joinnig Test to Tickets' . 
	'joinnig Modules to Library'.
	'joinnig Modules to Tickets' .
	 'joinnig TypeRetour to Retour'.
	'joining retours to tickets'.
	'joinnig  Tickets to Retour' . 
	'initializing Modules rows'} 
]

{ #category : #utility }
CIMDatabase >> joinTablesJob [
	^ {(tbl_ft joinTypeCorrectionToTicket: tbl_type_correction).
	(tbl_ft joinDevToTicket: tbl_dev).
	tbl_ft removeUselessRows.
	(tbl_ft joinBibsToTicket: tbl_biblio).
	(tbl_ft joinVersionsToTicket: tbl_version).
	(tbl_tps joinTypeSessionToTps: tbl_type_session).
	(tbl_ft joinTpsDevToTicket: tbl_tps).
	(tbl_test joinTpsToTest: tbl_tps).
	(tbl_ft joinTestToTicket: tbl_test).
	tbl_biblio joinModulesToLibrary.
	tbl_ft joinModulesToTickets.
	(tbl_retour joinTypeRetoursToRetours: tbl_type_retour).
	(tbl_ft joinRetoursToTickets: tbl_retour).
	(tbl_retour joinTicketsToRetour: tbl_ft).
	tbl_module initializeModuleRows}
]

{ #category : #accessing }
CIMDatabase >> lastUpdate [
	^ lastUpdate
]

{ #category : #initialization }
CIMDatabase >> loadModules [
	Tbl_Module new
		database: self;
		install
]

{ #category : #utility }
CIMDatabase >> loadTblFromFolder: csvFolder [
	(csvFolder asFileReference visibleFiles
		reject: [ :file | file basename = 'modules.csv' ])
		do: [ :aCsvFile | 
			(self detectTblFrom: aCsvFile) new
				filFromCSVFile: aCsvFile;
				install ]
]

{ #category : #utility }
CIMDatabase >> renameLibrariesUsing: aCollection [
	[ self tbl_biblio renameUsing: aCollection ] asJob
		title: 'renaming libraries ...';
		run
]

{ #category : #'as yet unclassified' }
CIMDatabase >> resetWebModels [
	CIMWebModuleModelInitializer new resetModels
]

{ #category : #initialization }
CIMDatabase >> setUpWith: ficheNavettePath and: biblioNamesPath [
	self loadTblFromFolder: ficheNavettePath.
	self
		renameLibrariesUsing: (CIMFileLoader new loadBiothequesFromNamesFolder: biblioNamesPath).
	self joinTables.
	self loadModules
]

{ #category : #accessing }
CIMDatabase >> tbl_Module [
	self shouldBeImplemented.
]

{ #category : #accessing }
CIMDatabase >> tbl_biblio [
	^ tbl_biblio
]

{ #category : #accessing }
CIMDatabase >> tbl_biblio: aTbl_biblio [
	tbl_biblio := aTbl_biblio
]

{ #category : #accessing }
CIMDatabase >> tbl_cim [
	^ tbl_cim
]

{ #category : #accessing }
CIMDatabase >> tbl_cim: aTbl_cim [
	tbl_cim := aTbl_cim
]

{ #category : #accessing }
CIMDatabase >> tbl_cim_service [
	^ tbl_cim_service
]

{ #category : #accessing }
CIMDatabase >> tbl_cim_service: aTbl_cim_service [
	tbl_cim_service := aTbl_cim_service
]

{ #category : #accessing }
CIMDatabase >> tbl_dev [
	^ tbl_dev
]

{ #category : #accessing }
CIMDatabase >> tbl_dev: aTbl_dev [
	tbl_dev := aTbl_dev
]

{ #category : #accessing }
CIMDatabase >> tbl_devizy [
	^ tbl_devizy
]

{ #category : #accessing }
CIMDatabase >> tbl_devizy: aTbl_devIzy [
	tbl_devizy := aTbl_devIzy
]

{ #category : #accessing }
CIMDatabase >> tbl_ft [
	^ tbl_ft
]

{ #category : #accessing }
CIMDatabase >> tbl_ft: aTbl_ft [
	tbl_ft := aTbl_ft
]

{ #category : #accessing }
CIMDatabase >> tbl_message [
	^ tbl_message
]

{ #category : #accessing }
CIMDatabase >> tbl_message: aTbl_message [
	tbl_message := aTbl_message
]

{ #category : #accessing }
CIMDatabase >> tbl_modif [
	^ tbl_modif
]

{ #category : #accessing }
CIMDatabase >> tbl_modif: aTbl_modif [
	tbl_modif := aTbl_modif
]

{ #category : #accessing }
CIMDatabase >> tbl_module [
	^ tbl_module
]

{ #category : #accessing }
CIMDatabase >> tbl_module: aTbl_Module [
	tbl_module := aTbl_Module
]

{ #category : #accessing }
CIMDatabase >> tbl_retour [
	^ tbl_retour
]

{ #category : #accessing }
CIMDatabase >> tbl_retour: anObject [
	tbl_retour := anObject
]

{ #category : #accessing }
CIMDatabase >> tbl_semaine_dev [
	^ tbl_semaine_dev
]

{ #category : #accessing }
CIMDatabase >> tbl_semaine_dev: aTbl_semaine_dev [
	tbl_semaine_dev := aTbl_semaine_dev
]

{ #category : #accessing }
CIMDatabase >> tbl_test [
	^ tbl_test
]

{ #category : #accessing }
CIMDatabase >> tbl_test: aTbl_test [
	tbl_test := aTbl_test
]

{ #category : #accessing }
CIMDatabase >> tbl_theme [
	^ tbl_theme
]

{ #category : #accessing }
CIMDatabase >> tbl_theme: anObject [
	tbl_theme := anObject
]

{ #category : #accessing }
CIMDatabase >> tbl_tps [
	^ tbl_tps
]

{ #category : #accessing }
CIMDatabase >> tbl_tps: aTbl_tps [
	tbl_tps := aTbl_tps
]

{ #category : #accessing }
CIMDatabase >> tbl_type_correction [
	^ tbl_type_correction
]

{ #category : #accessing }
CIMDatabase >> tbl_type_correction: aTbl_type_correction [
	tbl_type_correction := aTbl_type_correction
]

{ #category : #accessing }
CIMDatabase >> tbl_type_retour [
	^ tbl_type_retour
]

{ #category : #accessing }
CIMDatabase >> tbl_type_retour: aTbl_type_retour [
	tbl_type_retour := aTbl_type_retour
]

{ #category : #accessing }
CIMDatabase >> tbl_type_session [
	^ tbl_type_session
]

{ #category : #accessing }
CIMDatabase >> tbl_type_session: aTbl_type_session [
	tbl_type_session := aTbl_type_session
]

{ #category : #accessing }
CIMDatabase >> tbl_version [
	^ tbl_version
]

{ #category : #accessing }
CIMDatabase >> tbl_version: aTbl_version [
	tbl_version := aTbl_version
]

{ #category : #accessing }
CIMDatabase >> tbl_version_news [
	^ tbl_version_news
]

{ #category : #accessing }
CIMDatabase >> tbl_version_news: aTbl_version_news [
	tbl_version_news := aTbl_version_news
]

{ #category : #'as yet unclassified' }
CIMDatabase >> updateFromServerWith: biblioNamesPath [
	"	Tomcat startOn: self cimDatabaseServerPort."

	self dropCreateDb.
	lastUpdate := Date today.
	self
		renameLibrariesUsing: (CIMFileLoader new loadBiothequesFromNamesFolder: biblioNamesPath).
	self loadModules.
	self joinTables.
	self resetWebModels.
	Smalltalk snapshot: true andQuit: false
]
