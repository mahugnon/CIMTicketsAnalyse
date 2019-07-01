Class {
	#name : #QuerySplitTicketsTimeSerie,
	#superclass : #TimeSerieQueries,
	#instVars : [
		'month'
	],
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QuerySplitTicketsTimeSerie >> lowerToMonth: aDictionary [
	^ ((aDictionary keys select: [ :key | key asSeconds <= month ])
		collect: [ :key | key -> (aDictionary at: key) ])
		asOrderedDictionary
]

{ #category : #accessing }
QuerySplitTicketsTimeSerie >> month: anInteger [ 
	month := anInteger
]

{ #category : #running }
QuerySplitTicketsTimeSerie >> runOn: aDictionary [
	^ {(self lowerToMonth: aDictionary).
	(self uperToMonth: aDictionary)} asOrderedCollection
]

{ #category : #running }
QuerySplitTicketsTimeSerie >> uperToMonth: aDictionary [
	^ ((aDictionary keys select: [ :key | key asSeconds > month ])
		collect: [ :key | key -> (aDictionary at: key) ])
		asOrderedDictionary
]
