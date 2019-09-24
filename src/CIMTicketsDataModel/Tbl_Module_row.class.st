Class {
	#name : #'Tbl_Module_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'nom',
		'tickets',
		'bibliotheques'
	],
	#category : #CIMTicketsDataModel
}

{ #category : #initialization }
Tbl_Module_row >> joinLibrariesToModule [
	bibliotheques := (Tbl allBibliotheques
		select: [ :bib | bib modules includes: nom ]) asOrderedCollection
]

{ #category : #initialization }
Tbl_Module_row >> joinTicketsToModules [
	tickets := (Tbl allTickets
		select: [ :ticket | ticket modules includes: nom ])
		asOrderedCollection
]

{ #category : #accessing }
Tbl_Module_row >> nom: aString [
	nom := aString
]
