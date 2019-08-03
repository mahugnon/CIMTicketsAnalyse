Class {
	#name : #FamixConstatModelGenerator,
	#superclass : #FamixFileBasedLanguageGenerator,
	#instVars : [
		'ticket',
		'ticketDependency'
	],
	#category : #'CIMTicketsAnalyseConstatGrammar-FamixModelGenerator'
}

{ #category : #accessing }
FamixConstatModelGenerator class >> generateMe [
	<script>
	self generate
]

{ #category : #accessing }
FamixConstatModelGenerator class >> packageName [
	^ #'CIMTicketsAnalyseConstatGrammar-Entities'
]

{ #category : #accessing }
FamixConstatModelGenerator class >> prefix [
	^ #FamixTk
]

{ #category : #definition }
FamixConstatModelGenerator >> defineClasses [
	super defineClasses.
	ticket := builder newClassNamed: #Ticket.
	ticketDependency := builder newClassNamed: #TicketDependecy.
	
]

{ #category : #definition }
FamixConstatModelGenerator >> defineHierarchy [
	super defineHierarchy.
	ticket --|> #TNamed.
	ticketDependency --|> association
]

{ #category : #definition }
FamixConstatModelGenerator >> defineProperties [
	ticket property: #number type: #Number
]

{ #category : #definition }
FamixConstatModelGenerator >> defineRelations [
	(ticket property: #dependencies)
		<>-* (ticketDependency property: #dependedTicket).
	(ticket property: #dependedOnTickets)
		-* (ticketDependency property: #dependent)
]

{ #category : #definition }
FamixConstatModelGenerator >> newBuilder [
	^ super newBuilder
		withImportingContext;
		yourself
]
