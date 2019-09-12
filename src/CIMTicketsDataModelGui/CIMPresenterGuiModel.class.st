Class {
	#name : #CIMPresenterGuiModel,
	#superclass : #Object,
	#instVars : [
		'data',
		'roassalModel'
	],
	#category : #'CIMTicketsDataModelGui-Models'
}

{ #category : #accessing }
CIMPresenterGuiModel >> data [
	^ data
]

{ #category : #accessing }
CIMPresenterGuiModel >> focus: aCIMTicketGroupNode [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
CIMPresenterGuiModel >> groupNodeFocus: aCIMTicketGroupNode [
	aCIMTicketGroupNode updateRoassalModel: roassalModel
]

{ #category : #initialization }
CIMPresenterGuiModel >> initialize [
	super initialize.
	roassalModel := RoassalPresenterModel new.
	data := CIMTicketGroupNode new
		tickets: Tbl allTickets;
		yourself
]

{ #category : #accessor }
CIMPresenterGuiModel >> roassalModel [
	^ roassalModel
]

{ #category : #api }
CIMPresenterGuiModel >> updateWith: aCIMTicketsNode [
	aCIMTicketsNode updateRoassalModel: roassalModel
]
