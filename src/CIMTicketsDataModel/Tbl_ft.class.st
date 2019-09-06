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

{ #category : #utility }
Tbl_ft >> analyseContat [
	self rows do: [ :ft | ft analyseContat ]
]

{ #category : #utility }
Tbl_ft >> associateToTicketFileIn: aFolder [
	| folderReference |
	folderReference := aFolder asFileReference.
	^ self
		addAssociatedFiles: (QueryAllCommitComment runOn: folderReference)
]

{ #category : #utility }
Tbl_ft >> filFromCSVFile: aCsvFile [
	super filFromCSVFile: aCsvFile.
	rows := rows
		select: [ :row| 
			| date |
			date := row ft_datecrea.
			(date ifNil: [ Date new ] ifNotNil: [ date ]) year > 2003 ]
]

{ #category : #utilities }
Tbl_ft >> joinTpsDevToTicket: aTbl_Tps [
	rows
		do: [ :aTicket | 
			aTicket
				devTps:
					(aTbl_Tps rows select: [ :aTps | aTps tps_dev_id = aTicket ft_dev_id ]) ]
]

{ #category : #utility }
Tbl_ft >> keepInterestingBibliotheques [
	^ self rows do: [ :row | row keepInterestingBibliotheques ]
]

{ #category : #utility }
Tbl_ft >> rowClass [
	^ Tbl_ft_row
]

{ #category : #initialization }
Tbl_ft >> setModules [
	^ rows do: #setModules
]
