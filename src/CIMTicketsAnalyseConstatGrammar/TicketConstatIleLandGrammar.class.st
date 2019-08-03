Class {
	#name : #TicketConstatIleLandGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'constat',
		'fiche',
		'water',
		'ticketNumber'
	],
	#category : #'CIMTicketsAnalyseConstatGrammar-Parser'
}

{ #category : #generating }
TicketConstatIleLandGrammar class >> generate [
	<script>
	PPTASTGenerator
		generateEverythingFrom: TicketConstatIleLandGrammar
		generationStrategy: self generationStrategy
]

{ #category : #accessing }
TicketConstatIleLandGrammar class >> generationStrategy [
	^ PPTASTGeneratorStrategy new
		rulesToFlatten: #(water ticketNumber);
		rulesToIgnore: #();
		parserPackage: #CIMTicketsAnalyseCommentGrammar;
		parserClass: #TicketConstatIleLandParser;
		astPackage: #CIMTicketsAnalyseCommentGrammar;
		astPrefix: #PTAST;
		visitorPackage: #CIMTicketsAnalyseCommentGrammar;
		visitorClass: #TicketConstatIleLandAbstractVisitor;
		yourself
]

{ #category : #accessing }
TicketConstatIleLandGrammar >> constat [
	<reify: #(fiche / water) into: #constat>
	^ (fiche / water) star
]

{ #category : #accessing }
TicketConstatIleLandGrammar >> fiche [
	^ 'fiche' token / 'FT' token / 'navette' token
		, Character space parser , ticketNumber
]

{ #category : #accessing }
TicketConstatIleLandGrammar >> start [
	^constat
]

{ #category : #accessing }
TicketConstatIleLandGrammar >> ticketNumber [
	^ #digit parser times: 5
]

{ #category : #seas }
TicketConstatIleLandGrammar >> water [
	^ #any parser
]
