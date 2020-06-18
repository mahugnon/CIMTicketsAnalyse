Class {
	#name : #RegressionMultiLineStrategy,
	#superclass : #RegressionLineStrategy,
	#category : #'CIMTicketsDataModelUtils-RegressionLineStrategy'
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
				+ regressionFunction first intercept ]
		ifFalse: [ x > model releventYear
				ifTrue: [ x * regressionFunction second slope
						+ regressionFunction second intercept ]
				ifFalse: [ 'NaN' ] ] ]
]
