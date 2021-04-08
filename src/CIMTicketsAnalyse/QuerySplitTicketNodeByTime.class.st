Class {
	#name : #QuerySplitTicketNodeByTime,
	#superclass : #TimeSerieQueries,
	#instVars : [
		'time'
	],
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QuerySplitTicketNodeByTime >> lowerToTime: aCollection [
	^ (aCollection select: [ :node | node time <= time ])
		asOrderedCollection
]

{ #category : #accessing }
QuerySplitTicketNodeByTime >> month: anInteger [ 
	time := anInteger
]

{ #category : #running }
QuerySplitTicketNodeByTime >> runOn: aCollection [
	^ {(self lowerToTime: aCollection).
	(self uperToTime: aCollection)} asOrderedCollection
]

{ #category : #running }
QuerySplitTicketNodeByTime >> uperToTime: aCollection [
	^ (aCollection select: [ :node | node time > time ])
		asOrderedCollection
]
