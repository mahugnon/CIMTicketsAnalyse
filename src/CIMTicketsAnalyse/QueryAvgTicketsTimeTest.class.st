Class {
	#name : #QueryAvgTicketsTimeTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTicketsTimeTest >> runOn: aCollection [
	aCollection ifEmpty: [ ^ 0 ].
	^ ((aCollection
		inject: 0
		into: [ :sum :ticket | sum + (QueryTicketTimeTest runOn: ticket) ])
		/ aCollection size) asFloat
]
