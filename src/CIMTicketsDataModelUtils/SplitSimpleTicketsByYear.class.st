Class {
	#name : #SplitSimpleTicketsByYear,
	#superclass : #SplitSimpleTicketsTimeSerie,
	#category : #'CIMTicketsDataModelUtils-QueryUtils'
}

{ #category : #running }
SplitSimpleTicketsByYear >> lowerToTime: aDictionary [
	^ ((aDictionary keys select: [ :key | key <= time ])
		collect: [ :key | key -> (aDictionary at: key) ])
		asOrderedDictionary
]

{ #category : #running }
SplitSimpleTicketsByYear >> uperToTime: aDictionary [
	^ ((aDictionary keys select: [ :key | key > time ])
		collect: [ :key | key -> (aDictionary at: key) ])
		asOrderedDictionary
]
