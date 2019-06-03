Class {
	#name : #CIMBibliotheque,
	#superclass : #Object,
	#instVars : [
		'name',
		'tickets'
	],
	#category : #CIMTicketsDataModel
}

{ #category : #accessing }
CIMBibliotheque >> name [
	^ name
]

{ #category : #accessing }
CIMBibliotheque >> name: anObject [
	name := anObject
]

{ #category : #accessing }
CIMBibliotheque >> tickets [
	^ tickets
]

{ #category : #accessing }
CIMBibliotheque >> tickets: anObject [
	tickets := anObject
]
