Class {
	#name : #QueryTicketPerMonth,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketPerMonth >> runOn: aCollection [
	^ (((aCollection groupedBy: [ :ticket | self month: ticket ]) associations reject: [ :assoc | assoc key isNil ])
		sorted: [ :a :b | a key <= b key ]) asOrderedDictionary
]
