Class {
	#name : #QueryDurationBetweenOpenAndCloseTicket,
	#superclass : #Object,
	#category : #CIMTicketsAnalyse
}

{ #category : #run }
QueryDurationBetweenOpenAndCloseTicket >> runOn: tickets [
	^ tickets
		collect: [ :ticket | 
			ticket ft_numordre
				->
					(ticket dev dev_fin isNil
						ifFalse: [ ticket dev dev_fin asDate - ticket ft_datecrea ]
						ifTrue: [ 0 asDuration ]) ]
]
