Class {
	#name : #QueryDurationBetweenOpenAndCloseTicket,
	#superclass : #Object,
	#category : #CIMTicketsAnalyse
}

{ #category : #run }
QueryDurationBetweenOpenAndCloseTicket >> runOn: tickets with: devRows [
	tickets collect: [ :ticket | ticket  ]
]
