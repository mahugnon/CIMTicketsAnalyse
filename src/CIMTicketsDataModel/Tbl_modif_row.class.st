Class {
	#name : #'Tbl_modif_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'modif_id',
		'modif_nom',
		'modif_dispo',
		'modif_integration',
		'modif_version_id'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_modif_row >> modif_dispo [
	^ modif_dispo
]

{ #category : #accessing }
Tbl_modif_row >> modif_dispo: anObject [
	modif_dispo := anObject
]

{ #category : #accessing }
Tbl_modif_row >> modif_id [
	^ modif_id
]

{ #category : #accessing }
Tbl_modif_row >> modif_id: anObject [
	modif_id := anObject
]

{ #category : #accessing }
Tbl_modif_row >> modif_integration [
	^ modif_integration
]

{ #category : #accessing }
Tbl_modif_row >> modif_integration: anObject [
	modif_integration := anObject
]

{ #category : #accessing }
Tbl_modif_row >> modif_nom [
	^ modif_nom
]

{ #category : #accessing }
Tbl_modif_row >> modif_nom: anObject [
	modif_nom := anObject
]

{ #category : #accessing }
Tbl_modif_row >> modif_version_id [
	^ modif_version_id
]

{ #category : #accessing }
Tbl_modif_row >> modif_version_id: anObject [
	modif_version_id := anObject
]
