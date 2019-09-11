Class {
	#name : #CIMConstatAnalyser,
	#superclass : #Object,
	#category : #'CIMTicketsDataModelUtils-DataProcessing'
}

{ #category : #'as yet unclassified' }
CIMConstatAnalyser >> analyse: aTicket [
	| ast |
	ast := TicketConstatIleLandParser parse: aTicket ft_constat.
	ast acceptVisitor: (TicketConstatIleLandVisitor new ticket: aTicket)
]
