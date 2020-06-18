Class {
	#name : #SplitSimpleTicketsTimeSerie,
	#superclass : #Object,
	#instVars : [
		'time'
	],
	#category : #'CIMTicketsDataModelUtils-QueryUtils'
}

{ #category : #running }
SplitSimpleTicketsTimeSerie >> lowerToTime: aDictionary [
	^ self subclassResponsibility
]

{ #category : #running }
SplitSimpleTicketsTimeSerie >> runOn: aDictionary [
	^ {(self lowerToTime: aDictionary).
	(self uperToTime: aDictionary)} asOrderedCollection
]

{ #category : #accessing }
SplitSimpleTicketsTimeSerie >> time: aMonth [
	time := aMonth
]

{ #category : #running }
SplitSimpleTicketsTimeSerie >> uperToTime: aDictionary [
	^ self subclassResponsibility
]
