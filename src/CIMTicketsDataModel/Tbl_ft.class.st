Class {
	#name : #'Tbl_ft',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #adding }
Tbl_ft >> addAssociatedFiles: aCollection [
	aCollection
		do: [ :aCommitComment | 
			rows
				detect:
					[ :row | row ft_numordre asInteger = aCommitComment ticketNumber asInteger ]
				ifFound: [ :founded | founded addAssociatedPhysique: aCommitComment fileName ] ]
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
