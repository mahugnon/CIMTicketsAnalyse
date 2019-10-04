Class {
	#name : #'Tbl_type_retour_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'type_retour_id',
		'libelle'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #testing }
Tbl_type_retour_row >> consitentFeedBacks [
	^ {'Anomalie sur le développement' . 'Impact sur un autre module'.
	'Cas non testé en raison de l’absence de cahier de recette'}
		asOrderedCollection
]

{ #category : #testing }
Tbl_type_retour_row >> isConstientFeedBack [
	^ self consitentFeedBacks includes: self libelle
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
Tbl_type_retour_row >> type_retour_id [
	^ type_retour_id
]

{ #category : #accessing }
Tbl_type_retour_row >> type_retour_id: anObject [
	type_retour_id := anObject
]
