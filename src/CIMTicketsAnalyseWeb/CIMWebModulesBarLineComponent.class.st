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
CIMWebModulesBarLineComponent >> applyStyleTo: aChartData [
	| styleForPersons |
	styleForPersons := Dictionary new
		add:
			'Evolutions'
				->
					(Dictionary
						with: #pointColor -> Color blue
						with: #strokeColor -> Color blue);
		add:
			'Bugs'
				->
					(Dictionary
						with: #pointColor -> Color red
						with: #strokeColor -> Color red);
		add:
			'Bugs regression'
				->
					(Dictionary
						with: #pointColor -> Color red
						with: #strokeColor -> Color red);
		add:
			'Evolution regression'
				->
					(Dictionary
						with: #pointColor -> Color blue
						with: #strokeColor -> Color blue);
		yourself.
	aChartData dataSets
		do: [ :set | 
			set styleSheet
				pointColor: [ :keys :values :label | (styleForPersons at: label) at: #pointColor ];
				strokeColor:
						[ :keys :values :label | (styleForPersons at: label) at: #strokeColor ];
				pointStrokeColor: Color white;
				fillColor: (Color white alpha: 0.4);
				pointHighlightFill: Color white;
				pointHighlightStroke: Color black ]
]

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
	^ {ChartLine.
	ChartBar}
]

{ #category : #'as yet unclassified' }
CIMWebModulesBarLineComponent >> linearRegressionCaracteristcs [
	| keys |
	keys := self chartDataSet first.
	^ {('Bugs regression'
		->
			(QueryLinearRegression new
				runOn1:
					(OrderedDictionary
						newFromKeys: keys
						andValues: self chartDataSet second value))).
	('Evolution regression'
		->
			(QueryLinearRegression new
				runOn1:
					(OrderedDictionary
						newFromKeys: keys
						andValues: self chartDataSet third value)))} asOrderedDictionary
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
				with: [ html text: 'Select a module'.
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
				size: 12;
				with: [ self renderSelectedModulePlotOn: html ] ]
]

{ #category : #rendering }
CIMWebModulesBarLineComponent >> renderDemoWithId: id with: renderingChartBlock on: html [
	html div
		id: id;
		style: 'display: flex; flex-direction: column; align-items: center;';
		with: [ renderingChartBlock value: html ]
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
									html space: 2.
									html text: each displayName ] ] ] ]
]

{ #category : #rendering }
CIMWebModulesBarLineComponent >> renderSelectedModulePlotOn: html [
	| renderingChartBlock id dataSet regression |
	regression := self linearRegressionCaracteristcs.
	dataSet := model chartDataSet.
	renderingChartBlock := [ :canvas | 
	| chartData |
	chartData := (Chart2dData
		xObjects: dataSet first
		multiYObjects:
		{dataSet second.
	dataSet third})
		multiValueTooltip: '<label> spent <value> hours in <key>';
		chartType: self kind;
		yourself.
	chartData dataSets
		addLast:
			(ChartDataSetFunction new
				function: [ :x | 
					x * (regression at: 'Bugs regression') slope
						+ (regression at: 'Bugs regression') intercept ];
				color: (Color red alpha: 0.1);
				name: 'Bugs regression').
	chartData dataSets
		addLast:
			(ChartDataSetFunction new
				function: [ :x | 
					x * (regression at: 'Evolution regression') slope
						+ (regression at: 'Evolution regression') intercept ];
				color: (Color blue alpha: 0.1);
				name: 'Evolution regression').
	self applyStyleTo: chartData.
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
