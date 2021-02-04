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
				detect: [ :typeSession | 
					tps tps_type
						ifNil: [ false ]
						ifNotNil:
							[ tps tps_type asInteger asString = typeSession typsession_id asString ] ]
				ifFound: [ :founded | tps typeSession: founded ]
				ifNone: [  ] ]

	"self rows do: [ :tps | tps joinTypeSessionToTps: aTbl_TypeSession ]"

]

{ #category : #utility }
Tbl_tps >> rowClass [
	^ Tbl_tps_row
]

{ #category : #accessing }
Tbl_tps >> uri [
	^ 'tbl_tpses'
]
