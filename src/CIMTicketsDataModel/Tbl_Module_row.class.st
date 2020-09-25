Class {
	#name : #'Tbl_Module_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'nom',
		'tickets',
		'bibliotheques',
		'releventYear',
		'database'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_Module_row >> bibliotheques [
	^ bibliotheques
]

{ #category : #accessing }
Tbl_Module_row >> bibliotheques: anObject [
	bibliotheques := anObject
]

{ #category : #initialization }
Tbl_Module_row >> database [
	^ database
]

{ #category : #initialization }
Tbl_Module_row >> database: aDataBase [
	database := aDataBase
]

{ #category : #initialization }
Tbl_Module_row >> joinLibrariesToModule [
	bibliotheques := (self database tbl_biblio rows
		select: [ :bib | bib modules includes: nom ]) asOrderedCollection
]

{ #category : #initialization }
Tbl_Module_row >> joinTicketsToModules [
	tickets := (self database allTickets
		select: [ :ticket | ticket modules includes: nom ])
		asOrderedCollection
]

{ #category : #accessing }
Tbl_Module_row >> nom [
	^ nom
]

{ #category : #accessing }
Tbl_Module_row >> nom: aString [
	nom := aString
]

{ #category : #accessing }
Tbl_Module_row >> releventYear [
	^ releventYear
]

{ #category : #accessing }
Tbl_Module_row >> releventYear: anInteger [ 
	releventYear := anInteger
]

{ #category : #accessing }
Tbl_Module_row >> tickets [
	^ tickets
]

{ #category : #accessing }
Tbl_Module_row >> tickets: anObject [
	tickets := anObject
]
