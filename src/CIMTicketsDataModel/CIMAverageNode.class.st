Class {
	#name : #CIMAverageNode,
	#superclass : #TicketNode,
	#instVars : [
		'tickets'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #visiting }
CIMAverageNode >> acceptBuider: aGuiBuilder [
	aGuiBuilder buildAverageNode
]

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
