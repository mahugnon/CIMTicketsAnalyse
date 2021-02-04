Class {
	#name : #'Tbl_ft',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #utilities }
Tbl_ft >> filFromCSVFile: aCsvFile [
	super filFromCSVFile: aCsvFile.
	rows := rows
		select: [ :row| 
			| date |
			date := row ft_datecrea.
			(date ifNil: [ Date new ] ifNotNil: [ date ]) year > 2003 ]
]

{ #category : #utilities }
Tbl_ft >> joinBibsToTicket: aTbl_biblio [
self traceCr: 'joinBibsToTicket'.
	self rows do: [ :ft | ft joinBibsToTicket: aTbl_biblio rows ]
]

{ #category : #utilities }
Tbl_ft >> joinDevToTicket: aTbl_dev [
self traceCr: 'joinDevToTicket '.
	self rows do: [ :ft | ft joinDevToTicket: aTbl_dev rows ]
]

{ #category : #initialization }
Tbl_ft >> joinModulesToTickets [
self traceCr: 'joinModulesToTickets'.
	^ rows do: #joinModulesToTickets
]

{ #category : #api }
Tbl_ft >> joinRetoursToTickets: aTbl_retour [
self traceCr: 'joinRetoursToTickets'.
	self rows
		do: [ :ticket | ticket joinRetourToTicket: aTbl_retour rows ]
]

{ #category : #api }
Tbl_ft >> joinTestToTicket: aTbl_test [
self traceCr: 'joinTestToTicket'.
	rows do: [ :row | row joinTestToTicket: aTbl_test rows ]
]

{ #category : #utilities }
Tbl_ft >> joinTpsDevToTicket: aTbl_Tps [
self traceCr: 'joinTpsDevToTicket'.
	rows do: [ :aTicket | aTicket joinTpsDevToTicket: aTbl_Tps rows ]
]

{ #category : #utilites }
Tbl_ft >> joinTypeCorrectionToTicket: aType_correction [
self traceCr: 'joinTypeCorrectionToTicket '.
	self rows
		do: [ :ft | ft joinTypeCorrectionToTicket: aType_correction rows ]
]

{ #category : #utilities }
Tbl_ft >> joinVersionsToTicket: aTbl_version [
self traceCr: 'joinVersionsToTicket'.
	self rows do: [ :ft | ft joinVersionsToTicket: aTbl_version rows ]
]

{ #category : #utilities }
Tbl_ft >> keepInterestingBibliotheques [
	^ self rows do: [ :row | row keepInterestingBibliotheques ]
]

{ #category : #initialization }
Tbl_ft >> pageSize [ 
^'1000'
]

{ #category : #removing }
Tbl_ft >> removeUselessRows [
	self flag: 'Can be improve by removing tps as well'.
	rows := (QueryBugsEvolutions
		runOn: (QueryCleanData runOn: (CIMTicketGroupNode new tickets: rows)))
		tickets
]

{ #category : #utilities }
Tbl_ft >> rowClass [
	^ Tbl_ft_row
]
