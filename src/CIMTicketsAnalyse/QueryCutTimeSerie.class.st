Class {
	#name : #QueryCutTimeSerie,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #'as yet unclassified' }
QueryCutTimeSerie >> cut: aDictionary after: aMonth [
	^ ((aDictionary keys select: [ :key | key > aMonth ])
		collect: [ :key | key -> (aDictionary at: key) ])
		asOrderedDictionary
]

{ #category : #'as yet unclassified' }
QueryCutTimeSerie >> cut: aDictionary before: aMonth [
	^ ((aDictionary keys select: [ :key | key < aMonth ])
		collect: [ :key | key -> (aDictionary at: key) ])
		asOrderedDictionary
]

{ #category : #'as yet unclassified' }
QueryCutTimeSerie >> cut: aDictionary between: fistMonth and: secondMonth [
	^ ((aDictionary keys
		select: [ :key | key > fistMonth and: [ key < secondMonth ] ])
		collect: [ :key | key -> (aDictionary at: key) ])
		asOrderedDictionary
]
