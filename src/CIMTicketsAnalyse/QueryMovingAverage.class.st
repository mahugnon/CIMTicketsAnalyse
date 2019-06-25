Class {
	#name : #QueryMovingAverage,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryMovingAverage >> runOn: aDictionary [
	| result |
	result := OrderedCollection new.
	1 to: (aDictionary size - 4) do: [ :i ||k v|
		k := aDictionary keys at: (i+2).
		v := (aDictionary values copyFrom: i to: i+4) average.
		result add: (k -> v).
	].
	
	
	"scaleHolder := Dictionary new.
	aDictionary
		keysDo: [ :key | 
			count := count + 1.
			scaleHolder at: key put: (aDictionary at: key).
			(count % 5 = 0 or: [ count = aDictionary size ])
				ifTrue: [ result add: (self computeAverage: scaleHolder).
					scaleHolder := Dictionary new ] ]."
	^ result asOrderedDictionary
]
