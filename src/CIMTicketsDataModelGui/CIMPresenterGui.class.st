Class {
	#name : #CIMPresenterGui,
	#superclass : #SpPresenter,
	#instVars : [
		'roassalPresenterList',
		'roassaPresenter',
		'model',
		'menu',
		'nodePresenter'
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
						add: #roassalPresenterList width: 450;
						yourself);
				add:
					(SpPanedLayout newHorizontal
						add: #roassaPresenter;
						add: #nodePresenter;
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
CIMPresenterGui >> initializeWidgets [
	model := CIMPresenterGuiModel new.
	menu := self mainMenu.
	roassalPresenterList := self instantiate: CIMGroupPresenter.
	roassalPresenterList model: model.
	roassaPresenter := self instantiate: EvolutionTicketsTimeEstimMinusTimeDevPresenter.
	nodePresenter := self newList.
	menu applyTo: self
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
	^ roassaPresenter
]
