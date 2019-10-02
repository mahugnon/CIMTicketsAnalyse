Class {
	#name : #'Tbl_type_retour_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'type_retour_id',
		'libelle'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_type_retour_row >> libelle [
	^ libelle
]

{ #category : #accessing }
Tbl_type_retour_row >> libelle: anObject [
	libelle := anObject
]

{ #category : #accessing }
Tbl_type_retour_row >> type_retour_id [
	^ type_retour_id
]

{ #category : #accessing }
Tbl_type_retour_row >> type_retour_id: anObject [
	type_retour_id := anObject
]
