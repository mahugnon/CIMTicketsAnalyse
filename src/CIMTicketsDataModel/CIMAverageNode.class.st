Class {
	#name : #CIMAverageNode,
	#superclass : #Object,
	#instVars : [
		'month',
		'tickets'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #adding }
CIMAverageNode >> addTicket: aTicket [
	tickets add: aTicket
]

{ #category : #adding }
CIMAverageNode >> addTickets: aCollection [
	tickets addAll: aCollection
]

{ #category : #initialization }
CIMAverageNode >> initialize [
	tickets := OrderedCollection new
]
