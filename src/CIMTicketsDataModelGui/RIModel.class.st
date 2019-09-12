Class {
	#name : #RIModel,
	#superclass : #Object,
	#instVars : [
		'strongFocus',
		'detailModel'
	],
	#category : #'CIMTicketsDataModelGui-Models'
}

{ #category : #initialization }
RIModel >> initialize [
	super initialize.
	detailModel := CIMRoassalSelectedNodePresenterModel allInstances
		first
]

{ #category : #'private-Api' }
RIModel >> notifyModels [
	detailModel  rightUpdateWith: strongFocus cimModel
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
