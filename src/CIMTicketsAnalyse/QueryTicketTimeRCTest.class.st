Class {
	#name : #QueryTicketTimeRCTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketTimeRCTest >> runOn: aTicket [
	^ (aTicket timeDev select: [ :t | t isTest ])
		inject: 0
		into: [ :sum :aTimeDv | sum + aTimeDv tps_temps totalSeconds ]
]
