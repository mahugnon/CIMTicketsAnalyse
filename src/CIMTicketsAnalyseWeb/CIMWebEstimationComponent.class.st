Class {
	#name : #CIMWebEstimationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsGeneralIzyProtect'
}

{ #category : #initialization }
CIMWebEstimationComponent >> initialize [
	super initialize.
	model := CIMWebEstimationModel current
]

{ #category : #accessing }
CIMWebEstimationComponent >> model [
	^ model
]

{ #category : #accessing }
CIMWebEstimationComponent >> model: anObject [
	model := anObject
]

{ #category : #rendering }
CIMWebEstimationComponent >> renderCodeModificationOn: html [
	html mdlCell
		size: 4;
		mdlTextColorPrimary;
		style: 'color:#fff';
		class: 'codeModification';
		with: [ html div
				mdlTypographyTitle;
				with: 'Time code modification'.
			html space.
			html div
				mdlTypographyBody2;
				with: [ html text: 'Bugs: '.
					html space.
					html text: model percentBugs , '%' ].
			html div
				mdlTypographyBody2;
				with: [ html text: 'Evolutions: '.
					html space.
					html text: model percentEvolutions , '%' ] ]
]

{ #category : #rendering }
CIMWebEstimationComponent >> renderContentOn: html [
	html mdlGrid
		with: [ self renderCodeModificationOn: html.
			html mdlCell
				size: 4;
				class: 'ticketDependency';
				with: [ html div
						mdlTypographyTitle;
						with: 'Tickets dependency' ].
			self renderTop: model modulesNamesWithTimeSpent On: html ]
]

{ #category : #rendering }
CIMWebEstimationComponent >> renderTop: modules On: html [
	html mdlCell
		size: 4;
		class: 'modules';
		with: [ html div
				mdlTypographyTitle;
				with: 'Top modules :'.
			1 to: 5 do: [ :each | 
				html div
					mdlTypographyBody2;
					with: [ html text: (modules at: each) key ] ] ]
]
