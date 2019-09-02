Class {
	#name : #GuiBuilder,
	#superclass : #Object,
	#category : #CIMTicketsDataModelGui
}

{ #category : #'as yet unclassified' }
GuiBuilder >> buildTicketGroupNode: aCIMTicketGroup [
	^ CIMGroupPresenter new
		data: aCIMTicketGroup;
		yourself
]
