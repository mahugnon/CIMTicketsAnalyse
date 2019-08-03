Class {
	#name : #TicketConstatIleLandAbstractVisitor,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyseConstatGrammar-Parser'
}

{ #category : #helpers }
TicketConstatIleLandAbstractVisitor >> visit: aChildNode [
	^ aChildNode ifNotNil: [ aChildNode acceptVisitor: self ]
]

{ #category : #helpers }
TicketConstatIleLandAbstractVisitor >> visitAll: childrenNodes [
	childrenNodes
		ifNotNil: [ childrenNodes do: [ :aChildNode | aChildNode acceptVisitor: self ] ]
]

{ #category : #visiting }
TicketConstatIleLandAbstractVisitor >> visitPTASTConstat: aPTASTConstat [
	<generated>
	self visitAll: aPTASTConstat constats.
]

{ #category : #visiting }
TicketConstatIleLandAbstractVisitor >> visitPTASTFiche: aPTASTFiche [
	<generated>
	self visit: aPTASTFiche ticketNumber.
]

{ #category : #visiting }
TicketConstatIleLandAbstractVisitor >> visitPTASTTicketNumber: anPTASTTicketNumber [
	<generated>
	^ anPTASTTicketNumber ticketNumber
]

{ #category : #visiting }
TicketConstatIleLandAbstractVisitor >> visitPTASTWater: anPTASTWater [
	<generated>
	^ anPTASTWater water
]
