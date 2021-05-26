Class {
	#name : #'Tbl_cim_service_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'cim_id',
		'cim_libelle',
		'cim_service',
		'cim_typ_coll',
		'base_jour',
		'cim_equipe',
		'tickets',
		'beginDate',
		'endDate'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_cim_service_row >> base_jour [
	^ base_jour
]

{ #category : #accessing }
Tbl_cim_service_row >> base_jour: arg1 [
	base_jour := arg1
]

{ #category : #'as yet unclassified' }
Tbl_cim_service_row >> beginDateApproximation [
	tickets ifNotEmpty: [ beginDate := tickets first dateClosing ]
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_equipe [
	^ cim_equipe
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_equipe: arg1 [
	cim_equipe := arg1
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_id [
	^ cim_id
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_id: arg1 [
	cim_id := arg1
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_libelle [
	^ cim_libelle
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_libelle: arg1 [
	cim_libelle := arg1
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_service [
	^ cim_service
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_service: arg1 [
	cim_service := arg1
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_typ_coll [
	^ cim_typ_coll
]

{ #category : #accessing }
Tbl_cim_service_row >> cim_typ_coll: arg1 [
	cim_typ_coll := arg1
]

{ #category : #'as yet unclassified' }
Tbl_cim_service_row >> endDateApproximation [
	tickets ifNotEmpty: [ endDate := tickets last dateClosing ]
]

{ #category : #initialization }
Tbl_cim_service_row >> initialize [
	super initialize.
	tickets := OrderedCollection new
]

{ #category : #initialization }
Tbl_cim_service_row >> initializeWith: arg1 [
	arg1
		keysDo: [ :arg2 | self perform: (arg2 asLowercase , ':') asSymbol with: (arg1 at: arg2) ]
]

{ #category : #'as yet unclassified' }
Tbl_cim_service_row >> joinTicketsToService: aCollection [
	tickets
		addAll:
			(aCollection
				select:
					[ :ft | ft ft_cim_id asString = self cim_id and: [ ft dateClosing isNotNil ] ]).
	tickets sorted: [ :a :b | a dateClosing < b dateClosing ]
]
