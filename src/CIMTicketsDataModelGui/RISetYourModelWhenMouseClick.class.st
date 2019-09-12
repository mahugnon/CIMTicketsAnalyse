Class {
	#name : #RISetYourModelWhenMouseClick,
	#superclass : #RTGrapherInteraction,
	#instVars : [
		'model'
	],
	#category : #'CIMTicketsDataModelGui-Roassals'
}

{ #category : #initialization }
RISetYourModelWhenMouseClick >> initialize [
	super initialize.
	model := RIModel new
]

{ #category : #accessing }
RISetYourModelWhenMouseClick >> model [
	^ model
]

{ #category : #hooks }
RISetYourModelWhenMouseClick >> onElement: anElement [
	anElement
		when: TSMouseClick
		do: [ :event | 
			model strongFocus shape color: Color blue.
			anElement shape color: Color green.
			self model strongFocus: anElement ]
]
