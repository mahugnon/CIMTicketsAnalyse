Class {
	#name : #QueryAvgTicketsTimeTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTicketsTimeTest >> runOn: aCollection [
	aCollection ifEmpty: [ ^ 0 ].
	^ CIMAverageNode new
		value: (QueryTicketsTimeTest runOn: aCollection / aCollection size) asFloat;
		addTickets: aCollection;
		yourself
]
