Class {
	#name : #'Tbl_test_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'test_id',
		'test_fin',
		'test_temps_total',
		'test_cim_id',
		'test_total',
		'test_total_clt',
		'test_total_fact',
		'test_temps_clt',
		'test_temps_fact',
		'test_semaine_id',
		'test_semaine_clt',
		'test_ordre',
		'test_comm_estim',
		'test_tps_estim',
		'test_valid_estim'
	],
	#category : #CIMTicketsDataModel
}

{ #category : #initialization }
Tbl_test_row >> initializeWith: aDictionary [
	aDictionary
		keysDo: [ :key | 
			self
				perform: (key asLowercase , ':') asSymbol
				with: (aDictionary at: key) ]
]

{ #category : #accessing }
Tbl_test_row >> test_cim_id [
	^ test_cim_id
]

{ #category : #accessing }
Tbl_test_row >> test_cim_id: anObject [
	test_cim_id := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_comm_estim [
	^ test_comm_estim
]

{ #category : #accessing }
Tbl_test_row >> test_comm_estim: anObject [
	test_comm_estim := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_fin [
	^ test_fin
]

{ #category : #accessing }
Tbl_test_row >> test_fin: anObject [
	test_fin := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_id [
	^ test_id
]

{ #category : #accessing }
Tbl_test_row >> test_id: anObject [
	test_id := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_ordre [
	^ test_ordre
]

{ #category : #accessing }
Tbl_test_row >> test_ordre: anObject [
	test_ordre := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_semaine_clt [
	^ test_semaine_clt
]

{ #category : #accessing }
Tbl_test_row >> test_semaine_clt: anObject [
	test_semaine_clt := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_semaine_id [
	^ test_semaine_id
]

{ #category : #accessing }
Tbl_test_row >> test_semaine_id: anObject [
	test_semaine_id := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_temps_clt [
	^ test_temps_clt
]

{ #category : #accessing }
Tbl_test_row >> test_temps_clt: anObject [
	test_temps_clt := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_temps_fact [
	^ test_temps_fact
]

{ #category : #accessing }
Tbl_test_row >> test_temps_fact: anObject [
	test_temps_fact := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_temps_total [
	^ test_temps_total
]

{ #category : #accessing }
Tbl_test_row >> test_temps_total: anObject [
	test_temps_total := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_total [
	^ test_total
]

{ #category : #accessing }
Tbl_test_row >> test_total: anObject [
	test_total := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_total_clt [
	^ test_total_clt
]

{ #category : #accessing }
Tbl_test_row >> test_total_clt: anObject [
	test_total_clt := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_total_fact [
	^ test_total_fact
]

{ #category : #accessing }
Tbl_test_row >> test_total_fact: anObject [
	test_total_fact := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_tps_estim [
	^ test_tps_estim
]

{ #category : #accessing }
Tbl_test_row >> test_tps_estim: anObject [
	test_tps_estim := anObject
]

{ #category : #accessing }
Tbl_test_row >> test_valid_estim [
	^ test_valid_estim
]

{ #category : #accessing }
Tbl_test_row >> test_valid_estim: anObject [
	test_valid_estim := anObject
]
