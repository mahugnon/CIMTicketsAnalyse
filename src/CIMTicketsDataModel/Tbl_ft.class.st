Class {
	#name : #'Tbl_ft',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #adding }
Tbl_ft >> addAssociatedFiles: aDictionary [
	aDictionary
		keysDo: [ :key | 
			rows
				detect: [ :row | row ft_numordre asInteger = key ]
				ifFound: [ :founded | founded addAssociatedFile: (aDictionary at: key) ] ]
]

{ #category : #'as yet unclassified' }
Tbl_ft >> analyseContat [
	self rows do: [ :ft | ft analyseContat ]
]

{ #category : #utility }
Tbl_ft >> filFromCSVFile: aCsvFile [
	super filFromCSVFile: aCsvFile.
	rows := rows
		select: [ :row| 
			| date |
			date := row ft_datecrea.
			(date ifNil: [ Date new ] ifNotNil: [ date ]) year > 2003 ]
]

{ #category : #'as yet unclassified' }
Tbl_ft >> keepInterestingBibliotheques [
	^ self rows do: [ :row | row keepInterestingBibliotheques ]
]

{ #category : #utility }
Tbl_ft >> rowClass [
	^ Tbl_ft_row
]
