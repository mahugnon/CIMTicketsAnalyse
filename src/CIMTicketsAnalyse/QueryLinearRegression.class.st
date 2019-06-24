Class {
	#name : #QueryLinearRegression,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryLinearRegression >> runOn: aDictionary [
	| linReg slope intercept |
	linReg := PMLinearRegression new.
	aDictionary
		keysDo: [ :elt | linReg add: elt asSeconds @ (aDictionary at: elt) ].
	slope := linReg slope.
	intercept := linReg intercept.
	^ {('slope' -> slope).
	('intercept' -> intercept)} asOrderedDictionary
]
