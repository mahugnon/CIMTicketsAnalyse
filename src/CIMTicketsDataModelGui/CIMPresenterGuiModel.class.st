Class {
	#name : #CIMPresenterGuiModel,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'CIMTicketsDataModelGui-Models'
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
