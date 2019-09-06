Class {
	#name : #TestBibliothequesModel,
	#superclass : #CIMAbstractModelTest,
	#category : #CIMTicketsAnalyseTest
}

{ #category : #'as yet unclassified' }
TestBibliothequesModel >> testInterestingBibliotheques [
	self assert: bibliotheques interestingBibliotheques size equals: 3
]

{ #category : #'as yet unclassified' }
TestBibliothequesModel >> testKeepInterestingBibliotheques [
	| ticket |
	ticket := Tbl_ft_row new bibliotheques: bibliotheques rows.
	self assert: ticket keepInterestingBibliotheques size equals: 3
]
