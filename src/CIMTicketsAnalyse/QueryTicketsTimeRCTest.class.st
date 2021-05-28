Class {
	#name : #QueryTicketsTimeRCTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketsTimeRCTest >> runOn: aCIMTicketGroNode [
	^ aCIMTicketGroNode tickets
		inject: 0
		into: [ :sum :ticket | sum + (self totalTicketQATestDurationOn: ticket) ]
]

{ #category : #accessing }
QueryTicketsTimeRCTest >> totalTicketQATestDurationOn: aTicket [
	^ aTicket rcTpsTest
		inject: 0
		into: [ :sum :tps | sum + tps tps_temps totalSeconds ]
]
