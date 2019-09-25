Class {
	#name : #CIMWebModulesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model'
	],
	#category : #'CIMTicketsAnalyseWeb-WebComponents'
}

{ #category : #accessing }
CIMWebModulesComponent >> model [
	^ model
]

{ #category : #accessing }
CIMWebModulesComponent >> model: anObject [
	model := anObject
]

{ #category : #rendering }
CIMWebModulesComponent >> renderContentOn: html [
	| chartData |
	chartData := (Chart1dData values: model percentModuleBugsTime)
		title: 'Time on bugs spent per modules';
		singleValueTooltip: '<key> has <value>% of total time spent on IzyProtect';
		chartType: ChartPie;
		yourself.
	html render: (ChartJsComponent data: chartData)
]
