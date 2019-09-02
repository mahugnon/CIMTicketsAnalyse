Class {
	#name : #CIMGroupPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table',
		'data'
	],
	#category : #CIMTicketsDataModelGui
}

{ #category : #specs }
CIMGroupPresenter class >> defaultSpec [
	^ SpPanedLayout newHorizontal
		add: #table;
		yourself
]

{ #category : #examples }
CIMGroupPresenter class >> run [
	<example>
	self new openWithSpec
]

{ #category : #accessing }
CIMGroupPresenter >> data [
	^ data
]

{ #category : #accessing }
CIMGroupPresenter >> data: anObject [
	data := anObject
]

{ #category : #initialization }
CIMGroupPresenter >> initializeWidgets [
	data := CIMTicketGroupNode emptyGroup.
	table := self newTreeTable.
	table
		roots: {data};
		children: [ :node | data content ];
		beResizable;
		"contextMenu: self menu;"
			activateOnDoubleClick;
		whenActivatedDo: [ :selection | selection selectedItem browse ]
]

{ #category : #accessing }
CIMGroupPresenter >> table [
	^ table
]
