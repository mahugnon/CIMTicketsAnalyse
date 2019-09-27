Class {
	#name : #CIMWebModulesBarLineComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model',
		'kind'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #'as yet unclassified' }
CIMWebModulesBarLineComponent >> initialize [
	super initialize.
	self kind: self kinds anyOne.
	model := CIMWebLineBarModel current
]

{ #category : #'as yet unclassified' }
CIMWebModulesBarLineComponent >> kind [
	^ kind
]

{ #category : #'as yet unclassified' }
CIMWebModulesBarLineComponent >> kind: aChartType [
	kind := aChartType
]

{ #category : #accessing }
CIMWebModulesBarLineComponent >> kinds [
	^ {ChartBar.
	ChartLine.
	ChartRadar}
]

{ #category : #accessing }
CIMWebModulesBarLineComponent >> model [
	^ model
]

{ #category : #accessing }
CIMWebModulesBarLineComponent >> model: aModel [
	model := aModel
]

{ #category : #rendering }
CIMWebModulesBarLineComponent >> renderContentOn: html [
	html mdlGrid
		with: [ html mdlCell
				size: 8;
				mdlTypographyTitle;
				with: 'Time spent on bugs for ' , model selectedModule nom.
			html mdlCell
				size: 8;
				mdlTypographyTextCenter;
				with: [ 
					html text: 'Select a module'.
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
										yourself)  ].
			html mdlCell
				size: 12;
				with: [ self renderOn: html plotFor: model selectedModule ] ]
]

{ #category : #rendering }
CIMWebModulesBarLineComponent >> renderDemoWithId: id with: renderingChartBlock on: html [
	html div
		id: id;
		style: 'display: flex; flex-direction: column; align-items: center;';
		with: [ renderingChartBlock value: html ]
]

{ #category : #rendering }
CIMWebModulesBarLineComponent >> renderOn: html plotFor: module [
	| renderingChartBlock id dataSet |
	dataSet := model dataSetForModule: module.
	renderingChartBlock := [ :canvas | 
	| chartData |
	chartData := (Chart2dData
		xObjects: dataSet first
		multiYObjects:
		{dataSet second.
	dataSet third})
		multiValueTooltip: '<label> spent <value> min in <key>';
		chartType: self kind;
		yourself.
	html
		render:
			(ChartJsComponent
				data: chartData
				callback: [ :value :label | value -> label ]) ].
	id := html nextId.
	self
		renderPossibleKindsUpdating: id
		with: renderingChartBlock
		on: html.
	self renderDemoWithId: id with: renderingChartBlock on: html
]

{ #category : #rendering }
CIMWebModulesBarLineComponent >> renderPossibleKindsUpdating: id with: renderingChartBlock on: html [
	html form
		style: 'display: flex; justify-content: space-around; margin-bottom: 20px;';
		with: [ html radioGroup
				selected: self kind;
				callback: [ :k | self kind: k ];
				with: [ :group | 
					self kinds
						do: [ :each | 
							html
								label: [ html radioButton
										group: group;
										value: each;
										onChange:
											(html jQuery ajax
												serializeThis;
												onComplete:
													((html jQuery id: id) load html: [ :r | renderingChartBlock value: r ])).
									html text: each displayName ] ] ] ]
]
