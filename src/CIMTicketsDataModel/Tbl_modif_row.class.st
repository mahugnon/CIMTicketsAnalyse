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
Tbl_modif_row >> modif_dispo: arg1 [
	modif_dispo := arg1
]

{ #category : #accessing }
Tbl_modif_row >> modif_id [
	^ modif_id
]

{ #category : #accessing }
Tbl_modif_row >> modif_id: arg1 [
	modif_id := arg1
]

{ #category : #accessing }
Tbl_modif_row >> modif_integration [
	^ modif_integration
]

{ #category : #accessing }
Tbl_modif_row >> modif_integration: arg1 [
	modif_integration := arg1
]

{ #category : #accessing }
Tbl_modif_row >> modif_nom [
	^ modif_nom
]

{ #category : #accessing }
Tbl_modif_row >> modif_nom: arg1 [
	modif_nom := arg1
]

{ #category : #accessing }
Tbl_modif_row >> modif_version_id [
	^ modif_version_id
]

{ #category : #accessing }
Tbl_modif_row >> modif_version_id: arg1 [
	modif_version_id := arg1
]
