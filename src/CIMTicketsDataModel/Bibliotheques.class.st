Class {
	#name : #Bibliotheques,
	#superclass : #Object,
	#instVars : [
		'bibliotheques'
	],
	#category : #CIMTicketsDataModel
}

{ #category : #'instance creation' }
Bibliotheques class >> createFrom: anAssociation [
	^ self new
		bibliotheques:
			(anAssociation
				collect: [ :b | 
					CIMBibliotheque new
						name: b key;
						tickets: (b value collectAsSet: #tickets) ])
]

{ #category : #accessing }
Bibliotheques >> bibliotheques [
	^ bibliotheques
]

{ #category : #accessing }
Bibliotheques >> bibliotheques: anObject [
	bibliotheques := anObject
]

{ #category : #initialization }
Bibliotheques >> initialize [
	super initialize.
	bibliotheques := OrderedCollection new
]
