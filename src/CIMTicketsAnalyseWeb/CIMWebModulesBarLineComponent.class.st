Class {
	#name : #CIMWebModulesBarLineComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model',
		'kind'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #accessing }
CIMWebModulesBarLineComponent class >> modules [
	^ ((self subclasses select: #toRender)
		sorted: [ :a :b | a name < b name ]) asOrderedCollection
		collect: #new
]

{ #category : #accessing }
CIMWebModulesBarLineComponent class >> toRender [
	^ true
]

{ #category : #'private-api' }
CIMWebModulesBarLineComponent >> applyStyleTo: aChartData [
	| styleForPersons |
	styleForPersons := self defineStyleColors.
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

{ #category : #'private-api' }
CIMWebModulesBarLineComponent >> bugsEvolutionLinearRegression [
	| keys |
	keys := self dataSet first.
	^ {('Bugs regression'
		->
			(QueryLinearRegression new
				runOn1:
					(OrderedDictionary
						newFromKeys: keys
						andValues: self dataSet second value))).
	('Evolution regression'
		->
			(QueryLinearRegression new
				runOn1:
					(OrderedDictionary
						newFromKeys: keys
						andValues: self dataSet third value)))} asOrderedDictionary
]

{ #category : #accessing }
CIMWebModulesBarLineComponent >> dataSet [
	^ model dataSet
]

{ #category : #'private-api' }
CIMWebModulesBarLineComponent >> defineStyleColors [
	^ Dictionary new
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
		yourself
]

{ #category : #rendering }
CIMWebModulesBarLineComponent >> description [
	^ self subclassResponsibility
]

{ #category : #initialization }
CIMWebModulesBarLineComponent >> initialize [
	super initialize.
	self kind: self kinds anyOne.
	model := CIMWebMainLineBarModel current
]

{ #category : #'private-api' }
CIMWebModulesBarLineComponent >> kind [
	^ kind
]

{ #category : #'private-api' }
CIMWebModulesBarLineComponent >> kind: aChartType [
	kind := aChartType
]

{ #category : #accessing }
CIMWebModulesBarLineComponent >> kinds [
	^ {ChartLine.
	ChartBar}
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
CIMWebModulesBarLineComponent >> prepareCharDataSet [
	^ {((ChartDataSetSequence
		name: self dataSet second key
		sequence: self dataSet second value)
		setOption: #fill to: false;
		setOption: #backgroundColor to: Color red;
		setOption: #borderColor to: Color red;
		setOption: #pointHoverBackgroundColor to: Color white;
		setOption: #pointHoverBorderColor to: Color red;
		setOption: #pointHoverBorderWidth to: 10;
		setOption: #borderWidth to: 1)} , self regressionFunctions
]

{ #category : #rendering }
CIMWebModulesBarLineComponent >> regressionFunctions [
	| regression |
	regression := self bugsEvolutionLinearRegression.
	^ {((ChartDataSetSequence
		name: self dataSet third key
		sequence: self dataSet third value)
		setOption: #fill to: false;
		setOption: #backgroundColor to: Color blue;
		setOption: #borderColor to: Color blue;
		setOption: #pointHoverBackgroundColor to: Color white;
		setOption: #pointHoverBorderColor to: Color blue;
		setOption: #pointHoverBorderWidth to: 10;
		setOption: #borderWidth to: 1).
	((ChartDataSetFunction new
		function:
		(RegressionLineStrategy
		regression: (regression at: 'Bugs regression')
		needMultipleRegression: model needMultiRegressionLine))
		name: 'Bugs approximation line';
		setOption: #fill to: false;
		setOption: #pointBorderWidth to: 0.5;
		setOption: #backgroundColor to: Color red;
		setOption: #borderColor to: Color red;
		setOption: #pointHoverBorderWidth to: 1).
	((ChartDataSetFunction new
		function:
		(RegressionLineStrategy
		regression: (regression at: 'Evolution regression')
		needMultipleRegression: model needMultiRegressionLine))
		setOption: #fill to: false;
		name: 'Evolution approximation line';
		setOption: #pointBorderWidth to: 0.5;
		setOption: #backgroundColor to: Color blue;
		setOption: #borderColor to: Color blue;
		setOption: #borderWidth to: 2)}
]

{ #category : #rendering }
CIMWebModulesBarLineComponent >> renderContentOn: html [
	html mdlGrid
		with: [ html mdlCell
				size: 8;
				mdlTypographyTitle;
				with: self description, ' (' ,self yAxesLegend, ' )'.
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
	| renderingChartBlock id |
	renderingChartBlock := [ :canvas | 
	| chartData |
	chartData := ChartData new
		xObjects: self dataSet first;
		dataSets: self prepareCharDataSet;
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

{ #category : #'as yet unclassified' }
CIMWebModulesBarLineComponent >> yAxesLegend [
^'hour'
]
