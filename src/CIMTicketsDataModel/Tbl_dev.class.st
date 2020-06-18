Class {
	#name : #'Tbl_dev',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #'as yet unclassified' }
Tbl_dev >> convertFieldToCimDate [
	self rows do: [ :row | row formatFieldsToCIMDate ]
]

{ #category : #utility }
Tbl_dev >> rowClass [
	^ Tbl_dev_row
]
