Class {
	#name : #PTASTWater,
	#superclass : #Object,
	#instVars : [
		'water'
	],
	#category : #'CIMTicketsAnalyseConstatGrammar-Parser'
}

{ #category : #visiting }
PTASTWater >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTWater: self
]

{ #category : #accessing }
PTASTWater >> water [
	^ water
]

{ #category : #accessing }
PTASTWater >> water: anObject [
	water := anObject
]
