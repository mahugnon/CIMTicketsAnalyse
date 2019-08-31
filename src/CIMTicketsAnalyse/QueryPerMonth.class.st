"
I group tickets per month. I have two options: 
 - You can choose to fill month gap between two month in original data 
 - You can choose to  order result
Ex: QueryTicketPerMonthClosing new fillGaps: true ; runOn: (QueryClosed runOn: (QueryEvolutions runOn: aTicketsCollection)).

"
Class {
	#name : #QueryPerMonth,
	#superclass : #CIMAbstractQuery,
	#instVars : [
		'fillGaps',
		'ordered'
	],
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryPerMonth >> fillGap: aCollection [
	"aCollection of associations: month->value
	 if there is a gap between two monthes, create a new key with empty value for the missing month"
	| months dict |
	dict := aCollection asDictionary. 
	months := dict keys.
	(months min to: months max) monthsDo: [ :each | dict at: each ifAbsentPut: Set new ].
	^dict associations
]

{ #category : #accessing }
QueryPerMonth >> fillGaps: boolean [
	fillGaps := boolean 
]

{ #category : #initialization }
QueryPerMonth >> initialize [
	fillGaps := false.
	ordered := true
]

{ #category : #running }
QueryPerMonth >> month: aTicket [
	self subclassResponsibility 
]

{ #category : #accessing }
QueryPerMonth >> ordered: boolean [
	ordered := boolean
]

{ #category : #running }
QueryPerMonth >> runOn: aCollection [
	| result |
	result := (aCollection asOrderedCollection
		groupedBy: [ :ticket | self month: ticket ]) associations
		reject: [ :assoc | assoc key isNil ].
	fillGaps
		ifTrue: [ result := self fillGap: result ].
	ordered
		ifTrue: [ result := result sorted: [ :a :b | a key <= b key ] ].
	^ CIMTicketGroupNode groupsFrom: result asOrderedDictionary
]
