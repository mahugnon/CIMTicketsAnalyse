Class {
	#name : #CIMWebModulesPieComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model',
		'chartDataSet'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #'as yet unclassified' }
CIMWebModulesPieComponent >> applyStyleTo: aChartData [
	| styleForPersons |
	styleForPersons := OrderedCollection new
		add: Color green;
		add: Color blue;
		add: Color red;
		add: Color yellow;
		add: Color black;
		add: Color orange;
		yourself.
	aChartData datas
		do: [ :set | 
			set styleSheet
				fillColor: (styleForPersons at: (aChartData datas indexOf: set)) ]
]

{ #category : #rendering }
CIMWebModulesPieComponent >> chartDataSet [
	^ chartDataSet
]

{ #category : #initialization }
CIMWebModulesPieComponent >> initialize [
	super initialize.
	model := CIMWebModulePieModel current.
	chartDataSet := model percentModuleTime
]

{ #category : #accessing }
CIMWebModulesPieComponent >> model [
	^ model
]

{ #category : #accessing }
CIMWebModulesPieComponent >> model: anObject [
	model := anObject
]

{ #category : #rendering }
CIMWebModulesPieComponent >> renderContentOn: html [
	| chartData |
	chartData := (Chart1dData values: self chartDataSet)
		singleValueTooltip: '<key> has <value>% of ' , String cr , 'total time spent';
		chartType: ChartPie;
		yourself.
	self applyStyleTo: chartData.
	html mdlGrid
		with: [ html mdlCell
				size: 8;
				mdlTypographyTitle;
				with: 'Time spent  per modules'.
			html mdlCell
				size: 12;
				with: [ html render: (ChartJsComponent data: chartData) ] ]
]
