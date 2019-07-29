Class {
	#name : #QueryAvgTimeOnTickets,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTimeOnTickets >> runOn: aCollection [
	aCollection isEmptyOrNil
		ifTrue: [ ^ 0 asDuration totalSeconds ]
		ifFalse: [ ^ ((aCollection
				inject: 0 asDuration
				into: [ :sum :ticket | sum + (ticket totalTps ifNil: [ 0 asDuration ]) ])
				/ aCollection size) totalSeconds asFloat ]
]
