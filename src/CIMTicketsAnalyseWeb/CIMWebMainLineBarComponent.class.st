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
CIMWebMainLineBarComponent >> renderFillSpaceOn: html [
	html mdlCell
		size: 6;
		shadow: 8;
		style: 'background-color:white;';
		with: [ html mdlCell
				size: 12;
				mdlTypographyTitle;
				with: [ html text: 'Nombre de tickets:'.
					html space.
					html text: model selectedModule tickets size asString ].
			html mdlCell
				size: 12;
				mdlTypographyTitle;
				with: [ html text: 'Mise à jour le '.
					html space.
					html text: model lastUpdate asString ] ]
]

{ #category : #rendering }
CIMWebMainLineBarComponent >> renderModuleSelectionDropDown: html [
	html mdlCell
		size: 4;
		mdlTypographyTextCenter;
		with: [ html text: 'Affichage de :'.
			html space.
			html
				render:
					((MDLMenuButtonWidget
						possibilities: model closingQueries
						label: #queryName
						action: [ :query | model selectedClosingQuery: query ]
						selectedObject: model selectedClosingQuery
						choosingText: ''
						description: 'Selectionnez l''option d''affichage du resultat')
						sortBlock: [ :a :b | a < b ];
						yourself) ].
	html mdlCell
		size: 4;
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
						description: 'Selectionnez le module de Protect')
						sortBlock: [ :a :b | a name < b name ];
						yourself) ].
	html mdlCell
		size: 4;
		mdlTypographyTextCenter;
		with: [ html text: 'Année de début:'.
			html space.
			html
				render:
					((MDLMenuButtonWidget
						possibilities: model years
						label: [ :each | each start year asString ]
						action: [ :year | model selectedBeginYear: year ]
						selectedObject: model selectedBeginYear
						choosingText: ''
						description: 'Selectionnez l''année de début d''analyse')
						sortBlock: [ :a :b | a < b ];
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
				with: [ html render: each ] ].
			self renderFillSpaceOn: html.
]
