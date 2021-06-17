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
	modulesLineBar := CIMWebModulesBarLineComponent modules
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
		with: [ self renderModuleSelectionDropDown: html.
			self renderModulesLineBarOn: html ]
]

{ #category : #rendering }
CIMWebMainLineBarComponent >> renderModuleSelectionDropDown: html [
	html mdlCell
		size: 6;
		mdlTypographyTextCenter;
		with: [ html text: 'Module sélectionné:'.
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
						yourself) ].
	html mdlCell
		size: 6;
		mdlTypographyTextCenter;
		with: [ html text: 'Commencer par:'.
			html space.
			html
				render:
					((MDLMenuButtonWidget
						possibilities: model modules
						label: #nom
						action: [ :module | model selectedModule: module ]
						selectedObject: model selectedModule
						choosingText: ''
						description: 'years')
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
