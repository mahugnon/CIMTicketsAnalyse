Class {
	#name : #'Tbl_devIzy_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'admis',
		'nom',
		'date_entree',
		'date_sortie'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_devIzy_row >> admis [
	^ admis
]

{ #category : #accessing }
Tbl_devIzy_row >> admis: anObject [
	admis := anObject
]

{ #category : #accessing }
Tbl_devIzy_row >> date_entree [
	^ date_entree
]

{ #category : #accessing }
Tbl_devIzy_row >> date_entree: anObject [
	date_entree := anObject isNil
		ifFalse: [Date readFrom: anObject  readStream pattern:'dd/mm/yyyy']
		ifTrue: [ anObject ]
]

{ #category : #accessing }
Tbl_devIzy_row >> date_sortie [
	^ date_sortie
]

{ #category : #accessing }
Tbl_devIzy_row >> date_sortie: anObject [
	date_sortie := anObject isNil
		ifFalse: [ Date readFrom: anObject readStream pattern: 'dd/mm/yyyy' ]
		ifTrue: [ anObject ]
]

{ #category : #accessing }
Tbl_devIzy_row >> nom [
	^ nom
]

{ #category : #accessing }
Tbl_devIzy_row >> nom: anObject [
	nom := anObject
]
