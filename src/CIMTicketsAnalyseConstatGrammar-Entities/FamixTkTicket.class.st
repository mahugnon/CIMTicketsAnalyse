Class {
	#name : #FamixTkTicket,
	#superclass : #MooseEntity,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#instVars : [
		'#dependedOnTickets => FMMany type: #FamixTkTicketDependecy opposite: #dependent',
		'#dependencies => FMMany type: #FamixTkTicketDependecy opposite: #dependedTicket',
		'#number'
	],
	#category : #'CIMTicketsAnalyseConstatGrammar-Entities-Entities'
}

{ #category : #meta }
FamixTkTicket class >> annotation [

	<MSEClass: #Ticket super: #MooseEntity>
	<package: #'CIMTicketsAnalyseConstatGrammar-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTkTicket class >> generatedSlotNames [
	<generated>
	'FamixTkTicket class>>#generatedSlotNames'.
	^ #(dependedOnTickets dependencies number)
]

{ #category : #generator }
FamixTkTicket class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
FamixTkTicket class >> metamodel [

	<generated>
	^ (self class environment at: #FamixConstatModelGenerator) metamodel
]

{ #category : #meta }
FamixTkTicket class >> requirements [

	<generated>
	^ {  }
]

{ #category : #adding }
FamixTkTicket >> addDependencies: anObject [
			
	<generated>
	^ self dependencies add: anObject
]

{ #category : #accessing }
FamixTkTicket >> dependedOnTickets [

	<generated>
	^ dependedOnTickets
]

{ #category : #accessing }
FamixTkTicket >> dependedOnTickets: anObject [

	<generated>
	dependedOnTickets value: anObject

]

{ #category : #accessing }
FamixTkTicket >> dependencies [

	<generated>
	^ dependencies
]

{ #category : #accessing }
FamixTkTicket >> dependencies: anObject [

	<generated>
	dependencies value: anObject

]

{ #category : #navigation }
FamixTkTicket >> dependenciesGroup [

	<generated>
	<navigation: 'Dependencies'>
	^ MooseGroup
			withAll: (self dependencies asSet)
]

{ #category : #testing }
FamixTkTicket >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkTicket >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkTicket >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkTicket >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkTicket >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkTicket >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkTicket >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkTicket >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkTicket >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkTicket >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkTicket >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkTicket >> isType [

	<generated>
	^ false
]

{ #category : #accessing }
FamixTkTicket >> number [

	<MSEProperty: #number type: #Number>
	<generated>
	^ number
]

{ #category : #accessing }
FamixTkTicket >> number: anObject [

	<generated>
	number := anObject

]
