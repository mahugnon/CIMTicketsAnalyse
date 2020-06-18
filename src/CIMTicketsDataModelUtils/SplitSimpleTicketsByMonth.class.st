Class {
	#name : #SplitSimpleTicketsByMonth,
	#superclass : #SplitSimpleTicketsTimeSerie,
	#category : #'CIMTicketsDataModelUtils-QueryUtils'
}

{ #category : #running }
SplitSimpleTicketsByMonth >> lowerToTime: aDictionary [
	^ ((aDictionary keys
		select: [ :key | key asSeconds <= time asSeconds ])
		collect: [ :key | key -> (aDictionary at: key) ])
		asOrderedDictionary
]

{ #category : #running }
SplitSimpleTicketsByMonth >> uperToTime: aDictionary [
	^ ((aDictionary keys
		select: [ :key | key asSeconds > time asSeconds ])
		collect: [ :key | key -> (aDictionary at: key) ])
		asOrderedDictionary
]
