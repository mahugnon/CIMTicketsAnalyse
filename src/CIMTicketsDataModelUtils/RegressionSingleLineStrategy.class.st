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
	^ [ :x | 
	x start asSeconds * regressionFunction slope
		+ regressionFunction intercept ]
]
