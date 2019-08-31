Class {
	#name : #QueryAvgTicketsTimeDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryAvgTicketsTimeDev >> runOn: aCollection [
	^ CIMAverageNode new
		value:
			(aCollection
				ifEmpty: [ 0 ]
				ifNotEmpty: ((QueryTicketsTimeDev runOn: aCollection) / aCollection size) asFloat);
		addTickets: aCollection;
		yourself
]
