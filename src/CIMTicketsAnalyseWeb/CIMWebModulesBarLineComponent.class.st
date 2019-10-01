Class {
	#name : #CIMWebModulesBarLineComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model',
		'kind'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

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

{ #category : #accessing }
CIMWebModulesBarLineComponent >> chartDataSet [
	^ model chartDataSet
]

{ #category : #'private-api' }
CIMWebModulesBarLineComponent >> defineStyleColors [
	^ self subclassResponsibility
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

{ #category : #'private-api' }
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
				with: self description , model selectedModule nom.
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
