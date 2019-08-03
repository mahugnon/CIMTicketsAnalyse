Class {
	#name : #FamixTkFile,
	#superclass : #FamixTkAbstractFile,
	#traits : 'FamixTFile',
	#classTraits : 'FamixTFile classTrait',
	#category : #'CIMTicketsAnalyseConstatGrammar-Entities-Entities'
}

{ #category : #meta }
FamixTkFile class >> annotation [

	<MSEClass: #File super: #FamixTkAbstractFile>
	<package: #'CIMTicketsAnalyseConstatGrammar-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTkFile class >> generatedSlotNames [
	<generated>
	'FamixTkFile class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTkFile class >> generatedTraitNames [
	<generated>
	^ #(FamixTFile)
]

{ #category : #meta }
FamixTkFile class >> requirements [

	<generated>
	^ {  }
]
