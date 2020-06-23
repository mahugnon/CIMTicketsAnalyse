Class {
	#name : #'Tbl_tps',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #utilities }
Tbl_tps >> joinTypeSessionToTps: aTbl_TypeSession [
	self traceCr: 'joinTypeSessionToTps'.
	self rows do: [ :tps | tps joinTypeSessionToTps: aTbl_TypeSession ]
]

{ #category : #utility }
Tbl_tps >> rowClass [
	^ Tbl_tps_row
]

{ #category : #accessing }
Tbl_tps >> uri [
	^ 'tbl_tpses'
]
