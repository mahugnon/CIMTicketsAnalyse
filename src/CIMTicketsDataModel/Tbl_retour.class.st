Class {
	#name : #'Tbl_retour',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

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
Tbl_retour >> joinTypeRetoursToRetours: aTbl_type_retour [
	self rows
		do: [ :retour | retour joinTypeRetoursToRetour: aTbl_type_retour rows ]
]

{ #category : #utility }
Tbl_retour >> rowClass [
	^ Tbl_retour_row
]
