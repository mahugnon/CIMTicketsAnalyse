Class {
	#name : #QueryAvgTimeDevTpsTotalMinusEstimOnTicket,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryAvgTimeDevTpsTotalMinusEstimOnTicket >> runOn: aCollection [
	aCollection isEmptyOrNil
		ifTrue: [ ^ 0 asDuration totalSeconds ]
		ifFalse: [ ^ ((aCollection
				inject: 0 asDuration
				into:
					[ :sum :ticket | sum + (ticket devTpsTotalMinusEstim ifNil: [ 0 asDuration ]) ])
				/ aCollection size) totalSeconds asFloat ]
]
