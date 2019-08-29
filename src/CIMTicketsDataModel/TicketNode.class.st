Class {
	#name : #TicketNode,
	#superclass : #Object,
	#instVars : [
		'month',
		'ticket'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #visiting }
TicketNode >> acceptBuider: aGuiBuilder [
	aGuiBuilder buildTicketNode
]
