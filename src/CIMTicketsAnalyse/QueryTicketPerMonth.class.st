"
I group tickets per month. I have two options: 
 - You can choose to fill month gap between two month in original data 
 - You can choose to  order result
Ex: QueryTicketPerMonthClosing new fillGaps: true ; runOn: (QueryClosed runOn: (QueryEvolutions runOn: aTicketsCollection)).

"
Class {
	#name : #QueryTicketPerMonth,
	#superclass : #CIMAbstractQuery,
	#instVars : [
		'fillGaps',
		'ordered'
	],
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketPerMonth >> fillGap: aCollection [
	"aCollection of associations: month->value
	 if there is a gap between two monthes, create a new key with emty value for the missing month"
	| months dict |
	dict := aCollection asDictionary. 
	months := dict keys.
	(months min to: months max) monthsDo: [ :each | dict at: each ifAbsentPut: Set new ].
	^dict associations
]

{ #category : #accessing }
QueryTicketPerMonth >> fillGaps: boolean [
	fillGaps := boolean 
]

{ #category : #initialization }
QueryTicketPerMonth >> initialize [
	fillGaps := false.
	ordered := true
]

{ #category : #running }
QueryTicketPerMonth >> month: aTicket [
	self subclassResponsibility 
]

{ #category : #accessing }
QueryTicketPerMonth >> ordered: boolean [
	ordered := boolean
]

{ #category : #running }
QueryTicketPerMonth >> runOn: aCollection [
	| result |
	result := (aCollection asOrderedCollection groupedBy: [ :ticket | self month: ticket ]) associations reject: [ :assoc | assoc key isNil ].
	fillGaps ifTrue: [ result := self fillGap: result ].
	ordered ifTrue: [ result := result sorted: [ :a :b | a key <= b key ]].
	^ result asOrderedDictionary
]
