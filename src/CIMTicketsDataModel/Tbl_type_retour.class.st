Class {
	#name : #'Tbl_type_retour',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #api }
Tbl_type_retour >> joinRetoursToTypeRetour: aTbl_retour [
	self rows
		do: [ :typeRetour | typeRetour joinRetoursToTypeRetour: aTbl_retour rows ]
]

{ #category : #utility }
Tbl_type_retour >> rowClass [
	^ Tbl_type_retour_row
]
