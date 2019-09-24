Class {
	#name : #Tbl,
	#superclass : #Object,
	#instVars : [
		'rows'
	],
	#classInstVars : [
		'tables',
		'avgTimeDevOnPerBibliotheque',
		'tbl_module',
		'tbl_biblio',
		'tbl_cim',
		'tbl_cim_service',
		'tbl_dev',
		'tbl_devizy',
		'tbl_ft',
		'tbl_message',
		'tbl_modif',
		'tbl_semaine_dev',
		'tbl_tps',
		'tbl_type_correction',
		'tbl_type_session',
		'tbl_version',
		'tbl_test',
		'tbl_version_news'
	],
	#category : #CIMTicketsDataModel
}

{ #category : #'as yet unclassified' }
Tbl class >> allBibliotheques [
	^ self tables first rows
]

{ #category : #accessing }
Tbl class >> allTickets [
	^ self tbl_ft rows
]

{ #category : #accessing }
Tbl class >> avgTimeDevOnPerBibliotheque [
	avgTimeDevOnPerBibliotheque
		ifNil: [ ^ QueryAvgTimeDevOnPerBibliotheque new
				runOn: (Bibliotheques createFrom: Tbl allTickets) bibliotheques ].
	^ avgTimeDevOnPerBibliotheque
]

{ #category : #accessing }
Tbl class >> avgTimeDevOnPerBibliotheque1 [
	^ avgTimeDevOnPerBibliotheque
]

{ #category : #accessing }
Tbl class >> avgTimeDevOnPerBibliotheque: anObject [
	avgTimeDevOnPerBibliotheque := anObject
]

{ #category : #accesing }
Tbl class >> dev [
	^tables fourth
]

{ #category : #'as yet unclassified' }
Tbl class >> izyDevs [
	^ tables at: 12
]

{ #category : #'as yet unclassified' }
Tbl class >> izyReleases [
	^ tables at: 10
]

{ #category : #'as yet unclassified' }
Tbl class >> joinTables [
	tbl_ft joinDevToTicket: tbl_dev.
	tbl_ft joinTypeCorrectionToTicket: tbl_type_correction.
	tbl_ft joinBibsToTicket: tbl_biblio.
	tbl_ft joinVersionsToTicket: tbl_version.
	TicketsLinkDetector new
		model: tbl_ft;
		connectAllLinkedTickets.
	tbl_tps joinTypeSessionToTps: tbl_type_session.
	tbl_ft joinTpsDevToTicket: tbl_tps .
	tbl_test joinTpsToTest: tbl_tps.
	tbl_ft joinTestToTicket: tbl_test.
]

{ #category : #initialization }
Tbl class >> setUpTablesWith: ficheNavettePath and: biblioNamesPath [
	Tbl new loadTblFromFolder: ficheNavettePath.
	self joinTables
	"tbl_biblio
		renameUsing: (CIMFileLoader new loadBiothequesFromNamesFolder: '/Users/honore/Documents/Resources/utility/bibiothequeNames')"
]

{ #category : #accessing }
Tbl class >> tables [
	^ tables
]

{ #category : #accessing }
Tbl class >> tables: anObject [
	tables := anObject
]

{ #category : #accessing }
Tbl class >> tbl_biblio [
	^ tbl_biblio
]

{ #category : #accessing }
Tbl class >> tbl_biblio: anObject [
	tbl_biblio := anObject
]

{ #category : #accessing }
Tbl class >> tbl_cim [
	^ tbl_cim
]

{ #category : #accessing }
Tbl class >> tbl_cim: anObject [
	tbl_cim := anObject
]

{ #category : #accessing }
Tbl class >> tbl_cim_service [
	^ tbl_cim_service
]

{ #category : #accessing }
Tbl class >> tbl_cim_service: anObject [
	tbl_cim_service := anObject
]

{ #category : #accessing }
Tbl class >> tbl_dev [
	^ tbl_dev
]

{ #category : #accessing }
Tbl class >> tbl_dev: anObject [
	tbl_dev := anObject
]

{ #category : #accessing }
Tbl class >> tbl_devizy [
	^ tbl_devizy
]

{ #category : #accessing }
Tbl class >> tbl_devizy: anObject [
	tbl_devizy := anObject
]

{ #category : #accessing }
Tbl class >> tbl_ft [
	^ tbl_ft
]

{ #category : #accessing }
Tbl class >> tbl_ft: anObject [
	tbl_ft := anObject
]

{ #category : #accessing }
Tbl class >> tbl_message [
	^ tbl_message
]

{ #category : #accessing }
Tbl class >> tbl_message: anObject [
	tbl_message := anObject
]

{ #category : #accessing }
Tbl class >> tbl_modif [
	^ tbl_modif
]

{ #category : #accessing }
Tbl class >> tbl_modif: anObject [
	tbl_modif := anObject
]

{ #category : #accessing }
Tbl class >> tbl_module [
	^ tbl_module
]

{ #category : #accessing }
Tbl class >> tbl_module: anObject [
	tbl_module := anObject
]

{ #category : #accessing }
Tbl class >> tbl_semaine_dev [
	^ tbl_semaine_dev
]

{ #category : #accessing }
Tbl class >> tbl_semaine_dev: anObject [
	tbl_semaine_dev := anObject
]

{ #category : #accessing }
Tbl class >> tbl_test [
	^ tbl_test
]

{ #category : #accessing }
Tbl class >> tbl_test: anObject [
	tbl_test := anObject
]

{ #category : #accessing }
Tbl class >> tbl_tps [
	^ tbl_tps
]

{ #category : #accessing }
Tbl class >> tbl_tps: anObject [
	tbl_tps := anObject
]

{ #category : #accessing }
Tbl class >> tbl_type_correction [
	^ tbl_type_correction
]

{ #category : #accessing }
Tbl class >> tbl_type_correction: anObject [
	tbl_type_correction := anObject
]

{ #category : #accessing }
Tbl class >> tbl_type_session [
	^ tbl_type_session
]

{ #category : #accessing }
Tbl class >> tbl_type_session: anObject [
	tbl_type_session := anObject
]

{ #category : #accessing }
Tbl class >> tbl_version [
	^ tbl_version
]

{ #category : #accessing }
Tbl class >> tbl_version: anObject [
	tbl_version := anObject
]

{ #category : #accessing }
Tbl class >> tbl_version_news [
	^ tbl_version_news
]

{ #category : #accessing }
Tbl class >> tbl_version_news: anObject [
	tbl_version_news := anObject
]

{ #category : #'as yet unclassified' }
Tbl class >> tps [
	^ tables eighth
]

{ #category : #'as yet unclassified' }
Tbl class >> typeSessions [
	^ Tbl tables at: 11
]

{ #category : #'as yet unclassified' }
Tbl >> convertFieldToCimDate [
	^ self subclassResponsibility
]

{ #category : #utility }
Tbl >> detectTblFrom: aCsvFile [
	^ self class subclasses
		detect: [ :aTblSub | 
			aTblSub name asLowercase
				= (aCsvFile basename asLowercase copyReplaceAll: '.csv' with: '') ]
]

{ #category : #utility }
Tbl >> filFromCSVFile: arg1 [
	(CSVParser parseFileWithHeader: arg1)
		do: [ :arg2 | rows add: (self rowClass new initializeWith: arg2) ]
]

{ #category : #initialization }
Tbl >> initialize [
	rows := OrderedCollection new
]

{ #category : #actions }
Tbl >> install [
	^ Tbl perform: (self className asLowercase , ':') asSymbol with: self
]

{ #category : #utility }
Tbl >> loadTblFromFolder: csvFolder [
	(csvFolder asFileReference visibleFiles
		reject: [ :file | file basename = 'modules.csv' ])
		do: [ :aCsvFile | 
			(self detectTblFrom: aCsvFile) new
				filFromCSVFile: aCsvFile;
				install ]
]

{ #category : #utility }
Tbl >> rowClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
Tbl >> rows [
	^ rows
]

{ #category : #accessing }
Tbl >> rows: arg1 [
	rows := arg1
]
