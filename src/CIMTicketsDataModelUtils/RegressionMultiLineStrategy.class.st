Class {
	#name : #RegressionMultiLineStrategy,
	#superclass : #RegressionLineStrategy,
	#category : #CIMTicketsDataModelUtils
}

{ #category : #'as yet unclassified' }
RegressionMultiLineStrategy class >> isMultiRegressionLine [
	^ true
]

{ #category : #api }
RegressionMultiLineStrategy >> regression: regressionFunction [
	^ [ :x | 
	x < model releventYear
		ifTrue: [ x * regressionFunction first slope
				+ regressionFunction first intercept ].
	x > model releventYear
		ifTrue: [ x * regressionFunction second slope
				+ regressionFunction second intercept ].
	x = model releventYear
		ifTrue: [ 'NaN' ] ]
]
