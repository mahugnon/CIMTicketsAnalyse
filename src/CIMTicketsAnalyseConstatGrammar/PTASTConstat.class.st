Class {
	#name : #PTASTConstat,
	#superclass : #Object,
	#instVars : [
		'constats'
	],
	#category : #'CIMTicketsAnalyseConstatGrammar-Parser'
}

{ #category : #visiting }
PTASTConstat >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTConstat: self
]

{ #category : #accessing }
PTASTConstat >> constats [
	^ constats
]

{ #category : #accessing }
PTASTConstat >> constats: anObject [
	constats := anObject
]
