Class {
	#name : #QueryAvgTimeOnTickets,
	#superclass : #CIMAbstractQuery,
	#category : #CIMTicketsAnalyse
}

{ #category : #running }
QueryAvgTimeOnTickets >> runOn: aCollection [
	^ (aCollection
		inject: 0 asDuration
		into: [ :sum :ticket | sum + (ticket totalTps ifNil: [ 0 asDuration ]) ])
		/ aCollection size
]
