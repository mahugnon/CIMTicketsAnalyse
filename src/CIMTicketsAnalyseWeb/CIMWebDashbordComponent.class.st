Class {
	#name : #CIMWebDashbordComponent,
	#superclass : #CIMWebScreenComponent,
	#instVars : [
		'modulesPieComponent',
		'mainLineBarComponent',
		'feedBackPieComponent'
	],
	#category : #'CIMTicketsAnalyseWeb-WebComponentsCore'
}

{ #category : #hooks }
CIMWebDashbordComponent >> children [
	^ {mainLineBarComponent.
	modulesPieComponent} , super children
]

{ #category : #hooks }
CIMWebDashbordComponent >> createMainLineBarComponent [
	mainLineBarComponent := CIMWebMainLineBarComponent new
]

{ #category : #hooks }
CIMWebDashbordComponent >> createModulePie [
	modulesPieComponent := CIMWebModulesPieComponent new
]

{ #category : #initialization }
CIMWebDashbordComponent >> initialize [
	super initialize.
	self createMainLineBarComponent.
	self createModulePie
]

{ #category : #hooks }
CIMWebDashbordComponent >> renderBodyWebOn: html [
	html mdlGrid
		with: [ "self estimationsOn: html."
			self renderModulesComponentOn: html ]
]

{ #category : #'parts rendering' }
CIMWebDashbordComponent >> renderModulesComponentOn: html [
	html mdlGrid
		with: [ html mdlCell
				mdlTypographyTextCenter;
				mdlTypographyTitle;
				mdlTextColorPrimary;
				size: 12;
				with: 'Modules d''Izy Protect'.
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
