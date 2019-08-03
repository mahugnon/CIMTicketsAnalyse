Class {
	#name : #PTASTTicketNumber,
	#superclass : #Object,
	#instVars : [
		'ticketNumber'
	],
	#category : #'CIMTicketsAnalyseConstatGrammar-Parser'
}

{ #category : #visiting }
PTASTTicketNumber >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTTicketNumber: self
]

{ #category : #accessing }
PTASTTicketNumber >> ticketNumber [
	^ ticketNumber
]

{ #category : #accessing }
PTASTTicketNumber >> ticketNumber: anObject [
	ticketNumber := anObject
]
