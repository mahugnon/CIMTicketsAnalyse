Class {
	#name : #CIMWebDashbordComponent,
	#superclass : #CIMWebScreenComponent,
	#instVars : [
		'lineChart',
		'moduleBilan',
		'estimations',
		'timeSpentPerTicketChart',
		'timeSpentCharts'
	],
	#category : #CIMTicketsAnalyseWeb
}

{ #category : #hooks }
CIMWebDashbordComponent >> anOtherChart [
	^ timeSpentPerTicketChart
]

{ #category : #hooks }
CIMWebDashbordComponent >> children [
	^ timeSpentCharts , super children
]

{ #category : #hooks }
CIMWebDashbordComponent >> createModulePie [
	^ CIMWebModulesComponent new model: estimations model
]

{ #category : #hooks }
CIMWebDashbordComponent >> estimations [
	^ estimations
]

{ #category : #hooks }
CIMWebDashbordComponent >> estimationsOn: html [
	html mdlCell
		size: 12;
		with: [ html render: self estimations ]
]

{ #category : #initialization }
CIMWebDashbordComponent >> initialize [
	super initialize.
	timeSpentCharts := CIMWebAbstractChartComponent subclasses
		collect: [ :each | each new ].
	moduleBilan := CIMWebTableComponent new.
	estimations := CIMWebEstimationComponent new
]

{ #category : #hooks }
CIMWebDashbordComponent >> lineChart [
	^ lineChart
]

{ #category : #hooks }
CIMWebDashbordComponent >> renderBodyWebOn: html [
	html mdlGrid
		with: [ self estimationsOn: html.
			self renderModuleOn: html.
			self renderChartsOn: html.
			self renderTableOn: html ]
]

{ #category : #hooks }
CIMWebDashbordComponent >> renderChartsOn: html [
	timeSpentCharts
		do: [ :each | 
			html mdlCell
				size: 6;
				with: [ html render: each ] ]
]

{ #category : #hooks }
CIMWebDashbordComponent >> renderModuleOn: html [
	html mdlCell
		size: 6;
		with: [ html render: self createModulePie.
			html space ]
]

{ #category : #hooks }
CIMWebDashbordComponent >> renderTableOn: html [
	html mdlCell
		size: 12;
		with: [ html render: moduleBilan ]
]

{ #category : #hooks }
CIMWebDashbordComponent >> style [
	^ super style
		,
			'.ticketDependency{
background-color:#FFC526; 

}
.codeModification
{
background-color:#BE8DEB;

}
.modules {
background-color:#FFFADE;

}
 '
]
