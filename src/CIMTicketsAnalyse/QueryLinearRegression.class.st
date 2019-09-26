Class {
	#name : #QueryLinearRegression,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryLinearRegression >> runOn1: aDictionary [
	| linReg convertKey |
	linReg := PMLinearRegression new.
	aDictionary
		keysDo: [ :key | 
			convertKey := key isInteger
				ifFalse: [ key asSeconds ]
				ifTrue: [ key ].
			linReg
				add: convertKey @ (aDictionary at: key);
				yourself ].
	^ linReg
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
