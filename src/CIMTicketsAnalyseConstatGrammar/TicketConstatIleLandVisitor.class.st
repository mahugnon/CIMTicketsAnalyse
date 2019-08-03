Class {
	#name : #TicketConstatIleLandVisitor,
	#superclass : #TicketConstatIleLandAbstractVisitor,
	#instVars : [
		'ticket'
	],
	#category : #'CIMTicketsAnalyseConstatGrammar-Parser'
}

{ #category : #'as yet unclassified' }
TicketConstatIleLandVisitor >> ensureEntityWithType: aType number: aNumber inModel: model [
	^ (model entityStorage selectAllWithType: aType)
		detect: [ :entity | entity number = aNumber ]
		ifNone: [ aType new
				number: aNumber;
				mooseModel: model;
				yourself ]
]

{ #category : #accessing }
TicketConstatIleLandVisitor >> ticket [
	^ ticket
]

{ #category : #accessing }
TicketConstatIleLandVisitor >> ticket: anObject [
	ticket := anObject
]

{ #category : #visiting }
TicketConstatIleLandVisitor >> visitPTASTTicketNumber: anPTASTTicketNumber [
	| dependent model |
	model := MooseModel new.
	dependent := FamixTkTicket new
		number: ticket ft_id;
		mooseModel: model.
	FamixTkTicketDependecy new
		dependedTicket:
			(self
				ensureEntityWithType: FamixTkTicket
				number: (super visitPTASTTicketNumber: anPTASTTicketNumber)
				inModel: model);
		dependent: dependent;
		mooseModel: model.
	ticket dependenceModel: model
]
