Class {
	#name : #'Tbl_tps',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #utilities }
Tbl_tps >> joinTypeSessionToTps: aTbl_TypeSession [
	self rows
		do: [ :tps | 
			aTbl_TypeSession rows
				detect: [ :typeSession | tps tps_type = typeSession typsession_id ]
				ifFound: [ :founded | tps typeSession: founded ]
				ifNone: [  ] ]
]

{ #category : #utility }
Tbl_tps >> rowClass [
	^ Tbl_tps_row
]
