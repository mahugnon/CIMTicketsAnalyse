Class {
	#name : #CIMFormFactory,
	#superclass : #SpPresenter,
	#instVars : [
		'cimTitle',
		'model'
	],
	#category : #'CIMTicketsDataModelGui-Gui'
}

{ #category : #initialization }
CIMFormFactory >> initializeWidgets [
	cimTitle := self newLabel
		emphasis;
		yourself
]

{ #category : #accessing }
CIMFormFactory >> model [
	^ model
]

{ #category : #accessing }
CIMFormFactory >> model: anObject [
	model := anObject.
	self updateValues
]

{ #category : #accessing }
CIMFormFactory >> updateValues [
	^ self subclassResponsibility
]
