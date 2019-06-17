Class {
	#name : #QuereyTicketTimeDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QuereyTicketTimeDev >> runOn: aTicket [
	^ (aTicket timeDev select: [ :t | t isDevelopment ])
		inject: 0
		into: [ :sum :aTimeDv | sum + aTimeDv totalSeconds ]
]
