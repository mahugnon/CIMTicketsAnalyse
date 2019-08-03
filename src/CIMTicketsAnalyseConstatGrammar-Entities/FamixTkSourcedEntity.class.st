Class {
	#name : #FamixTkSourcedEntity,
	#superclass : #FamixTkEntity,
	#traits : 'FamixTWithComments + FamixTWithFiles + FamixTWithSourceAnchor + FamixTWithSourceLanguage',
	#classTraits : 'FamixTWithComments classTrait + FamixTWithFiles classTrait + FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait',
	#category : #'CIMTicketsAnalyseConstatGrammar-Entities-Entities'
}

{ #category : #meta }
FamixTkSourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FamixTkEntity>
	<package: #'CIMTicketsAnalyseConstatGrammar-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTkSourcedEntity class >> generatedSlotNames [
	<generated>
	'FamixTkSourcedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTkSourcedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithComments FamixTWithFiles FamixTWithSourceAnchor FamixTWithSourceLanguage)
]

{ #category : #meta }
FamixTkSourcedEntity class >> requirements [

	<generated>
	^ {  }
]
