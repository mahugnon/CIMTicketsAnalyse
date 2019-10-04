Class {
	#name : #'Tbl_ft',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #adding }
Tbl_ft >> addAssociatedFiles: aCollection [
	self flag: 'To be improved'.
	aCollection
		do: [ :aCommitComment | 
			rows
				detect:
					[ :row | row ft_numordre asInteger = aCommitComment ticketNumber asInteger ]
				ifFound: [ :founded | 
					founded addAssociatedPhysiqueFile: aCommitComment fileName.
					founded addAssociatedPhysiqueModule: aCommitComment directory ] ]
]

{ #category : #utilities }
Tbl_ft >> analyseContat [
	self rows do: [ :ft | ft analyseContat ]
]

{ #category : #utilities }
Tbl_ft >> associateToTicketFileIn: aFolder [
	| folderReference |
	folderReference := aFolder asFileReference.
	^ self
		addAssociatedFiles: (QueryAllCommitComment runOn: folderReference)
]

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
	self rows do: [ :ft | ft joinBibsToTicket: aTbl_biblio rows ]
]

{ #category : #utilities }
Tbl_ft >> joinDevToTicket: aTbl_dev [
	self rows do: [ :ft | ft joinDevToTicket: aTbl_dev rows ]
]

{ #category : #initialization }
Tbl_ft >> joinModulesToTickets [
	^ rows do: #joinModulesToTickets
]

{ #category : #api }
Tbl_ft >> joinRetourToTickets: aTbl_retour [
	self rows
		do: [ :ticket | ticket joinRetourToTickets: aTbl_retour rows ]
]

{ #category : #api }
Tbl_ft >> joinTestToTicket: aTbl_test [
	rows do: [ :row | row joinTestToTicket: aTbl_test rows ]
]

{ #category : #utilities }
Tbl_ft >> joinTpsDevToTicket: aTbl_Tps [
	rows do: [ :aTicket | aTicket joinTpsDevToTicket: aTbl_Tps rows ]
]

{ #category : #utilites }
Tbl_ft >> joinTypeCorrectionToTicket: aType_correction [
	self rows
		do: [ :ft | ft joinTypeCorrectionToTicket: aType_correction rows ]
]

{ #category : #utilities }
Tbl_ft >> joinVersionsToTicket: aTbl_version [
	self rows do: [ :ft | ft joinVersionsToTicket: aTbl_version rows ]
]

{ #category : #utilities }
Tbl_ft >> keepInterestingBibliotheques [
	^ self rows do: [ :row | row keepInterestingBibliotheques ]
]

{ #category : #utilities }
Tbl_ft >> rowClass [
	^ Tbl_ft_row
]
