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

{ #category : #utility }
Tbl_biblio >> renameUsing: aCollection [
	rows do: [ :row | row renameUsing: aCollection ]
]

{ #category : #utility }
Tbl_biblio >> rowClass [
	^ Tbl_biblio_row
]

{ #category : #initialization }
Tbl_biblio >> setModules [
	self rows do: #setModule
]
