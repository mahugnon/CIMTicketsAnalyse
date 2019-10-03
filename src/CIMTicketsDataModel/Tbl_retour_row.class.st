Class {
	#name : #'Tbl_retour_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'retour_id',
		'ft_id',
		'date_retour',
		'cc_type_retour_id',
		'dev_type_retour_id',
		'date_valide'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_retour_row >> cc_type_retour_id [
	^ cc_type_retour_id
]

{ #category : #accessing }
Tbl_retour_row >> cc_type_retour_id: anObject [
	cc_type_retour_id := anObject
]

{ #category : #accessing }
Tbl_retour_row >> date_retour [
	^ date_retour
]

{ #category : #accessing }
Tbl_retour_row >> date_retour: anObject [
	date_retour := anObject
]

{ #category : #accessing }
Tbl_retour_row >> date_valide [
	^ date_valide
]

{ #category : #accessing }
Tbl_retour_row >> date_valide: anObject [
	date_valide := anObject
]

{ #category : #accessing }
Tbl_retour_row >> dev_type_retour_id [
	^ dev_type_retour_id
]

{ #category : #accessing }
Tbl_retour_row >> dev_type_retour_id: anObject [
	dev_type_retour_id := anObject
]

{ #category : #formatting }
Tbl_retour_row >> formatFieldsToCIMDate [
	self date_retour: self date_retour asDate.
	self date_valide = ''
		ifTrue: [ self date_valide: nil ]
		ifFalse: [ self date_valide: self date_valide ]
]

{ #category : #accessing }
Tbl_retour_row >> ft_id [
	^ ft_id
]

{ #category : #accessing }
Tbl_retour_row >> ft_id: anObject [
	ft_id := anObject
]

{ #category : #accessing }
Tbl_retour_row >> retour_id [
	^ retour_id
]

{ #category : #accessing }
Tbl_retour_row >> retour_id: anObject [
	retour_id := anObject
]
