Class {
	#name : #FamixTkAbstractFile,
	#superclass : #FamixTkNamedEntity,
	#traits : 'FamixTFileSystemEntity',
	#classTraits : 'FamixTFileSystemEntity classTrait',
	#category : #'CIMTicketsAnalyseConstatGrammar-Entities-Entities'
}

{ #category : #meta }
FamixTkAbstractFile class >> annotation [

	<MSEClass: #AbstractFile super: #FamixTkNamedEntity>
	<package: #'CIMTicketsAnalyseConstatGrammar-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTkAbstractFile class >> generatedSlotNames [
	<generated>
	'FamixTkAbstractFile class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTkAbstractFile class >> generatedTraitNames [
	<generated>
	^ #(FamixTFileSystemEntity)
]

{ #category : #meta }
FamixTkAbstractFile class >> requirements [

	<generated>
	^ {  }
]
