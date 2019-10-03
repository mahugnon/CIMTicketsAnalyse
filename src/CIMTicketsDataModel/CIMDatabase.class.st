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
		'tbl_retour'
	],
	#classInstVars : [
		'database'
	],
	#category : #'CIMTicketsDataModel-DataBase'
}

{ #category : #accessing }
CIMDatabase class >> database [
	database ifNil: [ database := self new ].
	^ database
]

{ #category : #accessing }
CIMDatabase class >> resetCurrent [
	<script>
	database := nil.
	self database
]

{ #category : #initialization }
CIMDatabase class >> setUpWith: ficheNavettePath and: biblioNamesPath [
	self resetCurrent.
	self database setUpWith: ficheNavettePath and: biblioNamesPath
]

{ #category : #utility }
CIMDatabase >> detectTblFrom: aCsvFile [
	| fileName |
	fileName := aCsvFile basenameWithoutExtension asLowercase.
	^ Tbl subclasses
		detect: [ :aTblSub | aTblSub name asLowercase = fileName ]
]

{ #category : #utility }
CIMDatabase >> joinTables [
	tbl_ft joinDevToTicket: tbl_dev.
	tbl_ft joinTypeCorrectionToTicket: tbl_type_correction.
	tbl_ft joinBibsToTicket: tbl_biblio.
	tbl_ft joinVersionsToTicket: tbl_version.
	TicketsLinkDetector new
		model: tbl_ft;
		connectAllLinkedTickets.
	tbl_tps joinTypeSessionToTps: tbl_type_session.
	tbl_ft joinTpsDevToTicket: tbl_tps.
	tbl_test joinTpsToTest: tbl_tps.
	tbl_ft joinTestToTicket: tbl_test.
	tbl_biblio joinModulesToLibrary.
	tbl_ft joinModulesToTickets
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
	self tbl_biblio renameUsing: aCollection
]

{ #category : #initialization }
CIMDatabase >> setUpWith: ficheNavettePath and: biblioNamesPath [
	self loadTblFromFolder: ficheNavettePath.
	self
		renameLibrariesUsing: (CIMFileLoader new loadBiothequesFromNamesFolder: biblioNamesPath).
	self joinTables.
	Tbl_Module create
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
