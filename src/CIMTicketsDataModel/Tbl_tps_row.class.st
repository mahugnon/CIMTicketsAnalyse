Class {
	#name : #'Tbl_tps_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'tps_id',
		'tps_temps',
		'tps_date',
		'tps_commentaire',
		'tps_order',
		'tps_cim_id',
		'tps_dev_id',
		'tps_test_id',
		'tps_type'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_tps_row >> tps_cim_id [
	^ tps_cim_id
]

{ #category : #accessing }
Tbl_tps_row >> tps_cim_id: anObject [
	tps_cim_id := anObject
]

{ #category : #accessing }
Tbl_tps_row >> tps_commentaire [
	^ tps_commentaire
]

{ #category : #accessing }
Tbl_tps_row >> tps_commentaire: anObject [
	tps_commentaire := anObject
]

{ #category : #accessing }
Tbl_tps_row >> tps_date [
	^ tps_date
]

{ #category : #accessing }
Tbl_tps_row >> tps_date: anObject [
	tps_date := anObject
]

{ #category : #accessing }
Tbl_tps_row >> tps_dev_id [
	^ tps_dev_id
]

{ #category : #accessing }
Tbl_tps_row >> tps_dev_id: anObject [
	tps_dev_id := anObject
]

{ #category : #accessing }
Tbl_tps_row >> tps_id [
	^ tps_id
]

{ #category : #accessing }
Tbl_tps_row >> tps_id: anObject [
	tps_id := anObject
]

{ #category : #accessing }
Tbl_tps_row >> tps_order [
	^ tps_order
]

{ #category : #accessing }
Tbl_tps_row >> tps_order: anObject [
	tps_order := anObject
]

{ #category : #accessing }
Tbl_tps_row >> tps_temps [
	^ tps_temps
]

{ #category : #accessing }
Tbl_tps_row >> tps_temps: anObject [
	tps_temps := anObject
]

{ #category : #accessing }
Tbl_tps_row >> tps_test_id [
	^ tps_test_id
]

{ #category : #accessing }
Tbl_tps_row >> tps_test_id: anObject [
	tps_test_id := anObject
]

{ #category : #accessing }
Tbl_tps_row >> tps_type [
	^ tps_type
]

{ #category : #accessing }
Tbl_tps_row >> tps_type: anObject [
	tps_type := anObject
]
