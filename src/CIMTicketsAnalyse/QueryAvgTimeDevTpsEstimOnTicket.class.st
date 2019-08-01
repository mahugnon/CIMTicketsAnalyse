Class {
	#name : #QueryAvgTimeDevTpsEstimOnTicket,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryAvgTimeDevTpsEstimOnTicket >> runOn: aCollection [
	^ aCollection isEmptyOrNil
		ifTrue: [ ^ 0 asDuration totalSeconds ]
		ifFalse: [ ^ ((aCollection
				inject: 0 asDuration
				into: [ :sum :ticket | sum + (ticket devTpsEstim ifNil: [ 0 asDuration ]) ])
				/ aCollection size) totalSeconds asFloat ]
]
