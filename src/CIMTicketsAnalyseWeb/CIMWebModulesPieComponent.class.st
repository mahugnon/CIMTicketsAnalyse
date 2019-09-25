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
		singleValueTooltip: '<key> has <value>% of total time spent on IzyProtect';
		chartType: ChartPie;
		yourself.
	html mdlGrid
		with: [ html mdlCell
				size: 8;
				mdlTypographyTitle;
				with: 'Time spent on bugs per modules'.
			html mdlCell
				size: 12;
				with: [ html render: (ChartJsComponent data: chartData) ] ]
]
