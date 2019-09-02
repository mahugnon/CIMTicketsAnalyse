Class {
	#name : #CIMPresenterGuiModel,
	#superclass : #SpPresenter,
	#instVars : [
		'dataWidget'
	],
	#category : #CIMTicketsDataModelGui
}

{ #category : #accessing }
CIMPresenterGuiModel >> dataWidget [
	^ dataWidget
]

{ #category : #accessing }
CIMPresenterGuiModel >> dataWidget: anObject [
	dataWidget := anObject
]

{ #category : #initialization }
CIMPresenterGuiModel >> initialize [
	super initialize.
	dataWidget := CIMTicketGroupNode new
		tickets: Tbl allTickets;
		acceptBuider: GuiBuilder new.
]
