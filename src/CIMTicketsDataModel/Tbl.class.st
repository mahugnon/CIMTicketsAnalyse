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
				dev_id: (self fifth rows detect: [ :arg2 | arg2 ft_dev_id = arg1 dev_id ]) ]
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
