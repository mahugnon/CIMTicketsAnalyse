Class {
	#name : #'Tbl_retour',
	#superclass : #Tbl,
	#instVars : [
		'dateFirstRetour'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_retour >> dateFirstRetour [
	dateFirstRetour
		ifNil: [ dateFirstRetour := (rows
				sort: [ :a :b | a date_retour < b date_retour ]) first date_retour
				asDate ].
	^ dateFirstRetour
]

{ #category : #api }
Tbl_retour >> joinCcTypeRetourToRetour: aTbl_type_retour [
	self rows
		do: [ :retour | retour joinCcTypeRetourToRetour: aTbl_type_retour rows ]
]

{ #category : #api }
Tbl_retour >> joinDevTypeRetourToRetour: aTbl_type_retour [
	self rows
		do: [ :retour | retour joinDevTypeRetourToRetour: aTbl_type_retour rows ]
]

{ #category : #api }
Tbl_retour >> joinTicketsToRetour: aTbl_ft [
self traceCr: 'joinTicketsToRetour'.
	self rows do: [ :retour | retour joinTicketsToRetour: aTbl_ft rows ]
]

{ #category : #api }
Tbl_retour >> joinTypeRetoursToRetours: aTbl_type_retour [
self traceCr: 'joinTypeRetoursToRetours'.
	self rows
		do: [ :retour | retour joinTypeRetoursToRetour: aTbl_type_retour rows ]
]

{ #category : #utility }
Tbl_retour >> rowClass [
	^ Tbl_retour_row
]
