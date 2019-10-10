Class {
	#name : #RegressionLineStrategy,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'CIMTicketsDataModelUtils-RegressionLineStrategy'
}

{ #category : #api }
RegressionLineStrategy class >> isMultiRegressionLine [
	^ self subclassResponsibility
]

{ #category : #api }
RegressionLineStrategy class >> regression: regressionFunction needMultipleRegression: aBoolean [
	| strategy |
	strategy := self strategy: aBoolean.
	^ strategy regression: regressionFunction 
]

{ #category : #api }
RegressionLineStrategy class >> strategy: aBoolean [
	^ (self subclasses
		detect: [ :each | each isMultiRegressionLine = aBoolean ]) new
]

{ #category : #initialization }
RegressionLineStrategy >> initialize [
	model := CIMWebTimeTotalMinusEstimChartModel current
]

{ #category : #api }
RegressionLineStrategy >> regression: regressionFunction [
	^ self subclassResponsibility
]
