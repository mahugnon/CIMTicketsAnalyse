Class {
	#name : #'Tbl_cim_service',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #'as yet unclassified' }
Tbl_cim_service >> beginDateApproximation [
	self rows do: #beginDateApproximation
]

{ #category : #'as yet unclassified' }
Tbl_cim_service >> endDateApproximation [
	self rows do: #endDateApproximation
]

{ #category : #'as yet unclassified' }
Tbl_cim_service >> izyProtectDeveloppeurs [
	^ self rows
		select: [ :service | 
			service cim_service = '054 Izy Gest'
				and: [ service cim_libelle ~= 'Honoré' ] ]
]

{ #category : #'as yet unclassified' }
Tbl_cim_service >> joinTicketsToService: aTbl_ft [
	self rows do: [ :ft | ft joinTicketsToService: aTbl_ft rows ]
]

{ #category : #utility }
Tbl_cim_service >> rowClass [
	^ Tbl_cim_service_row
]
