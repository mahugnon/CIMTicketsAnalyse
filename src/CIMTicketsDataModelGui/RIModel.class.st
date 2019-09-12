Class {
	#name : #RIModel,
	#superclass : #Object,
	#instVars : [
		'strongFocus',
		'parentModel'
	],
	#category : #'CIMTicketsDataModelGui-Models'
}

{ #category : #initialization }
RIModel >> initialize [
	super initialize.
	parentModel := RoassalPresenterModel new
]

{ #category : #'private-Api' }
RIModel >> notifyParentModelWith [
	parentModel updateWith: strongFocus cimModel
]

{ #category : #accessing }
RIModel >> strongFocus [
	^ strongFocus
]

{ #category : #accessing }
RIModel >> strongFocus: anObject [
	strongFocus := anObject.
	self notifyParentModelWith
]
