"
I am a tool to clean CIM data
"
Class {
	#name : #QueryCleanData,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #'as yet unclassified' }
QueryCleanData >> rejectWrongClosingDate: aCollection [
	^ aCollection
		select: [ :ft | 
			ft monthClosing
				ifNotNil: [ :date | date year >= 2000 ]
				ifNil: [ true ] ]
]

{ #category : #running }
QueryCleanData >> runOn: aCollection [
	^ self rejectWrongClosingDate: aCollection
]
