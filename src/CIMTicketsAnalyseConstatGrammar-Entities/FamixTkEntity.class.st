Class {
	#name : #FamixTkEntity,
	#superclass : #MooseEntity,
	#category : #'CIMTicketsAnalyseConstatGrammar-Entities-Entities'
}

{ #category : #meta }
FamixTkEntity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'CIMTicketsAnalyseConstatGrammar-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTkEntity class >> generatedSlotNames [
	<generated>
	'FamixTkEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTkEntity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTkEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixConstatModelGenerator) metamodel
]

{ #category : #meta }
FamixTkEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FamixTkEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTkEntity >> isType [

	<generated>
	^ false
]
