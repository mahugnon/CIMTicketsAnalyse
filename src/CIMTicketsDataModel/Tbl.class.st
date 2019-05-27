Class {
	#name : #Tbl,
	#superclass : #Object,
	#instVars : [
		'rows'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #'as yet unclassified' }
Tbl >> detectTblFrom: file [
	^ (self class subclasses
		select: [ :cl | 
			cl name asLowercase
				= (file basename asLowercase copyReplaceAll: '.csv' with: '') ])
		first
]

{ #category : #utility }
Tbl >> filFromCSVFile: aFile [
	(CSVParser parseFileWithHeader: aFile)
		do: [ :each | rows add: (self rowClass new initializeWith: each) ]
]

{ #category : #initialization }
Tbl >> initialize [
	rows := OrderedCollection new
]

{ #category : #'as yet unclassified' }
Tbl >> loadTblFromFolder: aFolder [
	^ aFolder asFileReference visibleFiles
		collect: [ :file | (self detectTblFrom: file) new filFromCSVFile: file ]
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
Tbl >> rows: anObject [
	rows := anObject
]
