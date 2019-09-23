Class {
	#name : #QuerySplitTicketNodeByTime,
	#superclass : #TimeSerieQueries,
	#instVars : [
		'month'
	],
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QuerySplitTicketNodeByTime >> lowerToMonth: aCollection [
	^ (aCollection select: [ :node | node time <= month ])
		asOrderedCollection
]

{ #category : #accessing }
QuerySplitTicketNodeByTime >> month: anInteger [ 
	month := anInteger
]

{ #category : #running }
QuerySplitTicketNodeByTime >> runOn: aCollection [
	^ {(self lowerToMonth: aCollection).
	(self uperToMonth: aCollection)} asOrderedCollection
]

{ #category : #running }
QuerySplitTicketNodeByTime >> uperToMonth: aCollection [
	^ (aCollection select: [ :node | node time > month ])
		asOrderedCollection
]
