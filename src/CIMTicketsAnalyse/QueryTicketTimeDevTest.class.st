Class {
	#name : #QueryTicketTimeDevTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketTimeDevTest >> runOn: aTicket [
	^ aTicket devTpsTest
		inject: 0
		into: [ :sum :tps | sum + tps tps_temps totalSeconds ]
]
