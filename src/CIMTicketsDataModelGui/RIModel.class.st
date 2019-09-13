Class {
	#name : #RIModel,
	#superclass : #Object,
	#instVars : [
		'strongFocus',
		'listeners'
	],
	#category : #'CIMTicketsDataModelGui-Models'
}

{ #category : #adding }
RIModel >> addListener: aListener [
	listeners add: aListener
]

{ #category : #initialization }
RIModel >> initialize [
	super initialize.
	listeners := OrderedCollection new
]

{ #category : #'private-Api' }
RIModel >> notifyModels [
	listeners do:[:listener| listener updateInteractionFocus: strongFocus cimModel]
]

{ #category : #accessing }
RIModel >> strongFocus [
	^ strongFocus
]

{ #category : #accessing }
RIModel >> strongFocus: anObject [
	strongFocus := anObject.
	self notifyModels
]

{ #category : #api }
RIModel >> subscribe: aListener [
	self addListener: aListener
]
