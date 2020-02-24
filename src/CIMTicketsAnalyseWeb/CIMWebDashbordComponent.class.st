Class {
	#name : #CIMWebDashbordComponent,
	#superclass : #CIMWebScreenComponent,
	#instVars : [
		'estimations',
		'modulesPieComponent',
		'mainLineBarComponent',
		'feedBackPieComponent'
	],
	#category : #'CIMTicketsAnalyseWeb-WebComponentsCore'
}

{ #category : #hooks }
CIMWebDashbordComponent >> children [
	^ {mainLineBarComponent.
	modulesPieComponent.
	estimations.
	feedBackPieComponent} , super children
]

{ #category : #initialization }
CIMWebDashbordComponent >> createEstimationComponent [
	estimations := CIMWebEstimationComponent new
]

{ #category : #initialization }
CIMWebDashbordComponent >> createFeedBackPieComponent [
	feedBackPieComponent := CIMWebFeedBackPieComponent new
]

{ #category : #hooks }
CIMWebDashbordComponent >> createMainLineBarComponent [
	mainLineBarComponent := CIMWebMainLineBarComponent new
]

{ #category : #hooks }
CIMWebDashbordComponent >> createModulePie [
	modulesPieComponent := CIMWebModulesPieComponent new
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
	self createMainLineBarComponent.
	self createEstimationComponent.
	self createModulePie.
	self createFeedBackPieComponent
]

{ #category : #hooks }
CIMWebDashbordComponent >> renderBodyWebOn: html [
	html mdlGrid
		with: [ self estimationsOn: html.
			"self renderModulesPieOn: html."
			"self renderFeedBackPieComponentOn: html."
			self renderModulesComponentOn: html
			"self renderChartsOn: html" ]
]

{ #category : #'parts rendering' }
CIMWebDashbordComponent >> renderFeedBackPieComponentOn: html [
	html mdlCell
		size: 6;
		shadow: 8;
		style: 'background-color: white';
		mdlTypographyTextCenter;
		with: [ html render: feedBackPieComponent.
			html space ]
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
			self renderModulesMainLineBarOn: html ]
]

{ #category : #'parts rendering' }
CIMWebDashbordComponent >> renderModulesMainLineBarOn: html [
	html mdlCell
		size: 12;
		mdlTypographyTextCenter;
		with: [ html render: mainLineBarComponent.
			html space ]
]

{ #category : #'parts rendering' }
CIMWebDashbordComponent >> renderModulesPieOn: html [
	html mdlCell
		size: 6;
		shadow: 8;
		style: 'background-color: white';
		mdlTypographyTextCenter;
		with: [ html render: modulesPieComponent.
			html space ]
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
background-color:#D9D2C5;

}
 '
]
