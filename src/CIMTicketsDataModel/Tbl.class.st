Class {
	#name : #Tbl,
	#superclass : #Object,
	#instVars : [
		'rows'
	],
	#classInstVars : [
		'tables',
		'avgTimeDevOnPerBibliotheque'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #'as yet unclassified' }
Tbl class >> allBibliotheques [
	^ self tables first rows
]

{ #category : #accessing }
Tbl class >> allTickets [
	^ self tableTickets rows
]

{ #category : #accessing }
Tbl class >> avgTimeDevOnPerBibliotheque [
	avgTimeDevOnPerBibliotheque
		ifNil: [ ^ QueryAvgTimeDevOnPerBibliotheque new
				runOn: (Bibliotheques createFrom: Tbl allTickets) bibliotheques ].
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

{ #category : #accessing }
Tbl class >> script [
	EvolutionBugPresenter new
		drawEvolutionCorrectionForTickets: Tbl tables fifth rows
		timeQuery: QueryTicketPerYear
		title: 'EVBug'.
	QueryAvgTimeOnTicketsGroupedByTime new
		runOn:
			(QueryTicketPerMonthClosing new
				runOn: (QueryBugs new runOn: Tbl tables fifth rows)).
	QueryAvgTimeToOpenCloseTicketsGroupedByTime new
		runOn:
			(QueryTicketPerMonth new
				runOn: (QueryEvolutions new runOn: Tbl tables fifth rows))
]

{ #category : #initialization }
Tbl class >> setUpTablesWith: ficheNavettePath and: biblioNamesPath [
	Tbl tables: (Tbl new loadTblFromFolder: ficheNavettePath).
	Tbl tables fifth rows
		do: [ :ticket | 
			ticket
				dev:
					(Tbl tables fourth rows
						detect: [ :dev | dev dev_id = ticket ft_dev_id ]
						ifNone: [ nil ]) ].
	Tbl tables fifth rows
		do: [ :ticket | 
			ticket
				typeCorrection:
					(Tbl tables ninth rows
						detect: [ :dev | dev typcorr_id = ticket ft_typcorr_id ]
						ifNone: [ nil ]) ].
	Tbl tables first rows
		do: [ :bib | 
			bib
				tickets:
					(Tbl tables fifth rows
						detect: [ :ticket | ticket ft_modif_id = bib biblio_modif_id ]
						ifNone: [ nil ]) ].
	Tbl tables fifth rows
		do: [ :ticket | 
			"	Tbl tables first
		renameUsing: (CIMFileLoader new loadBiothequesFromNamesFolder: biblioNamesPath)"
			ticket
				bibliotheques:
					(Tbl tables first rows
						select: [ :bib | ticket ft_modif_id = bib biblio_modif_id ]) ]
]

{ #category : #accessing }
Tbl class >> tableTickets [
	^ tables fifth
]

{ #category : #accessing }
Tbl class >> tables [
	^ tables
]

{ #category : #accessing }
Tbl class >> tables: anObject [
	tables := anObject
]

{ #category : #'as yet unclassified' }
Tbl >> convertFieldToCimDate [
	^ self subclassResponsibility
]

{ #category : #utility }
Tbl >> detectTblFrom: aCsvFile [
	^ (self class subclasses
		select: [ :aTblSub | 
			aTblSub name asLowercase
				= (aCsvFile basename asLowercase copyReplaceAll: '.csv' with: '') ])
		first
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

{ #category : #utility }
Tbl >> loadTblFromFolder: csvFolder [
	^ csvFolder asFileReference visibleFiles
		collect:
			[ :aCsvFile | (self detectTblFrom: aCsvFile) new filFromCSVFile: aCsvFile ]
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
