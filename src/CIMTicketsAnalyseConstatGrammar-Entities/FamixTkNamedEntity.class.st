Class {
	#name : #FamixTkNamedEntity,
	#superclass : #FamixTkSourcedEntity,
	#traits : 'FamixTNamed + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'CIMTicketsAnalyseConstatGrammar-Entities-Entities'
}

{ #category : #meta }
FamixTkNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FamixTkSourcedEntity>
	<package: #'CIMTicketsAnalyseConstatGrammar-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTkNamedEntity class >> generatedSlotNames [
	<generated>
	'FamixTkNamedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTkNamedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixTkNamedEntity class >> requirements [

	<generated>
	^ {  }
]
