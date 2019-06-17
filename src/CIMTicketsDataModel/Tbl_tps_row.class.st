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

{ #category : #'as yet unclassified' }
Tbl_tps_row >> convertTpsTempsToDuration [
	tps_temps := AbstractCIMDateFormatConverter convert: tps_temps
]

{ #category : #initialization }
Tbl_tps_row >> initializeWith: arg1 [
	super initializeWith: arg1.
	self convertTpsTempsToDuration
]

{ #category : #testing }
Tbl_tps_row >> isDevelopment [
	^ tps_type = '0'
]

{ #category : #accessing }
Tbl_tps_row >> tps_cim_id [
	^ tps_cim_id
]

{ #category : #accessing }
Tbl_tps_row >> tps_cim_id: arg1 [
	tps_cim_id := arg1
]

{ #category : #accessing }
Tbl_tps_row >> tps_commentaire [
	^ tps_commentaire
]

{ #category : #accessing }
Tbl_tps_row >> tps_commentaire: arg1 [
	tps_commentaire := arg1
]

{ #category : #accessing }
Tbl_tps_row >> tps_date [
	^ tps_date
]

{ #category : #accessing }
Tbl_tps_row >> tps_date: arg1 [
	tps_date := arg1
]

{ #category : #accessing }
Tbl_tps_row >> tps_dev_id [
	^ tps_dev_id
]

{ #category : #accessing }
Tbl_tps_row >> tps_dev_id: arg1 [
	tps_dev_id := arg1
]

{ #category : #accessing }
Tbl_tps_row >> tps_id [
	^ tps_id
]

{ #category : #accessing }
Tbl_tps_row >> tps_id: arg1 [
	tps_id := arg1
]

{ #category : #accessing }
Tbl_tps_row >> tps_order [
	^ tps_order
]

{ #category : #accessing }
Tbl_tps_row >> tps_order: arg1 [
	tps_order := arg1
]

{ #category : #accessing }
Tbl_tps_row >> tps_temps [
	^ tps_temps
]

{ #category : #accessing }
Tbl_tps_row >> tps_temps: arg1 [
	tps_temps := arg1
]

{ #category : #accessing }
Tbl_tps_row >> tps_test_id [
	^ tps_test_id
]

{ #category : #accessing }
Tbl_tps_row >> tps_test_id: arg1 [
	tps_test_id := arg1
]

{ #category : #accessing }
Tbl_tps_row >> tps_type [
	^ tps_type
]

{ #category : #accessing }
Tbl_tps_row >> tps_type: arg1 [
	tps_type := arg1
]

{ #category : #accessing }
Tbl_tps_row >> typeTps [
	^ typeTps
]

{ #category : #accessing }
Tbl_tps_row >> typeTps: anObject [
	typeTps := anObject
]
