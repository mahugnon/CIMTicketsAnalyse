Class {
	#name : #CIMGroupPresenterModel,
	#superclass : #Object,
	#instVars : [
		'data',
		'roassalModel',
		'listeners'
	],
	#category : #'CIMTicketsDataModelGui-Models'
}

{ #category : #adding }
CIMGroupPresenterModel >> addListener: aListener [
	listeners add: aListener
]

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
	listeners := OrderedCollection new.
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
	listeners
		do: [ :each | each updateRoassalFocusNodeWith: aCIMMovingAverageNode ]
]

{ #category : #accessor }
CIMGroupPresenterModel >> roassalModel [
	^ roassalModel
]

{ #category : #api }
CIMGroupPresenterModel >> subscribe: aCIMPresenter [
	self addListener: aCIMPresenter
]

{ #category : #api }
CIMGroupPresenterModel >> updateInteractionFocus: aCIMMovingAverageNode [
	self notifyRoassalFocusChangeWith: aCIMMovingAverageNode
]
