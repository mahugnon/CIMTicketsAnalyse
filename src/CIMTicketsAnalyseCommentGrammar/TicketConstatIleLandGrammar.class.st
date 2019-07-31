Class {
	#name : #TicketConstatIleLandGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'constat',
		'fiche'
	],
	#category : #CIMTicketsAnalyseCommentGrammar
}

{ #category : #accessing }
TicketConstatIleLandGrammar >> constat [
	^ (fiche / #any parser) plus
]

{ #category : #accessing }
TicketConstatIleLandGrammar >> fiche [
	^ 'fiche' token / 'FT' token / 'navette' token
		, Character space parser , #digit parser plus
]

{ #category : #accessing }
TicketConstatIleLandGrammar >> start [
	^constat
]
