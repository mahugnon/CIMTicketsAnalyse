Class {
	#name : #CIMGroupPresenterModel,
	#superclass : #Object,
	#instVars : [
		'data',
		'roassalModel'
	],
	#category : #'CIMTicketsDataModelGui-Models'
}

{ #category : #accessing }
CIMGroupPresenterModel >> data [
	^ data
]

{ #category : #accessing }
CIMGroupPresenterModel >> data: anObject [
	data := anObject
]

{ #category : #accessing }
CIMGroupPresenterModel >> focus: aCIMTicketGroupNode [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
CIMGroupPresenterModel >> groupNodeFocus: aCIMTicketGroupNode [
	aCIMTicketGroupNode updateRoassalModel: roassalModel
]

{ #category : #initialization }
CIMGroupPresenterModel >> initialize [
	super initialize.
	roassalModel := RoassalPresenterModel new
		subcribe: self;
		yourself.
	data := CIMTicketGroupNode new
		tickets: Tbl allTickets;
		yourself
]

{ #category : #api }
CIMGroupPresenterModel >> leftUpdateWith: aCIMTicketsNode [
	aCIMTicketsNode updateRoassalModel: roassalModel
]

{ #category : #'as yet unclassified' }
CIMGroupPresenterModel >> notifyRoassalFocusChangeWith: aCIMMovingAverageNode [ 
	self shouldBeImplemented.
]

{ #category : #accessor }
CIMGroupPresenterModel >> roassalModel [
	^ roassalModel
]

{ #category : #api }
CIMGroupPresenterModel >> updateInteractionFocus: aCIMMovingAverageNode [
	self notifyRoassalFocusChangeWith: aCIMMovingAverageNode
]
