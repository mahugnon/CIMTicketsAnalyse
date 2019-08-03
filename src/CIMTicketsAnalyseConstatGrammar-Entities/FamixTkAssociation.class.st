Class {
	#name : #FamixTkAssociation,
	#superclass : #FamixTkSourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'CIMTicketsAnalyseConstatGrammar-Entities-Entities'
}

{ #category : #meta }
FamixTkAssociation class >> annotation [

	<MSEClass: #Association super: #FamixTkSourcedEntity>
	<package: #'CIMTicketsAnalyseConstatGrammar-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTkAssociation class >> generatedSlotNames [
	<generated>
	'FamixTkAssociation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTkAssociation class >> generatedTraitNames [
	<generated>
	^ #(FamixTAssociation TAssociationMetaLevelDependency)
]

{ #category : #meta }
FamixTkAssociation class >> requirements [

	<generated>
	^ {  }
]
