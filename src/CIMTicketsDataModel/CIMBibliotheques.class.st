Class {
	#name : #CIMBibliotheques,
	#superclass : #Object,
	#instVars : [
		'bibliotheques'
	],
	#category : #CIMTicketsDataModel
}

{ #category : #'instance creation' }
CIMBibliotheques class >> createFrom: anAssociation [
	^ self new
		bibliotheques:
			(anAssociation
				collect: [ :b | 
					CIMBibliotheque new
						name: b key;
						tickets: (b value collectAsSet: #tickets) ])
]

{ #category : #accessing }
CIMBibliotheques >> bibliotheques [
	^ bibliotheques
]

{ #category : #accessing }
CIMBibliotheques >> bibliotheques: anObject [
	bibliotheques := anObject
]

{ #category : #initialization }
CIMBibliotheques >> initialize [
	super initialize.
	bibliotheques := OrderedCollection new
]
