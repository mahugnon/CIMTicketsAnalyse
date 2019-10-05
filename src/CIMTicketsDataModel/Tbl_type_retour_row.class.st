Class {
	#name : #'Tbl_type_retour_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'type_retour_id',
		'libelle',
		'retours'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #testing }
Tbl_type_retour_row >> consistentFeedBacks [
	^ {'Anomalie sur le développement' . 'Impact sur un autre module'.
	'Cas non testé en raison de l’absence de cahier de recette'}
		asOrderedCollection
]

{ #category : #testing }
Tbl_type_retour_row >> isConsistentFeedBack [
	^ self consistentFeedBacks includes: self libelle
]

{ #category : #api }
Tbl_type_retour_row >> joinRetoursToTypeRetour: aCollection [
	self retours
		addAll:
			(aCollection
				select: [ :each | each dev_type_retour_id = self type_retour_id ])
]

{ #category : #accessing }
Tbl_type_retour_row >> libelle [
	^ libelle
]

{ #category : #accessing }
Tbl_type_retour_row >> libelle: anObject [
	libelle := anObject
]

{ #category : #'as yet unclassified' }
Tbl_type_retour_row >> notConsistentFeedBack [
	^ {'Evolution de la demande' . 'Fiche incomplète' . 'Problème de paramétrage'.
	'Erreur sur la version testée' . 'Bug sans lien avec la fiche'.
	'Problème de compréhension du fonctionnement  du module'.
	'Fiche suite à créér' . 'Problème non lié à la fiche mais qui bloque les tests'}
		asOrderedCollection
]

{ #category : #accessing }
Tbl_type_retour_row >> retours [
	retours ifNil: [ retours := Set new ].
	^ retours
]

{ #category : #accessing }
Tbl_type_retour_row >> type_retour_id [
	^ type_retour_id
]

{ #category : #accessing }
Tbl_type_retour_row >> type_retour_id: anObject [
	type_retour_id := anObject
]
