Class {
	#name : #QueryTicketsTimeDevTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketsTimeDevTest >> runOn: aCIMTicketGroNode [
	^ aCIMTicketGroNode tickets
		inject: 0
		into: [ :sum :ticket | sum + (self totalDevTestDurationOn: ticket) ]
]

{ #category : #running }
QueryTicketsTimeDevTest >> totalDevTestDurationOn: aTicket [
	^ aTicket devTpsTest
		inject: 0
		into: [ :sum :tps | sum + tps tps_temps totalSeconds ]
]
