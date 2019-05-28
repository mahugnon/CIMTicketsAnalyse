Class {
	#name : #'Tbl_ft',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #utility }
Tbl_ft >> filFromCSVFile: aFile [
	super filFromCSVFile: aFile.
	rows := rows select: [ :row | (row ft_datecrea ifNil: [ Date new]) year > 2003 ]
]

{ #category : #utility }
Tbl_ft >> rowClass [
	^ Tbl_ft_row
]
