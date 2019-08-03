Class {
	#name : #TestTicketCommentGrammar,
	#superclass : #PP2CompositeNodeTest,
	#category : #'CIMTicketsAnalyseConstatGrammar-Test'
}

{ #category : #accessing }
TestTicketCommentGrammar >> parserClass [
	^ TicketConstatIleLandGrammar
]

{ #category : #tests }
TestTicketCommentGrammar >> testFiche1 [
	self parse: 'fiche 13910' rule: #fiche
]

{ #category : #tests }
TestTicketCommentGrammar >> testFiche2 [
	self parse: 'Fiche 15001' rule: #fiche
]

{ #category : #tests }
TestTicketCommentGrammar >> testFiche3 [
	self parse: 'navette 15387' rule: #fiche
]

{ #category : #tests }
TestTicketCommentGrammar >> testFiche4 [
	self parse: 'FICHE 15611' rule: #fiche
]

{ #category : #tests }
TestTicketCommentGrammar >> testFiche5 [
	self parse: 'FT 12676' rule: #fiche
]

{ #category : #tests }
TestTicketCommentGrammar >> testWater [
	self parse: '' rule: #water
]
