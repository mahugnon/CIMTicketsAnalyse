Class {
	#name : #QueryDurationBetweenOpenAndCloseTicket,
	#superclass : #CIMAbstractQuery,
	#category : #CIMTicketsAnalyse
}

{ #category : #run }
QueryDurationBetweenOpenAndCloseTicket >> runOn: aTicket [
	^ aTicket dev dev_fin isNil
		ifFalse: [ aTicket dev dev_fin asDate - aTicket ft_datecrea ]
		ifTrue: [ 0 asDuration ]
]
