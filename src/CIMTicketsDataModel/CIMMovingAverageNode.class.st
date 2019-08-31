Class {
	#name : #CIMMovingAverageNode,
	#superclass : #CIMAverageNode,
	#instVars : [
		'averageNodes'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #visiting }
CIMMovingAverageNode >> acceptBuider: aGuiBuilder [
	aGuiBuilder buildMovingAverageNode
]

{ #category : #accessing }
CIMMovingAverageNode >> averageNodes [
	^ averageNodes
]

{ #category : #accessing }
CIMMovingAverageNode >> averageNodes: anObject [
	averageNodes := anObject
]

{ #category : #initialization }
CIMMovingAverageNode >> initialize [
	super initialize.
	averageNodes := OrderedCollection new
]

{ #category : #accessing }
CIMMovingAverageNode >> tickets [
	^ (averageNodes collect: #tickets) flatten asSet
]
