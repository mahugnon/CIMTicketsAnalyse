Class {
	#name : #QuereyTicketsTimeDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QuereyTicketsTimeDev >> runOn: aCollection [
	^ aCollection
		inject: 0
		into: [ :sum :ticket | sum + (QuereyTicketTimeDev new runOn: ticket) ]
]
