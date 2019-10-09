Class {
	#name : #CIMWebAbstractPieComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model',
		'chartDataSet'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #'private-api' }
CIMWebAbstractPieComponent >> applyStyleTo: aChartData [
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
CIMWebAbstractPieComponent >> chartDataSet [
	^ chartDataSet
]

{ #category : #accessing }
CIMWebAbstractPieComponent >> description [
	^ self subclassResponsibility
]

{ #category : #accessing }
CIMWebAbstractPieComponent >> model [
	^ model
]

{ #category : #accessing }
CIMWebAbstractPieComponent >> model: anObject [
	model := anObject
]

{ #category : #rendering }
CIMWebAbstractPieComponent >> renderContentOn: html [
self flag: 'Todo'
	"| chartData |
	chartData := (Chart1dData values: self chartDataSet)
		singleValueTooltip: '<key> has <value>% of ' , String cr , self description;
		chartType: ChartPie;
		yourself.
	self applyStyleTo: chartData.
	html mdlGrid
		with: [ html mdlCell
				size: 8;
				mdlTypographyTitle;
				with: self title.
			html mdlCell
				size: 12;
				with: [ html render: (ChartJsComponent data: chartData) ] ]"
]

{ #category : #accessing }
CIMWebAbstractPieComponent >> title [
	^ self subclassResponsibility
]
