Class {
	#name : #'Tbl_cim_service_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'cim_id',
		'cim_libelle',
		'cim_service',
		'cim_typ_coll',
		'base_jour',
		'cim_equipe'
	],
	#category : #CIMTicketsDataModel
}

{ #category : #accessing }
Tbl_cim_service_row >> base_jour [
	^ base_jour
]

{ #category : #accessing }
Tbl_cim_service_row >> base_jour: anObject [
	base_jour := anObject
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_equipe [
	^ cim_equipe
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_equipe: anObject [
	cim_equipe := anObject
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_id [
	^ cim_id
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_id: anObject [
	cim_id := anObject
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_libelle [
	^ cim_libelle
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_libelle: anObject [
	cim_libelle := anObject
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_service [
	^ cim_service
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_service: anObject [
	cim_service := anObject
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_typ_coll [
	^ cim_typ_coll
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_typ_coll: anObject [
	cim_typ_coll := anObject
]

{ #category : #initialization }
Tbl_cim_service_row >> initializeWith: aDictionary [
	aDictionary
		keysDo: [ :key | 
			self
				perform: (key asLowercase , ':') asSymbol
				with: (aDictionary at: key) ]
]
