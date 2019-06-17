Class {
	#name : #QueryTicketsTimeDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketsTimeDev >> runOn: aCollection [
	^ aCollection
		inject: 0
		into: [ :sum :ticket | sum + (QueryTicketTimeDev new runOn: ticket) ]
]
