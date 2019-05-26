Class {
	#name : #'Tbl_type_correction_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'typcorr_id',
		'typcorr_libelle',
		'typcorr_actif',
		'typcorr_visibilite'
	],
	#category : #CIMTicketsDataModel
}

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_actif [
	^ typcorr_actif
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_actif: anObject [
	typcorr_actif := anObject
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_id [
	^ typcorr_id
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_id: anObject [
	typcorr_id := anObject
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_libelle [
	^ typcorr_libelle
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_libelle: anObject [
	typcorr_libelle := anObject
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_visibilite [
	^ typcorr_visibilite
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_visibilite: anObject [
	typcorr_visibilite := anObject
]
