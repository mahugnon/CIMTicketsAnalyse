Class {
	#name : #QueryTicketPerYear,
	#superclass : #CIMAbstractQuery,
	#category : #CIMTicketsAnalyse
}

{ #category : #running }
QueryTicketPerYear >> runOn: aCollection [
	^ ((aCollection groupedBy: [ :ticket | ticket year ]) associations
		sorted: [ :a :b | a key <= b key ]) asOrderedDictionary
]
