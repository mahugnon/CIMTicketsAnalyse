Class {
	#name : #RIModel,
	#superclass : #Object,
	#instVars : [
		'strongFocus'
	],
	#category : #'CIMTicketsDataModelGui-Models'
}

{ #category : #accessing }
RIModel >> strongFocus [
	^ strongFocus
]

{ #category : #accessing }
RIModel >> strongFocus: aTicketsNode [ 
	strongFocus := aTicketsNode
]
