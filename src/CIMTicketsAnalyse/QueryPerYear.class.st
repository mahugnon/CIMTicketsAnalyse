Class {
	#name : #QueryPerYear,
	#superclass : #CIMAbstractQuery,
	#instVars : [
		'fillGaps',
		'ordered'
	],
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryPerYear >> fillGap: aCollection [
	"aCollection of associations: month->value
	 if there is a gap between two monthes, create a new key with empty value for the missing month"

	| years dict |
	dict := aCollection asDictionary.
	years := dict keys.
	(years min to: years max)
		yearsDo: [ :each | dict at: each ifAbsentPut: Set new ].
	^ dict associations
]

{ #category : #accessing }
QueryPerYear >> fillGaps: boolean [
	fillGaps := boolean 
]

{ #category : #initialization }
QueryPerYear >> initialize [
	fillGaps := false.
	ordered := true
]

{ #category : #accessing }
QueryPerYear >> ordered: boolean [
	ordered := boolean
]

{ #category : #running }
QueryPerYear >> runOn: aCIMTicketGroup [
	| result |
	result := (aCIMTicketGroup tickets asOrderedCollection
		groupedBy: [ :ticket | self year: ticket ]) associations
		reject: [ :assoc | assoc key isNil ].
	fillGaps
		ifTrue: [ result := self fillGap: result ].
	ordered
		ifTrue: [ result := result sorted: [ :a :b | a key <= b key ] ].
	^ CIMTicketGroupNode groupsFrom: result asOrderedDictionary
]

{ #category : #running }
QueryPerYear >> year: aTicket [
	self subclassResponsibility 
]
