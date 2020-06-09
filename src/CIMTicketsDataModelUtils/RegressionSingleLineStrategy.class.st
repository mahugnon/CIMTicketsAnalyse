Class {
	#name : #RegressionSingleLineStrategy,
	#superclass : #RegressionLineStrategy,
	#category : #'CIMTicketsDataModelUtils-RegressionLineStrategy'
}

{ #category : #'as yet unclassified' }
RegressionSingleLineStrategy class >> isMultiRegressionLine [
	^ false
]

{ #category : #api }
RegressionSingleLineStrategy >> regression: regressionFunction [
	^ [ :x | x * regressionFunction slope + regressionFunction intercept ]
]
