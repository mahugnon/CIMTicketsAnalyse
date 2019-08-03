Class {
	#name : #TicketConstatIleLandParser,
	#superclass : #TicketConstatIleLandGrammar,
	#category : #'CIMTicketsAnalyseConstatGrammar-Parser'
}

{ #category : #rules }
TicketConstatIleLandParser >> constat [
	<generated>
	^ super constat ==> [ :production | PTASTConstat new constats: production; yourself ]
]

{ #category : #rules }
TicketConstatIleLandParser >> fiche [
	<generated>
	^ super fiche ==> [ :production | PTASTFiche new ticketNumber: (production at: 3); yourself ]
]

{ #category : #helpers }
TicketConstatIleLandParser >> rejectSeparators: anArray [
	<generated>
	^ anArray withIndexSelect: [:anElement :anIndex | anIndex odd]
]

{ #category : #helpers }
TicketConstatIleLandParser >> selectSeparators: anArray [
	<generated>
	^ anArray withIndexSelect: [:anElement :anIndex | anIndex even]
]

{ #category : #rules }
TicketConstatIleLandParser >> ticketNumber [
	<generated>
	^ super ticketNumber flatten  ==> [ :production | PTASTTicketNumber new ticketNumber: production; yourself ]
]

{ #category : #rules }
TicketConstatIleLandParser >> water [
	<generated>
	^ super water flatten  ==> [ :production | PTASTWater new water: production; yourself ]
]
