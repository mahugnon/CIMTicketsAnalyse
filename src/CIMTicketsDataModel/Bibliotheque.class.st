Class {
	#name : #Bibliotheque,
	#superclass : #Object,
	#instVars : [
		'name',
		'tickets'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Bibliotheque >> name [
	^ name
]

{ #category : #accessing }
Bibliotheque >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Bibliotheque >> tickets [
	^ tickets
]

{ #category : #accessing }
Bibliotheque >> tickets: anObject [
	tickets := anObject
]
