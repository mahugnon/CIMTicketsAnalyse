Class {
	#name : #QueryLinearRegression,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryLinearRegression >> runOn: aCollection [
	| linReg slope intercept |
	linReg := PMLinearRegression new.
	aCollection
		do: [ :aNode | 
			linReg
				add: aNode time asSeconds @ aNode value;
				yourself ].
	slope := linReg slope.
	intercept := linReg intercept.
	^ {('slope' -> slope).
	('intercept' -> intercept)} asOrderedDictionary
]
