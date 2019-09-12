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
	table := self newTreeTable.
	
]

{ #category : #accessing }
CIMGroupPresenter >> model [
	^ model
]

{ #category : #accessing }
CIMGroupPresenter >> model: anObject [
	model := anObject.
	self setUpTable
]

{ #category : #initialization }
CIMGroupPresenter >> setUpTable [
	table
		roots: {model data};
		children: [ :aNode | aNode content ];
		beResizable;
		whenSelectionChangedDo: [ :selection | model leftUpdateWith: selection selectedItem ];
		activateOnDoubleClick
]

{ #category : #accessing }
CIMGroupPresenter >> table [
	^ table
]
