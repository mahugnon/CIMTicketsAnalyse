Class {
	#name : #QueryDurationBetweenOpenAndCloseTicket,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #run }
QueryDurationBetweenOpenAndCloseTicket >> runOn: aTicket [
	^ (aTicket dev dev_fin asDate - aTicket ft_datecrea) totalSeconds
]
