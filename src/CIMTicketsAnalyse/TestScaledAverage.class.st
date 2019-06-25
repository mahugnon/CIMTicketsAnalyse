Class {
	#name : #TestScaledAverage,
	#superclass : #TestCase,
	#category : #'CIMTicketsAnalyse-Test'
}

{ #category : #tests }
TestScaledAverage >> testScaledAverge [
	| dic scaledAvg |
	dic := Dictionary new
		at: 1 put: 1;
		at: 2 put: 2;
		at: 3 put: 3;
		at: 4 put: 4;
		at: 5 put: 5;
		at: 6 put: 6;
		at: 7 put: 7;
		at: 8 put: 8;
		at: 9 put: 9;
		at: 10 put: 10;
		at: 11 put: 11;
		yourself.
	scaledAvg := QueryMovingAverage new runOn: dic.
	self assert: scaledAvg size equals: 7.
	self assert: (scaledAvg at: 3) equals: 3.
	self assert: (scaledAvg at: 4) equals: 4.
	self assert: (scaledAvg at: 5) equals: 5.
	self assert: (scaledAvg at: 9) equals: 9.
]
