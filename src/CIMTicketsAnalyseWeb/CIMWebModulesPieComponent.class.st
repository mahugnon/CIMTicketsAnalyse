Class {
	#name : #CIMWebModulesPieComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

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
	chartData := (Chart1dData values: model percentModuleBugsTime)
		title: 'Time on bugs spent per modules';
		singleValueTooltip: '<key> has <value>% of total time spent on IzyProtect';
		chartType: ChartPie;
		yourself.
	html render: (ChartJsComponent data: chartData)
]
