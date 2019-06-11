Class {
	#name : #Tbl,
	#superclass : #Object,
	#instVars : [
		'rows'
	],
	#classInstVars : [
		'tables'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl class >> script [
	self fourth rows
		do: [ :arg1 | 
			arg1
				dev_id: (self fifth rows detect: [ :arg2 | arg2 ft_dev_id = arg1 dev_id ]) ].
	EvolutionBugPresenter new
		drawEvolutionCorrectionForTickets: Tbl tables fifth rows
		timeQuery: QueryTicketPerYear
		title: 'EVBug'.
	QueryAvgTimeOnTicketsGroupedByTime new
		runOn:
			(QueryTicketPerMonth new
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
Tbl class >> tables [
	^ tables
]

{ #category : #accessing }
Tbl class >> tables: anObject [
	tables := anObject
]

{ #category : #'as yet unclassified' }
Tbl >> detectTblFrom: arg1 [
	^ (self class subclasses
		select: [ :arg2 | 
			arg2 name asLowercase
				= (arg1 basename asLowercase copyReplaceAll: '.csv' with: '') ])
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

{ #category : #'as yet unclassified' }
Tbl >> loadTblFromFolder: arg1 [
	^ arg1 asFileReference visibleFiles
		collect: [ :arg2 | (self detectTblFrom: arg2) new filFromCSVFile: arg2 ]
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
