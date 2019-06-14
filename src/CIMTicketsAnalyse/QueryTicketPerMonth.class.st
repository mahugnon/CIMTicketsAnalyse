Class {
	#name : #QueryTicketPerMonth,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketPerMonth >> runOn: aCollection [
	^ ((aCollection groupedBy: [ :ticket | ticket month ]) associations
		sorted: [ :a :b | a key <= b key ]) asOrderedDictionary
]
