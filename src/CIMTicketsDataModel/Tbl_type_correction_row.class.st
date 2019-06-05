Class {
	#name : #'Tbl_type_correction_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'typcorr_id',
		'typcorr_libelle',
		'typcorr_actif',
		'typcorr_visibilite'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #testing }
Tbl_type_correction_row >> isBug [
	^ self libelleForEvolution
		anySatisfy: [ :lib | self typcorr_libelle beginsWith: lib ]
]

{ #category : #testing }
Tbl_type_correction_row >> isEvolution [
	^ self libelleForBug
		anySatisfy: [ :lib | self typcorr_libelle beginsWith: lib ]
]

{ #category : #testing }
Tbl_type_correction_row >> isMisc [
	^ self isBug not & self isEvolution not
]

{ #category : #'as yet unclassified' }
Tbl_type_correction_row >> libelleForBug [
	^ {'CORRECTION' . 'REGRESSION' . 'RUN/Anomalie' . 'ANOMALIE'}
]

{ #category : #accessing }
Tbl_type_correction_row >> libelleForEvolution [
	^ {'EVOLUTION' . 'RUN/Evolution' . 'Roadmap'}
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_actif [
	^ typcorr_actif
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_actif: arg1 [
	typcorr_actif := arg1
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_id [
	^ typcorr_id
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_id: arg1 [
	typcorr_id := arg1
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_libelle [
	^ typcorr_libelle
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_libelle: arg1 [
	typcorr_libelle := arg1
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_visibilite [
	^ typcorr_visibilite
]

{ #category : #accessing }
Tbl_type_correction_row >> typcorr_visibilite: arg1 [
	typcorr_visibilite := arg1
]
