Class {
	#name : #CIMTicketsModelDatabase,
	#superclass : #Object,
	#instVars : [
		'tbl_type_correction',
		'tbl_semaine_dev',
		'tbl_ft',
		'tbl_tps',
		'tbl_cim',
		'tbl_type_session',
		'tbl_cim_service',
		'tbl_test',
		'tbl_devizy',
		'tbl_message',
		'tbl_version_news',
		'tbl_dev',
		'tbl_modif',
		'tbl_biblio'
	],
	#classInstVars : [
		'current'
	],
	#category : #'CIMTicketsDataModel-DataBase'
}

{ #category : #accessing }
CIMTicketsModelDatabase class >> current [
	current ifNil: [ current := self new ].
	^ current
]

{ #category : #accessing }
CIMTicketsModelDatabase class >> resetCurrent [
	<script>
	current := nil.
	self current
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_biblio: aTbl_biblio [
	tbl_biblio := aTbl_biblio
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_cim: aTbl_cim [
	tbl_cim := aTbl_cim
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_cim_service: aTbl_cim_service [
	tbl_cim_service := aTbl_cim_service
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_dev: aTbl_dev [
	tbl_dev := aTbl_dev
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_devizy: aTbl_devIzy [
	tbl_devizy := aTbl_devIzy
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_ft: aTbl_ft [
	tbl_ft := aTbl_ft
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_message: aTbl_message [
	tbl_message := aTbl_message
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_modif: aTbl_modif [
	tbl_modif := aTbl_modif
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_semaine_dev: aTbl_semaine_dev [
	tbl_semaine_dev := aTbl_semaine_dev
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_test: aTbl_test [
	tbl_test := aTbl_test
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_tps: aTbl_tps [
	tbl_tps := aTbl_tps
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_type_correction: aTbl_type_correction [
	tbl_type_correction := aTbl_type_correction
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_type_session: aTbl_type_session [
	tbl_type_session := aTbl_type_session
]

{ #category : #accessing }
CIMTicketsModelDatabase >> tbl_version_news: aTbl_version_news [
	tbl_version_news := aTbl_version_news
]
