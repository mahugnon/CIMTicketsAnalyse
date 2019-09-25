Class {
	#name : #QueryTicketTimeRCTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketTimeRCTest >> runOn: aTicket [
	^ aTicket rcTpsTest
		inject: 0
		into: [ :sum :tps | sum + tps tps_temps totalSeconds ]
]
