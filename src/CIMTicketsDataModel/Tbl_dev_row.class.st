Class {
	#name : #'Tbl_dev_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'dev_id',
		'dev_fin',
		'dev_tps_total',
		'dev_tps_clt',
		'dev_tps_clt_commentaire',
		'dev_tps_estim',
		'dev_valid_greg',
		'dev_semaine_id',
		'dev_cim_id',
		'dev_tps_fact',
		'dev_typ_fact',
		'dev_com_cim',
		'dev_com_clt',
		'dev_com_fact',
		'dev_semaine_clt',
		'dev_total',
		'dev_total_clt',
		'dev_total_fact',
		'dev_comm_estim',
		'dev_tps_requis',
		'dev_comm_tps_requis',
		'dev_ordre',
		'dev_tps_estim_dev',
		'dev_tps_rest_dev'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #initialization }
Tbl_dev_row >> convertTpsTotalToDuration [
	dev_tps_total ifNil: [ ^ self ].
	dev_tps_total := AbstractCIMDateFormatConverter
		convert: dev_tps_total
]

{ #category : #accessing }
Tbl_dev_row >> dev_cim_id [
	^ dev_cim_id
]

{ #category : #accessing }
Tbl_dev_row >> dev_cim_id: anObject [
	dev_cim_id := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_com_cim [
	^ dev_com_cim
]

{ #category : #accessing }
Tbl_dev_row >> dev_com_cim: anObject [
	dev_com_cim := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_com_clt [
	^ dev_com_clt
]

{ #category : #accessing }
Tbl_dev_row >> dev_com_clt: anObject [
	dev_com_clt := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_com_fact [
	^ dev_com_fact
]

{ #category : #accessing }
Tbl_dev_row >> dev_com_fact: anObject [
	dev_com_fact := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_comm_estim [
	^ dev_comm_estim
]

{ #category : #accessing }
Tbl_dev_row >> dev_comm_estim: anObject [
	dev_comm_estim := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_comm_tps_requis [
	^ dev_comm_tps_requis
]

{ #category : #accessing }
Tbl_dev_row >> dev_comm_tps_requis: anObject [
	dev_comm_tps_requis := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_fin [
	^ dev_fin
]

{ #category : #accessing }
Tbl_dev_row >> dev_fin: anObject [
	dev_fin := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_id [
	^ dev_id
]

{ #category : #accessing }
Tbl_dev_row >> dev_id: anObject [
	dev_id := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_ordre [
	^ dev_ordre
]

{ #category : #accessing }
Tbl_dev_row >> dev_ordre: anObject [
	dev_ordre := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_semaine_clt [
	^ dev_semaine_clt
]

{ #category : #accessing }
Tbl_dev_row >> dev_semaine_clt: anObject [
	dev_semaine_clt := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_semaine_id [
	^ dev_semaine_id
]

{ #category : #accessing }
Tbl_dev_row >> dev_semaine_id: anObject [
	dev_semaine_id := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_total [
	^ dev_total
]

{ #category : #accessing }
Tbl_dev_row >> dev_total: anObject [
	dev_total := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_total_clt [
	^ dev_total_clt
]

{ #category : #accessing }
Tbl_dev_row >> dev_total_clt: anObject [
	dev_total_clt := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_total_fact [
	^ dev_total_fact
]

{ #category : #accessing }
Tbl_dev_row >> dev_total_fact: anObject [
	dev_total_fact := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_clt [
	^ dev_tps_clt
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_clt: anObject [
	dev_tps_clt := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_clt_commentaire [
	^ dev_tps_clt_commentaire
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_clt_commentaire: anObject [
	dev_tps_clt_commentaire := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_estim [
	^ dev_tps_estim
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_estim: anObject [
	dev_tps_estim := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_estim_dev [
	^ dev_tps_estim_dev
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_estim_dev: anObject [
	dev_tps_estim_dev := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_fact [
	^ dev_tps_fact
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_fact: anObject [
	dev_tps_fact := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_requis [
	^ dev_tps_requis
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_requis: anObject [
	dev_tps_requis := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_rest_dev [
	^ dev_tps_rest_dev
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_rest_dev: anObject [
	dev_tps_rest_dev := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_total [
	^ dev_tps_total
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_total: anObject [
	dev_tps_total := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_typ_fact [
	^ dev_typ_fact
]

{ #category : #accessing }
Tbl_dev_row >> dev_typ_fact: anObject [
	dev_typ_fact := anObject
]

{ #category : #accessing }
Tbl_dev_row >> dev_valid_greg [
	^ dev_valid_greg
]

{ #category : #accessing }
Tbl_dev_row >> dev_valid_greg: anObject [
	dev_valid_greg := anObject
]

{ #category : #initialization }
Tbl_dev_row >> initializeWith: aDictionary [
	super initializeWith: aDictionary.
	self convertTpsTotalToDuration
]
