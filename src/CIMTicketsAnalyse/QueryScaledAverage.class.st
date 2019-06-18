Class {
	#name : #QueryScaledAverage,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #'as yet unclassified' }
QueryScaledAverage >> computeAverage: aDictionary [
	^ (aDictionary keys at: (aDictionary size / 2 + 1) asInteger)
		-> (aDictionary sum / aDictionary size) asFloat
]

{ #category : #running }
QueryScaledAverage >> runOn: aDictionary [
	| result scaleHoleder count |
	result := OrderedCollection new.
	count := 0.
	scaleHoleder := Dictionary new.
	aDictionary
		keysDo: [ :key | 
			count := count + 1.
			scaleHoleder at: key put: (aDictionary at: key).
			(count % 5 = 0 or: [ count = aDictionary size ])
				ifTrue: [ result add: (self computeAverage: scaleHoleder).
					scaleHoleder := Dictionary new ] ].
	^ result asOrderedDictionary
]
