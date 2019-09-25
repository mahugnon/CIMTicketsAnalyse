Class {
	#name : #CIMWebModulesTimeSerieComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model',
		'kind'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #'as yet unclassified' }
CIMWebModulesTimeSerieComponent >> initialize [
	super initialize.
	self kind: self kinds anyOne
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeSerieComponent >> kind [
	^ kind
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeSerieComponent >> kind: aChartType [
	kind := aChartType
]

{ #category : #accessing }
CIMWebModulesTimeSerieComponent >> kinds [
	^ {ChartBar.
	ChartLine.
	ChartRadar}
]

{ #category : #accessing }
CIMWebModulesTimeSerieComponent >> model [
	^ model
]

{ #category : #accessing }
CIMWebModulesTimeSerieComponent >> model: aModel [
	model := aModel
]

{ #category : #rendering }
CIMWebModulesTimeSerieComponent >> renderContentOn: html [
	html mdlGrid
		with: [ html mdlCell
				size: 8;
				mdlTypographyTextCenter;
				with: [ html
						render:
							((MDLMenuButtonWidget
								possibilities: model modules
								label: #nom
								action: [ :module | model selectedModule: module ]
								selectedObject: model selectedModule
								choosingText: 'Select a module'
								description: 'Modules')
								sortBlock: [ :a :b | a name < b name ];
								yourself) ].
			self halt.
			html mdlCell
				size: 12;
				with: [ self renderOn: html plotFor: model selectedModule ] ]
]

{ #category : #rendering }
CIMWebModulesTimeSerieComponent >> renderDemoWithId: id with: renderingChartBlock on: html [
	html div
		id: id;
		style: 'display: flex; flex-direction: column; align-items: center;';
		with: [ renderingChartBlock value: html ]
]

{ #category : #rendering }
CIMWebModulesTimeSerieComponent >> renderOn: html plotFor: module [
	| renderingChartBlock id dataSet |
	dataSet := model dataSetForModule: module.
	renderingChartBlock := [ :canvas | 
	| chartData |
	chartData := (Chart2dData
		xObjects: dataSet first
		multiYObjects:
		{dataSet second.
	dataSet third})
		title: [ :sets | 'Spent time for ' , (sets collect: #name) asCommaStringAnd ];
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
CIMWebModulesTimeSerieComponent >> renderPossibleKindsUpdating: id with: renderingChartBlock on: html [
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
