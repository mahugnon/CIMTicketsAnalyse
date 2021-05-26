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

{ #category : #'as yet unclassified' }
Tbl_retour >> moreClientDemand [
	| libelles |
	libelles := {'Evolution de la demande' . 'Fiche suite à créér'}.
	^ self rows select: [ :each | libelles includes: each libelle ]
]

{ #category : #'as yet unclassified' }
Tbl_retour >> problemRelatedToDevelopment [
	| libelles |
	libelles := {'Fiche incomplète' . 'Anomalie sur le développement'.
	'Impact sur un autre module' . 'Problème de paramétrage'.
	'Erreur sur la version testée' . 'Problème de compréhension du fonctionnement  du module'.
	'Cas non testé en raison de l’absence de cahier de recette'.
	'Problème non lié à la fiche mais qui bloque les tests'.
	'Bug sans lien avec la fiche'}.
	^ self rows select: [ :each | libelles includes: each libelle ]
]

{ #category : #utility }
Tbl_retour >> rowClass [
	^ Tbl_retour_row
]
