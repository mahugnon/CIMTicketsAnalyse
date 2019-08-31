Class {
	#name : #CIMAverageNode,
	#superclass : #CIMTicketGroupNode,
	#instVars : [
		'value'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #visiting }
CIMAverageNode >> acceptBuider: aGuiBuilder [
	aGuiBuilder buildAverageNode
]

{ #category : #initialization }
CIMAverageNode >> initialize [
	super initialize.
	value := 0 asDuration totalSeconds
]

{ #category : #evaluating }
CIMAverageNode >> value [
	^ value
]

{ #category : #accessing }
CIMAverageNode >> value: anObject [
	value := anObject
]
