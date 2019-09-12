Class {
	#name : #CIMPresenterGui,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'menu',
		'ticketNodesPresenter',
		'roassalSelectedNodePresenter',
		'roassalPresenter'
	],
	#category : #'CIMTicketsDataModelGui-Gui'
}

{ #category : #specs }
CIMPresenterGui class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #menu
			withConstraints: [ :constraints | constraints height: self toolbarHeight ];
		add:
			(SpPanedLayout newHorizontal
				position: 200;
				add:
					(SpBoxLayout newHorizontal
						add: #ticketNodesPresenter width: 450;
						yourself);
				add:
					(SpPanedLayout newHorizontal
						add: #roassalPresenter;
						add: #roassalSelectedNodePresenter;
						yourself);
				yourself);
		yourself
]

{ #category : #specs }
CIMPresenterGui class >> run [
	<example>
	self new openWithSpec
]

{ #category : #initialization }
CIMPresenterGui >> initializeMenu [
	menu := self mainMenu.
	menu applyTo: self
]

{ #category : #initialization }
CIMPresenterGui >> initializeRoassalPresenter [
	roassalPresenter := self
		instantiate: EvolutionTicketsTimeEstimMinusTimeDevPresenter.
	roassalPresenter model: model roassalModel.
	
]

{ #category : #initialization }
CIMPresenterGui >> initializeRoassalSelectedNodePresenter [
	roassalSelectedNodePresenter := self
		instantiate: CIMRoassalSelectedNodePresenter.
	roassalSelectedNodePresenter
		model:
			(CIMRoassalSelectedNodePresenterModel new
				data: #();
				roassalSelectedNodePresenter: roassalSelectedNodePresenter)
]

{ #category : #initialization }
CIMPresenterGui >> initializeTicketsGroupPresenter [
	ticketNodesPresenter := self instantiate: CIMGroupPresenter.
	ticketNodesPresenter model: model
]

{ #category : #initialization }
CIMPresenterGui >> initializeWidgets [
	model := CIMGroupPresenterModel new.
	self initializeTicketsGroupPresenter.
	self initializeRoassalPresenter.
	self initializeRoassalSelectedNodePresenter.
	self initializeMenu
]

{ #category : #initialization }
CIMPresenterGui >> mainMenu [
	| aMenu |
	aMenu := self newMenuBar
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: 'File';
						icon: (self iconNamed: #openIcon) ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Open file';
						icon: (self iconNamed: #openIcon);
						action: [ self inform: 'Open File' ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Save File';
						icon: (self iconNamed: #smallSaveIcon);
						action: [ self inform: 'Save File' ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Print file';
						icon: (self iconNamed: #smallPrintIcon);
						action: [ self inform: 'Print file' ] ] ];
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Undo';
						icon: (self iconNamed: #smallUndoIcon);
						action: [ self inform: 'Undo' ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Redo';
						icon: (self iconNamed: #smallRedoIcon);
						action: [ self inform: 'Redo' ] ] ];
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Add menu item';
						icon: (self iconNamed: #add) ] ].
	^ aMenu
]

{ #category : #accessing }
CIMPresenterGui >> roassaPresenter [
	^ roassalPresenter
]
