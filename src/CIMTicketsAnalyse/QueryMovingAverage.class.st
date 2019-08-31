Class {
	#name : #QueryMovingAverage,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryMovingAverage >> runOn1: aDictionary [
	| result |
	result := OrderedCollection new.
	1 to: aDictionary size - 4 do: [ :i | 
		| k v |
		k := aDictionary keys at: i + 2.
		v := (aDictionary values copyFrom: i to: i + 4) average.
		result add: k -> v ].
	^ result asOrderedDictionary
]

{ #category : #running }
QueryMovingAverage >> runOn: aCollection [
	| result |
	result := OrderedCollection new.
	1 to: aCollection size - 4 do: [ :i | 
		| k v |
		k := aCollection at: i + 2.
		v := aCollection copyFrom: i to: i + 4.
		result
			add:
				(CIMMovingAverageNode new
					averageNodes: v;
					value: (v collect: [ :node | node value ]) average;
					time: k time;
					yourself) ].
	^ result asOrderedCollection
]
