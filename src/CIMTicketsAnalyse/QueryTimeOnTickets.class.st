Class {
	#name : #QueryTimeOnTickets,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTimeOnTickets >> runOn: aCollection [
	aCollection isEmptyOrNil
		ifTrue: [ ^ 0 asDuration totalSeconds ]
		ifFalse: [ ^ (aCollection
				inject: 0 asDuration
				into: [ :sum :ticket | sum + (ticket totalTps ifNil: [ 0 asDuration ]) ])
				totalSeconds asFloat ]
]
