Class {
	#name : #FamixTkComment,
	#superclass : #FamixTkSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'CIMTicketsAnalyseConstatGrammar-Entities-Entities'
}

{ #category : #meta }
FamixTkComment class >> annotation [

	<MSEClass: #Comment super: #FamixTkSourcedEntity>
	<package: #'CIMTicketsAnalyseConstatGrammar-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTkComment class >> generatedSlotNames [
	<generated>
	'FamixTkComment class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTkComment class >> generatedTraitNames [
	<generated>
	^ #(FamixTComment)
]

{ #category : #meta }
FamixTkComment class >> requirements [

	<generated>
	^ {  }
]
