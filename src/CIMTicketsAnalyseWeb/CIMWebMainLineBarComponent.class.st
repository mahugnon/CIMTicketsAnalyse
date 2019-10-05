Class {
	#name : #CIMWebMainLineBarComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model',
		'modulesLineBar'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #hooks }
CIMWebMainLineBarComponent >> children [
	^ modulesLineBar
]

{ #category : #rendering }
CIMWebMainLineBarComponent >> createModulesLineBars [
	modulesLineBar := CIMWebModulesBarLineComponent subclasses
		collect: #new
]

{ #category : #initialization }
CIMWebMainLineBarComponent >> initialize [
	super initialize.
	self initializeModel.
	self createModulesLineBars
]

{ #category : #initialization }
CIMWebMainLineBarComponent >> initializeModel [
	model := CIMWebMainLineBarModel current
]

{ #category : #rendering }
CIMWebMainLineBarComponent >> renderContentOn: html [
	html mdlGrid
		with: [ "self renderModuleSelectionDropDown: html."
			self renderTabBarOn: html.
			self renderModulesLineBarOn: html ]
]

{ #category : #rendering }
CIMWebMainLineBarComponent >> renderModuleSelectionDropDown: html [
	html mdlCell
		size: 8;
		mdlTypographyTextCenter;
		with: [ html text: 'Selected module:'.
			html space.
			html
				render:
					((MDLMenuButtonWidget
						possibilities: model modules
						label: #nom
						action: [ :module | model selectedModule: module ]
						selectedObject: model selectedModule
						choosingText: ''
						description: 'Modules')
						sortBlock: [ :a :b | a name < b name ];
						yourself) ]
]

{ #category : #rendering }
CIMWebMainLineBarComponent >> renderModulesLineBarOn: html [
	modulesLineBar
		do: [ :each | 
			html mdlCell
				size: 6;
				shadow: 8;
				style: 'background-color:white;';
				with: [ html render: each ] ]
]

{ #category : #rendering }
CIMWebMainLineBarComponent >> renderTabBarOn: html [
	html
		render:
			((MDLNestedList elements: model modules)
				listStyle: #demo;
				format: #nom;
				actionBlock: [ :module | model selectedModule: module ];
				selectedEntity: model selectedModule;
				yourself);
		leftPanelResizer
]
