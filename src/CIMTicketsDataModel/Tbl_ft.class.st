Class {
	#name : #'Tbl_ft',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #utility }
Tbl_ft >> filFromCSVFile: arg1 [
	super filFromCSVFile: arg1.
	rows := rows
		select: [ :arg2 | 
			| tmp1 |
			tmp1 := arg2 ft_datecrea.
			(tmp1 ifNil: [ Date new ] ifNotNil: [ tmp1 ]) year > 2003 ]
]

{ #category : #utility }
Tbl_ft >> rowClass [
	^ Tbl_ft_row
]
