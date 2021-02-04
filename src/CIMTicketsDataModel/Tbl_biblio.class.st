Class {
	#name : #'Tbl_biblio',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_biblio >> groupedByName [
	^ ((rows groupedBy: #biblio_nom) associations
		select: [ :b | b key matchesRegex: '.*cwm.*' ]) asDictionary
]

{ #category : #utility }
Tbl_biblio >> interestingBibliotheques [
	^ rows select: #isInterestingBibliotheque
]

{ #category : #api }
Tbl_biblio >> joinModulesToLibrary [
self traceCr: 'joinModulesToLibrary'.
	self rows do: [ :bib | bib joinModulesToLibrary ]
]

{ #category : #initialization }
Tbl_biblio >> joinModulesToTickets [
	self rows do: #joinModulesToTickets
]

{ #category : #utilities }
Tbl_biblio >> joinTicketsToBib: aTbl_ft [
	self rows do: [ :bib | bib joinTicketsToBib: aTbl_ft rows ]
]

{ #category : #utility }
Tbl_biblio >> renameUsing: aCollection [
	rows do: [ :row | row renameUsing: aCollection ]
]

{ #category : #utility }
Tbl_biblio >> rowClass [
	^ Tbl_biblio_row
]
