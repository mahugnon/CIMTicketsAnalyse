Class {
	#name : #Tbl,
	#superclass : #Object,
	#instVars : [
		'rows'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl class >> script [ 
"an Array(a Tbl_biblio a Tbl_cim a Tbl_cim_service a Tbl_dev a Tbl_ft a Tbl_modif a Tbl_semaine_dev a Tbl_tps a Tbl_type_correction a Tbl_version)"

self fourth rows do: [ :rdev | rdev dev_id: (self fifth rows detect: [:rft | rft ft_dev_id = rdev dev_id])]
]

{ #category : #'as yet unclassified' }
Tbl >> detectTblFrom: file [
	^ (self class subclasses
		select: [ :cl | 
			cl name asLowercase
				= (file basename asLowercase copyReplaceAll: '.csv' with: '') ])
		first
]

{ #category : #utility }
Tbl >> filFromCSVFile: aFile [
	(CSVParser parseFileWithHeader: aFile)
		do: [ :each | rows add: (self rowClass new initializeWith: each) ]
]

{ #category : #initialization }
Tbl >> initialize [
	rows := OrderedCollection new
]

{ #category : #'as yet unclassified' }
Tbl >> loadTblFromFolder: aFolder [
	^ aFolder asFileReference visibleFiles
		collect: [ :file | (self detectTblFrom: file) new filFromCSVFile: file ]
]

{ #category : #utility }
Tbl >> rowClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
Tbl >> rows [
	^ rows
]

{ #category : #accessing }
Tbl >> rows: anObject [
	rows := anObject
]
