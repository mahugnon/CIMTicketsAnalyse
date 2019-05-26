Class {
	#name : #'Tbl_biblio_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'biblio_id',
		'biblio_nom',
		'biblio_old',
		'biblio_new',
		'biblio_date',
		'biblio_niveau',
		'biblio_modif_id',
		'biblio_version_id',
		'biblio_old_str',
		'biblio_new_str'
	],
	#category : #CIMTicketsDataModel
}

{ #category : #accessing }
Tbl_biblio_row >> biblio_date [
	^ biblio_date
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_date: anObject [
	biblio_date := anObject
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_id [
	^ biblio_id
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_id: anObject [
	biblio_id := anObject
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_modif_id [
	^ biblio_modif_id
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_modif_id: anObject [
	biblio_modif_id := anObject
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_new [
	^ biblio_new
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_new: anObject [
	biblio_new := anObject
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_new_str [
	^ biblio_new_str
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_new_str: anObject [
	biblio_new_str := anObject
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_niveau [
	^ biblio_niveau
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_niveau: anObject [
	biblio_niveau := anObject
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_nom [
	^ biblio_nom
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_nom: anObject [
	biblio_nom := anObject
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_old [
	^ biblio_old
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_old: anObject [
	biblio_old := anObject
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_old_str [
	^ biblio_old_str
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_old_str: anObject [
	biblio_old_str := anObject
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_version_id [
	^ biblio_version_id
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_version_id: anObject [
	biblio_version_id := anObject
]
