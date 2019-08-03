Class {
	#name : #FamixTkFolder,
	#superclass : #FamixTkAbstractFile,
	#traits : 'FamixTFolder',
	#classTraits : 'FamixTFolder classTrait',
	#category : #'CIMTicketsAnalyseConstatGrammar-Entities-Entities'
}

{ #category : #meta }
FamixTkFolder class >> annotation [

	<MSEClass: #Folder super: #FamixTkAbstractFile>
	<package: #'CIMTicketsAnalyseConstatGrammar-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTkFolder class >> generatedSlotNames [
	<generated>
	'FamixTkFolder class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTkFolder class >> generatedTraitNames [
	<generated>
	^ #(FamixTFolder)
]

{ #category : #meta }
FamixTkFolder class >> requirements [

	<generated>
	^ {  }
]
