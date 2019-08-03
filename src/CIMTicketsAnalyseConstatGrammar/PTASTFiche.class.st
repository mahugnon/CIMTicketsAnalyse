Class {
	#name : #PTASTFiche,
	#superclass : #Object,
	#instVars : [
		'ticketNumber'
	],
	#category : #'CIMTicketsAnalyseConstatGrammar-Parser'
}

{ #category : #visiting }
PTASTFiche >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTFiche: self
]

{ #category : #accessing }
PTASTFiche >> ticketNumber [
	^ ticketNumber
]

{ #category : #accessing }
PTASTFiche >> ticketNumber: anObject [
	ticketNumber := anObject
]
