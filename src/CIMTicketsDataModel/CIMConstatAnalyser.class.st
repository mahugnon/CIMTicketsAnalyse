Class {
	#name : #CIMConstatAnalyser,
	#superclass : #Object,
	#category : #'CIMTicketsDataModel-Utils'
}

{ #category : #'as yet unclassified' }
CIMConstatAnalyser >> analyse: aTicket [
	| ast |
	ast := TicketConstatIleLandParser parse: aTicket ft_constat.
	ast acceptVisitor: (TicketConstatIleLandVisitor new ticket: aTicket)
]
