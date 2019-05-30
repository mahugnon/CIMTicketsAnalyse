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
Tbl_dev_row >> dev_cim_id: arg1 [
	dev_cim_id := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_com_cim [
	^ dev_com_cim
]

{ #category : #accessing }
Tbl_dev_row >> dev_com_cim: arg1 [
	dev_com_cim := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_com_clt [
	^ dev_com_clt
]

{ #category : #accessing }
Tbl_dev_row >> dev_com_clt: arg1 [
	dev_com_clt := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_com_fact [
	^ dev_com_fact
]

{ #category : #accessing }
Tbl_dev_row >> dev_com_fact: arg1 [
	dev_com_fact := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_comm_estim [
	^ dev_comm_estim
]

{ #category : #accessing }
Tbl_dev_row >> dev_comm_estim: arg1 [
	dev_comm_estim := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_comm_tps_requis [
	^ dev_comm_tps_requis
]

{ #category : #accessing }
Tbl_dev_row >> dev_comm_tps_requis: arg1 [
	dev_comm_tps_requis := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_fin [
	^ dev_fin
]

{ #category : #accessing }
Tbl_dev_row >> dev_fin: arg1 [
	dev_fin := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_id [
	^ dev_id
]

{ #category : #accessing }
Tbl_dev_row >> dev_id: arg1 [
	dev_id := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_ordre [
	^ dev_ordre
]

{ #category : #accessing }
Tbl_dev_row >> dev_ordre: arg1 [
	dev_ordre := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_semaine_clt [
	^ dev_semaine_clt
]

{ #category : #accessing }
Tbl_dev_row >> dev_semaine_clt: arg1 [
	dev_semaine_clt := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_semaine_id [
	^ dev_semaine_id
]

{ #category : #accessing }
Tbl_dev_row >> dev_semaine_id: arg1 [
	dev_semaine_id := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_total [
	^ dev_total
]

{ #category : #accessing }
Tbl_dev_row >> dev_total: arg1 [
	dev_total := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_total_clt [
	^ dev_total_clt
]

{ #category : #accessing }
Tbl_dev_row >> dev_total_clt: arg1 [
	dev_total_clt := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_total_fact [
	^ dev_total_fact
]

{ #category : #accessing }
Tbl_dev_row >> dev_total_fact: arg1 [
	dev_total_fact := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_clt [
	^ dev_tps_clt
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_clt: arg1 [
	dev_tps_clt := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_clt_commentaire [
	^ dev_tps_clt_commentaire
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_clt_commentaire: arg1 [
	dev_tps_clt_commentaire := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_estim [
	^ dev_tps_estim
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_estim: arg1 [
	dev_tps_estim := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_estim_dev [
	^ dev_tps_estim_dev
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_estim_dev: arg1 [
	dev_tps_estim_dev := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_fact [
	^ dev_tps_fact
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_fact: arg1 [
	dev_tps_fact := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_requis [
	^ dev_tps_requis
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_requis: arg1 [
	dev_tps_requis := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_rest_dev [
	^ dev_tps_rest_dev
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_rest_dev: arg1 [
	dev_tps_rest_dev := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_total [
	^ dev_tps_total
]

{ #category : #accessing }
Tbl_dev_row >> dev_tps_total: arg1 [
	dev_tps_total := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_typ_fact [
	^ dev_typ_fact
]

{ #category : #accessing }
Tbl_dev_row >> dev_typ_fact: arg1 [
	dev_typ_fact := arg1
]

{ #category : #accessing }
Tbl_dev_row >> dev_valid_greg [
	^ dev_valid_greg
]

{ #category : #accessing }
Tbl_dev_row >> dev_valid_greg: arg1 [
	dev_valid_greg := arg1
]

{ #category : #initialization }
Tbl_dev_row >> initializeWith: arg1 [
	super initializeWith: arg1.
	self convertTpsTotalToDuration
]
