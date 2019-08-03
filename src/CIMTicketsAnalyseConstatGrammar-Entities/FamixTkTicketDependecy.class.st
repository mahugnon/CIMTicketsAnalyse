Class {
	#name : #FamixTkTicketDependecy,
	#superclass : #FamixTkAssociation,
	#instVars : [
		'#dependedTicket => FMOne type: #FamixTkTicket opposite: #dependencies',
		'#dependent => FMOne type: #FamixTkTicket opposite: #dependedOnTickets'
	],
	#category : #'CIMTicketsAnalyseConstatGrammar-Entities-Entities'
}

{ #category : #meta }
FamixTkTicketDependecy class >> annotation [

	<MSEClass: #TicketDependecy super: #FamixTkAssociation>
	<package: #'CIMTicketsAnalyseConstatGrammar-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTkTicketDependecy class >> generatedSlotNames [
	<generated>
	'FamixTkTicketDependecy class>>#generatedSlotNames'.
	^ #(dependedTicket dependent)
]

{ #category : #generator }
FamixTkTicketDependecy class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTkTicketDependecy class >> requirements [

	<generated>
	^ { FamixTkTicket }
]

{ #category : #accessing }
FamixTkTicketDependecy >> belongsTo [

	<generated>
	^ self dependedTicket

]

{ #category : #accessing }
FamixTkTicketDependecy >> belongsTo: anObject [

	<generated>
	self dependedTicket: anObject

]

{ #category : #accessing }
FamixTkTicketDependecy >> dependedTicket [

	<generated>
	<container>

	^ dependedTicket
]

{ #category : #accessing }
FamixTkTicketDependecy >> dependedTicket: anObject [

	<generated>
	dependedTicket := anObject

]

{ #category : #navigation }
FamixTkTicketDependecy >> dependedTicketGroup [

	<generated>
	<navigation: 'DependedTicket'>
	^ MooseGroup
			with: (self dependedTicket)
]

{ #category : #accessing }
FamixTkTicketDependecy >> dependent [

	<generated>
	^ dependent
]

{ #category : #accessing }
FamixTkTicketDependecy >> dependent: anObject [

	<generated>
	dependent := anObject

]
