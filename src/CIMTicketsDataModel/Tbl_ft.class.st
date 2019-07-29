Class {
	#name : #'Tbl_ft',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

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
