Class {
	#name : #QueryAvgTicketsTimeDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTicketsTimeDev >> runOn: aCollection [
	^ ((aCollection
		inject: 0
		into: [ :sum :ticket | sum + (QueryTicketTimeDev new runOn: ticket) ])
		/ aCollection size) asFloat
]
