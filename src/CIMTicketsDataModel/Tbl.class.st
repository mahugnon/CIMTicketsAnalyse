Class {
	#name : #Tbl,
	#superclass : #Object,
	#instVars : [
		'rows'
	],
	#category : #CIMTicketsDataModel
}

{ #category : #utility }
Tbl >> filFromCSVFile: aFile [
	(CSVParser parseFileWithHeader: aFile)
		do: [ :each | rows add: (self rowClass new initializeWith: each) ]
]

{ #category : #initialization }
Tbl >> initialize [
	rows := OrderedCollection new
]

{ #category : #utility }
Tbl >> rowClass [
	^ self subclassResponsibility
]
