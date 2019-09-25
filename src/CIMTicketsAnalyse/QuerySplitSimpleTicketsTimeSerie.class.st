Class {
	#name : #QuerySplitSimpleTicketsTimeSerie,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QuerySplitSimpleTicketsTimeSerie >> lowerToMonth: aDictionary [
	^ ((aDictionary keys
		select: [ :key | key asSeconds <= month asSeconds ])
		collect: [ :key | key -> (aDictionary at: key) ])
		asOrderedDictionary
]

{ #category : #running }
QuerySplitSimpleTicketsTimeSerie >> runOn: aDictionary [
	^ {(self lowerToMonth: aDictionary).
	(self uperToMonth: aDictionary)} asOrderedCollection
]

{ #category : #running }
QuerySplitSimpleTicketsTimeSerie >> uperToMonth: aDictionary [
	^ ((aDictionary keys
		select: [ :key | key asSeconds > month asSeconds ])
		collect: [ :key | key -> (aDictionary at: key) ])
		asOrderedDictionary
]
