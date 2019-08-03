Class {
	#name : #FamixTkSourceAnchor,
	#superclass : #FamixTkEntity,
	#traits : 'FamixTSourceAnchor + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceAnchor classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'CIMTicketsAnalyseConstatGrammar-Entities-Entities'
}

{ #category : #meta }
FamixTkSourceAnchor class >> annotation [

	<MSEClass: #SourceAnchor super: #FamixTkEntity>
	<package: #'CIMTicketsAnalyseConstatGrammar-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTkSourceAnchor class >> generatedSlotNames [
	<generated>
	'FamixTkSourceAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTkSourceAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceAnchor TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixTkSourceAnchor class >> requirements [

	<generated>
	^ {  }
]
