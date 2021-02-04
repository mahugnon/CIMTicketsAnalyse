Class {
	#name : #'Tbl_theme_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'theme_id',
		'theme_libelle',
		'theme_descriptif',
		'theme_debut',
		'theme_fin',
		'theme_ordre'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_theme_row >> theme_debut [
	^ theme_debut
]

{ #category : #accessing }
Tbl_theme_row >> theme_debut: anObject [
	theme_debut := anObject
]

{ #category : #accessing }
Tbl_theme_row >> theme_descriptif [
	^ theme_descriptif
]

{ #category : #accessing }
Tbl_theme_row >> theme_descriptif: anObject [
	theme_descriptif := anObject
]

{ #category : #accessing }
Tbl_theme_row >> theme_fin [
	^ theme_fin
]

{ #category : #accessing }
Tbl_theme_row >> theme_fin: anObject [
	theme_fin := anObject
]

{ #category : #accessing }
Tbl_theme_row >> theme_id [
	^ theme_id
]

{ #category : #accessing }
Tbl_theme_row >> theme_id: anObject [
	theme_id := anObject
]

{ #category : #accessing }
Tbl_theme_row >> theme_libelle [
	^ theme_libelle
]

{ #category : #accessing }
Tbl_theme_row >> theme_libelle: anObject [
	theme_libelle := anObject
]

{ #category : #accessing }
Tbl_theme_row >> theme_ordre [
	^ theme_ordre
]

{ #category : #accessing }
Tbl_theme_row >> theme_ordre: anObject [
	theme_ordre := anObject
]
