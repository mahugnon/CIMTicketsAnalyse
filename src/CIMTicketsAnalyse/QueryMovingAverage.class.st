Class {
	#name : #QueryMovingAverage,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryMovingAverage >> runOn: aDictionary [
	| result |
	result := OrderedCollection new.
	1 to: aDictionary size - 4 do: [ :i | 
		| k v |
		k := aDictionary keys at: i + 2.
		v := (aDictionary values copyFrom: i to: i + 4) average.
		result add: k -> v ].
	^ result asOrderedDictionary
]
