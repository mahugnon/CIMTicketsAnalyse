Class {
	#name : #CIMGroupPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table',
		'data',
		'model'
	],
	#category : #'CIMTicketsDataModelGui-Gui'
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
		children: [ :aNode | aNode content ];
		beResizable;
		"	whenActivatedDo: [ :selection | selection selectedItem  ]"
			activateOnDoubleClick
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
