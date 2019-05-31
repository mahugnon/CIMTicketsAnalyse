"
03'
"
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
		'biblio_new_str',
		'tickets'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_biblio_row >> biblio_date [
	^ biblio_date
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_date: arg1 [
	biblio_date := arg1
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_id [
	^ biblio_id
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_id: arg1 [
	biblio_id := arg1
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_modif_id [
	^ biblio_modif_id
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_modif_id: arg1 [
	biblio_modif_id := arg1
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_new [
	^ biblio_new
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_new: arg1 [
	biblio_new := arg1
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_new_str [
	^ biblio_new_str
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_new_str: arg1 [
	biblio_new_str := arg1
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_niveau [
	^ biblio_niveau
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_niveau: arg1 [
	biblio_niveau := arg1
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_nom [
	^ biblio_nom
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_nom: arg1 [
	biblio_nom := arg1
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_old [
	^ biblio_old
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_old: arg1 [
	biblio_old := arg1
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_old_str [
	^ biblio_old_str
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_old_str: arg1 [
	biblio_old_str := arg1
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_version_id [
	^ biblio_version_id
]

{ #category : #accessing }
Tbl_biblio_row >> biblio_version_id: arg1 [
	biblio_version_id := arg1
]

{ #category : #'as yet unclassified' }
Tbl_biblio_row >> renameUsing: aCollection [
	biblio_nom := aCollection
		detect: [ :elt | elt value includes: biblio_nom ]
		ifFound: [ :elt | biblio_nom := elt key ]
		ifNone: [ biblio_nom ]
]

{ #category : #accessing }
Tbl_biblio_row >> tickets [
	^ tickets
]

{ #category : #accessing }
Tbl_biblio_row >> tickets: anObject [
	tickets := anObject
]
