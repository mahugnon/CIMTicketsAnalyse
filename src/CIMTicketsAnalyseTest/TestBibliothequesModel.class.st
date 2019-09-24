Class {
	#name : #TestBibliothequesModel,
	#superclass : #CIMAbstractModelTest,
	#category : #CIMTicketsAnalyseTest
}

{ #category : #'as yet unclassified' }
TestBibliothequesModel >> testInterestingBibliotheques [
	self assert: bibliotheques interestingBibliotheques size equals: 3
]

{ #category : #tests }
TestBibliothequesModel >> testJoinTicketsToBibs [
	self
		assert: (bibliotheques joinTicketsToBib: tickets) rows second tickets anyOne
		equals: tickets rows first
]

{ #category : #'as yet unclassified' }
TestBibliothequesModel >> testKeepInterestingBibliotheques [
	| ticket |
	ticket := Tbl_ft_row new bibliotheques: bibliotheques rows.
	self assert: ticket keepInterestingBibliotheques size equals: 3
]

{ #category : #tests }
TestBibliothequesModel >> testSetJoinModulesToLibrary [
	bibliotheques joinModulesToLibrary.
	self
		assert:
			(bibliotheques rows
				select: [ :bib | bib modules includes: 'Bordereau' ]) size
		equals: 2
]
