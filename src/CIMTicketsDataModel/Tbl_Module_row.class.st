Class {
	#name : #'Tbl_Module_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'nom',
		'tickets',
		'bibliotheques'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_Module_row >> nom: aString [
	nom := aString
]

{ #category : #initialization }
Tbl_Module_row >> setBibliotheques [
	bibliotheques := (Tbl allBibliotheques
		select: [ :bib | bib modules includes: nom ]) asOrderedCollection
]

{ #category : #initialization }
Tbl_Module_row >> setTickets [
	tickets := (Tbl allTickets
		select: [ :ticket | ticket modules includes: nom ])
		asOrderedCollection
]
