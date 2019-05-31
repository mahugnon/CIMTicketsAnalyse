Class {
	#name : #'Tbl_biblio',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #'as yet unclassified' }
Tbl_biblio >> renameUsing: aCollection [
	rows do: [ :row | row renameUsing: aCollection ]
]

{ #category : #utility }
Tbl_biblio >> rowClass [
	^ Tbl_biblio_row
]
