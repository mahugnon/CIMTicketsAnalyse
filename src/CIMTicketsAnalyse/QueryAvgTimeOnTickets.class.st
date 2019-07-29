Class {
	#name : #QueryAvgTimeOnTickets,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTimeOnTickets >> runOn: aCollection [
	aCollection isEmptyOrNil
		ifTrue: [ ^ 0 asDuration totalSeconds ]
		ifFalse: [ ^ (QueryTimeOnTickets runOn: aCollection) totalSeconds asFloat ]
]
