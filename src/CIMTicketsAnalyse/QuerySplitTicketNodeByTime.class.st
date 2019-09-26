Class {
	#name : #QuerySplitTicketNodeByTime,
	#superclass : #TimeSerieQueries,
	#instVars : [
		'month'
	],
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QuerySplitTicketNodeByTime >> lowerToTime: aCollection [
	^ (aCollection select: [ :node | node time <= month ])
		asOrderedCollection
]

{ #category : #accessing }
QuerySplitTicketNodeByTime >> month: anInteger [ 
	month := anInteger
]

{ #category : #running }
QuerySplitTicketNodeByTime >> runOn: aCollection [
	^ {(self lowerToTime: aCollection).
	(self uperToTime: aCollection)} asOrderedCollection
]

{ #category : #running }
QuerySplitTicketNodeByTime >> uperToTime: aCollection [
	^ (aCollection select: [ :node | node time > month ])
		asOrderedCollection
]
