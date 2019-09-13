Class {
	#name : #RISetYourModelWhenMouseClick,
	#superclass : #RTGrapherInteraction,
	#instVars : [
		'model'
	],
	#category : #'CIMTicketsDataModelGui-Interaction'
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

{ #category : #accessing }
RISetYourModelWhenMouseClick >> model: aRIModel [ 
	model := aRIModel
]

{ #category : #hooks }
RISetYourModelWhenMouseClick >> onElement: anElement [
	anElement
		when: TSMouseClick
		do: [ :event | 
			model strongFocus
				ifNotNil: [ model strongFocus shape color: Color blue ].
			anElement shape color: Color green.
			self model strongFocus: anElement ]
]
