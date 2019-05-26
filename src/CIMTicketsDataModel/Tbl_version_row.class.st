Class {
	#name : #'Tbl_version_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'version_id',
		'version_libelle',
		'version_comm',
		'version_list',
		'version_etat',
		'version_date_arret'
	],
	#category : #CIMTicketsDataModel
}

{ #category : #accessing }
Tbl_version_row >> version_comm [
	^ version_comm
]

{ #category : #accessing }
Tbl_version_row >> version_comm: anObject [
	version_comm := anObject
]

{ #category : #accessing }
Tbl_version_row >> version_date_arret [
	^ version_date_arret
]

{ #category : #accessing }
Tbl_version_row >> version_date_arret: anObject [
	version_date_arret := anObject
]

{ #category : #accessing }
Tbl_version_row >> version_etat [
	^ version_etat
]

{ #category : #accessing }
Tbl_version_row >> version_etat: anObject [
	version_etat := anObject
]

{ #category : #accessing }
Tbl_version_row >> version_id [
	^ version_id
]

{ #category : #accessing }
Tbl_version_row >> version_id: anObject [
	version_id := anObject
]

{ #category : #accessing }
Tbl_version_row >> version_libelle [
	^ version_libelle
]

{ #category : #accessing }
Tbl_version_row >> version_libelle: anObject [
	version_libelle := anObject
]

{ #category : #accessing }
Tbl_version_row >> version_list [
	^ version_list
]

{ #category : #accessing }
Tbl_version_row >> version_list: anObject [
	version_list := anObject
]
