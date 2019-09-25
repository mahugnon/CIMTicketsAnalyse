Class {
	#name : #CIMWebDashbordComponent,
	#superclass : #CIMWebScreenComponent,
	#instVars : [
		'lineChart',
		'moduleBilan',
		'estimations',
		'timeSpentPerTicketChart',
		'timeSpentCharts',
		'modulesPieComponent',
		'modulesLineBarComponent'
	],
	#category : #'CIMTicketsAnalyseWeb-WebComponentsCore'
}

{ #category : #hooks }
CIMWebDashbordComponent >> children [
	^ {modulesPieComponent} , timeSpentCharts , super children
]

{ #category : #initialization }
CIMWebDashbordComponent >> createEstimationComponent [
	estimations := CIMWebEstimationComponent new
]

{ #category : #initialization }
CIMWebDashbordComponent >> createModuesLineBarComponent [
	modulesLineBarComponent := CIMWebModulesBarLineComponent new
		model: estimations model
]

{ #category : #hooks }
CIMWebDashbordComponent >> createModulePie [
	modulesPieComponent := CIMWebModulesPieComponent new
		model: estimations model
]

{ #category : #initialization }
CIMWebDashbordComponent >> createTableComponent [
	moduleBilan := CIMWebTableComponent new
]

{ #category : #initialization }
CIMWebDashbordComponent >> createTimeChartComponent [
	timeSpentCharts := CIMWebAbstractChartComponent subclasses
		collect: [ :each | each new ]
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
	self createTimeChartComponent.
	self createTableComponent.
	self createEstimationComponent.
	self createModulePie.
	self createModuesLineBarComponent
]

{ #category : #hooks }
CIMWebDashbordComponent >> lineChart [
	^ lineChart
]

{ #category : #hooks }
CIMWebDashbordComponent >> renderBodyWebOn: html [
	html mdlGrid
		with: [ self estimationsOn: html.
			self renderModulesComponentOn: html.
			self renderChartsOn: html.
			self renderTableOn: html ]
]

{ #category : #'parts rendering' }
CIMWebDashbordComponent >> renderChartsOn: html [
	timeSpentCharts
		do: [ :each | 
			html mdlCell
				size: 6;
				with: [ html render: each ] ]
]

{ #category : #'parts rendering' }
CIMWebDashbordComponent >> renderModulesComponentOn: html [
	html mdlGrid
		with: [ html mdlCell
				mdlTypographyTextCenter;
				mdlTypographyTitle;
				mdlTextColorPrimary;
				size: 12;
				with: 'Izy Protect Modules '.
			self renderModulesLineBarOn: html.
			self renderModulesPieOn: html ]
]

{ #category : #'parts rendering' }
CIMWebDashbordComponent >> renderModulesLineBarOn: html [
	html mdlCell
		size: 6;
		with: [ html
				render: (CIMWebModulesBarLineComponent new model: estimations model) ]
]

{ #category : #'parts rendering' }
CIMWebDashbordComponent >> renderModulesPieOn: html [
	html mdlCell
		size: 6;
		mdlTypographyTextCenter;
		with: [ html render: modulesPieComponent.
			html space ]
]

{ #category : #'parts rendering' }
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
