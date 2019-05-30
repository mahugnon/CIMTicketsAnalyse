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
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_version_row >> version_comm [
	^ version_comm
]

{ #category : #accessing }
Tbl_version_row >> version_comm: arg1 [
	version_comm := arg1
]

{ #category : #accessing }
Tbl_version_row >> version_date_arret [
	^ version_date_arret
]

{ #category : #accessing }
Tbl_version_row >> version_date_arret: arg1 [
	version_date_arret := arg1
]

{ #category : #accessing }
Tbl_version_row >> version_etat [
	^ version_etat
]

{ #category : #accessing }
Tbl_version_row >> version_etat: arg1 [
	version_etat := arg1
]

{ #category : #accessing }
Tbl_version_row >> version_id [
	^ version_id
]

{ #category : #accessing }
Tbl_version_row >> version_id: arg1 [
	version_id := arg1
]

{ #category : #accessing }
Tbl_version_row >> version_libelle [
	^ version_libelle
]

{ #category : #accessing }
Tbl_version_row >> version_libelle: arg1 [
	version_libelle := arg1
]

{ #category : #accessing }
Tbl_version_row >> version_list [
	^ version_list
]

{ #category : #accessing }
Tbl_version_row >> version_list: arg1 [
	version_list := arg1
]
