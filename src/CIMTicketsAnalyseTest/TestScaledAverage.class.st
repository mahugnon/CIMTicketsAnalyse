Class {
	#name : #TestScaledAverage,
	#superclass : #TestCase,
	#category : #CIMTicketsAnalyseTest
}

{ #category : #tests }
TestScaledAverage >> testScaledAverge [
	| col scaledAvg |
	col := OrderedCollection new.
	1 to: 11 do: [ :i | 
		col
			add:
				(CIMAverageNode new
					value: i;
					time: i;
					yourself) ].
	scaledAvg := ((QueryMovingAverage new runOn: col)
		collect: [ :node | node time -> node value ]) asOrderedDictionary.
	self assert: scaledAvg size equals: 7.
	self assert: (scaledAvg at: 3) value equals: 3.
	self assert: (scaledAvg at: 4) value equals: 4.
	self assert: (scaledAvg at: 5) value equals: 5.
	self assert: (scaledAvg at: 9) value equals: 9
]
