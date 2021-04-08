Class {
	#name : #QueryCutTimeSerie,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #'as yet unclassified' }
QueryCutTimeSerie >> cut: aCollection after: aMonth [
	^ (aCollection select: [ :aNode | aNode time > aMonth ])
		asOrderedCollection
]

{ #category : #'as yet unclassified' }
QueryCutTimeSerie >> cut: aCollection before: aMonth [
	^ (aCollection select: [ :aNode | aNode time < aMonth ])
		asOrderedCollection
]

{ #category : #'as yet unclassified' }
QueryCutTimeSerie >> cut: aDictionary between: fistMonth and: secondMonth [
	^ ((aDictionary keys
		select: [ :key | key > fistMonth and: [ key < secondMonth ] ])
		collect: [ :key | key -> (aDictionary at: key) ])
		asOrderedDictionary
]
