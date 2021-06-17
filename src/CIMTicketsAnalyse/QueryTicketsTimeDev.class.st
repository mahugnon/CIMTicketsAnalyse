Class {
	#name : #QueryTicketsTimeDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryTicketsTimeDev >> runOn: aTicketGroupNode [
	^ aTicketGroupNode tickets
		inject: 0
		into: [ :sum :ticket | sum + (self totalDevelpmentDurationOn: ticket) ]
]

{ #category : #accessing }
QueryTicketsTimeDev >> totalDevelpmentDurationOn: aTicket [
	^ (aTicket timeDev select: [ :t | t isDevelopment ])
		inject: 0
		into: [ :sum :aTimeDv | sum + aTimeDv tps_temps totalSeconds ]
]
