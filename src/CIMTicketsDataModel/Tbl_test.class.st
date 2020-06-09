Class {
	#name : #'Tbl_test',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #api }
Tbl_test >> joinTpsToTest: aTbl_tps [
	self rows do: [ :row | row joinTpsToTest: aTbl_tps rows ]
]

{ #category : #utility }
Tbl_test >> rowClass [
	^ Tbl_test_row
]
