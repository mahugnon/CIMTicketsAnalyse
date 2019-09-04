Class {
	#name : #CIMGroupPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table',
		'data',
		'model'
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

{ #category : #initialization }
CIMGroupPresenter >> initializeWidgets [
	model := CIMPresenterGuiModel new.
	table := self newTreeTable.
	table
		roots: {model data};
		children: [ :aClass | aClass content ];
		beResizable;
		activateOnDoubleClick;
		whenActivatedDo: [ :selection | selection selectedItem browse ]
]

{ #category : #accessing }
CIMGroupPresenter >> model [
	^ model
]

{ #category : #accessing }
CIMGroupPresenter >> model: anObject [
	model := anObject
]

{ #category : #accessing }
CIMGroupPresenter >> table [
	^ table
]
