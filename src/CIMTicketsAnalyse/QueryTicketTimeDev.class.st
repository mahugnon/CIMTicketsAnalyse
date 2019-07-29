Class {
	#name : #QueryTicketTimeDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryTicketTimeDev >> runOn: aTicket [
	^ (aTicket timeDev select: [ :t | t isDevelopment ])
		inject: 0
		into: [ :sum :aTimeDv | sum + aTimeDv tps_temps totalSeconds ]
]
