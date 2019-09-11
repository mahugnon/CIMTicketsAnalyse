Class {
	#name : #CIMPresenterGuiModel,
	#superclass : #SpPresenter,
	#instVars : [
		'data'
	],
	#category : #'CIMTicketsDataModelGui-Gui'
}

{ #category : #accessing }
CIMPresenterGuiModel >> data [
	^ data
]

{ #category : #initialization }
CIMPresenterGuiModel >> initialize [
	super initialize.
	data := CIMTicketGroupNode new
		tickets: Tbl allTickets;
		yourself
]
