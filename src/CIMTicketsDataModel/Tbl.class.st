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

{ #category : #'as yet unclassified' }
Tbl class >> izyDevs [
	^ tables at: 12
]

{ #category : #'as yet unclassified' }
Tbl class >> izyReleases [
	^ tables at: 10
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
						select: [ :bib | ticket ft_modif_id = bib biblio_modif_id ]) ].
	Tbl tables fifth rows
		do: [ :ticket | 
			ticket
				versions:
					((Tbl tables at: 10) rows
						select: [ :version | ticket ft_version_id = version version_id ]) ]
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

{ #category : #utility }
Tbl >> loadTblFromFolder: csvFolder [
	^ (csvFolder asFileReference visibleFiles
		reject: [ :file | file basename = 'modules.csv' ])
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
