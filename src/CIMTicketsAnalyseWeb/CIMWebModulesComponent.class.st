Class {
	#name : #CIMWebModulesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model'
	],
	#category : #CIMTicketsAnalyseWeb
}

{ #category : #rendering }
CIMWebModulesComponent >> descriptionOn: html [
	html div
		with: [ html mdlTextFieldLabel: 'Time on bugs spent per modules' ]
]

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
		singleValueTooltip: '<key> has <value>% of total time spent on IzyProtect';
		chartType: ChartPie;
		yourself.
	self descriptionOn: html.
	html render: (ChartJsComponent data: chartData)
]
