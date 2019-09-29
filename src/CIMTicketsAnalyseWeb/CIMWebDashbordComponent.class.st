Class {
	#name : #CIMWebDashbordComponent,
	#superclass : #CIMWebScreenComponent,
	#instVars : [
		'estimations',
		'timeSpentPerTicketChart',
		'timeSpentCharts',
		'modulesPieComponent',
		'modulesLineBarComponent',
		'modulesTestRCLineBarComponent',
		'modulesTimeOpenCloseLineBarComponent'
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
	modulesLineBarComponent := CIMWebModulesTimeSpentComponent new
]

{ #category : #initialization }
CIMWebDashbordComponent >> createModuesTestRCLineBarComponent [
	modulesTestRCLineBarComponent := CIMWebModulesTimeTestRCComponent new
]

{ #category : #initialization }
CIMWebDashbordComponent >> createModuesTimeOpenCloseLineBarComponent [
	modulesTimeOpenCloseLineBarComponent := CIMWebModulesTimeToOpenCloseComponent
		new
]

{ #category : #hooks }
CIMWebDashbordComponent >> createModulePie [
	modulesPieComponent := CIMWebModulesPieComponent new
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
	self createEstimationComponent.
	self createModulePie.
	self createModuesLineBarComponent.
	self createModuesTestRCLineBarComponent.
	self createModuesTimeOpenCloseLineBarComponent
]

{ #category : #hooks }
CIMWebDashbordComponent >> renderBodyWebOn: html [
	html mdlGrid
		with: [ self estimationsOn: html.
			self renderModulesComponentOn: html
			"self renderChartsOn: html" ]
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
			self renderModulesTestRCLineBarOn: html.
			self renderModulesTimeOpenCloseLineBarOn: html.
			self renderModulesPieOn: html ]
]

{ #category : #'parts rendering' }
CIMWebDashbordComponent >> renderModulesLineBarOn: html [
	html mdlCell
		size: 6;
		with: [ html render: modulesLineBarComponent ]
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
CIMWebDashbordComponent >> renderModulesTestRCLineBarOn: html [
	html mdlCell
		size: 6;
		with: [ html render: modulesTestRCLineBarComponent ]
]

{ #category : #'parts rendering' }
CIMWebDashbordComponent >> renderModulesTimeOpenCloseLineBarOn: html [
	html mdlCell
		size: 6;
		with: [ html render: modulesTimeOpenCloseLineBarComponent ]
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
