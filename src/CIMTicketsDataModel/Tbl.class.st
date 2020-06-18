Class {
	#name : #Tbl,
	#superclass : #Object,
	#instVars : [
		'rows',
		'host',
		'port'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #adding }
Tbl >> add: anObject [
	rows add: anObject
]

{ #category : #'as yet unclassified' }
Tbl >> convertFieldToCimDate [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Tbl >> fetchData [
	| allRows rowsJsonString retrievedRows rowsInfo |
	allRows := OrderedCollection new.
	0 to: self numberOfPages - 1 do: [ :i | 
		rowsJsonString := (ZnClient new
			url:
				self hostUrl , '/' , self uri , '?page=' , i printString , '&size='
					, self pageSize;
			get;
			response) contents.
		rowsInfo := NeoJSONReader fromString: rowsJsonString.
		retrievedRows := (rowsInfo at: '_embedded') values.
		allRows addAll: retrievedRows ].
	^ allRows
]

{ #category : #utility }
Tbl >> filFromCSVFile: arg1 [
	(CSVParser parseFileWithHeader: arg1)
		do: [ :arg2 | rows add: (self rowClass new initializeWith: arg2) ]
]

{ #category : #accessing }
Tbl >> hostUrl [
	^ 'http://' , host , ':' , port
]

{ #category : #initialization }
Tbl >> initialize [
	rows := OrderedCollection new.
	host := 'localhost'.
	port := CIMDatabase database cimDatabaseServerPort
]

{ #category : #initialization }
Tbl >> initializeFromRestServer [
	self loadCleanRowsFromRestServer
		do: [ :dic | rows add: (self rowClass new initializeWith: dic) ]
]

{ #category : #actions }
Tbl >> install [
	^ CIMDatabase database
		perform: (self className asLowercase , ':') asSymbol
		with: self
]

{ #category : #'as yet unclassified' }
Tbl >> loadCleanRowsFromRestServer [
	^ (self fetchData flatCollect: [ :each | each ])
		do: [ :each | each removeKey: '_links' ]
]

{ #category : #accessing }
Tbl >> numberOfPages [
	| rowsJsonString rowsInfo pageInfo totalPages |
	rowsJsonString := (ZnClient new
		url: self hostUrl , '/' , self uri , '?size=' , self pageSize;
		get;
		response) contents.
	rowsInfo := NeoJSONReader fromString: rowsJsonString.
	pageInfo := rowsInfo at: 'page'.
	totalPages := pageInfo at: 'totalPages'.
	^ totalPages
]

{ #category : #'as yet unclassified' }
Tbl >> pageSize [
	^ '1000'
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

{ #category : #accessing }
Tbl >> uri [
	^ self className asLowercase , 's'
]
