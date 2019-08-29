Class {
	#name : #CIMMovingAverageNode,
	#superclass : #CIMAverageNode,
	#instVars : [
		'averageNodes'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #initialization }
CIMMovingAverageNode >> initialize [
	super initialize.
	averageNodes := OrderedCollection new
]

{ #category : #accessing }
CIMMovingAverageNode >> tickets [
	^ (averageNodes collect: #tickets) flatten asSet
]
