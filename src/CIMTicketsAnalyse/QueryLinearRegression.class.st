Class {
	#name : #QueryLinearRegression,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryLinearRegression >> runOn1: aDictionary [
	| linReg slope intercept |
	linReg := PMLinearRegression new.
	aDictionary
		keysDo: [ :key | 
			linReg
				add: key asSeconds @ (aDictionary at: key);
				yourself ].
	slope := linReg slope.
	intercept := linReg intercept.
	^ {('slope' -> slope).
	('intercept' -> intercept)} asOrderedDictionary
]

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
