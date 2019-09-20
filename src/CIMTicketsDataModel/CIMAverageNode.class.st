Class {
	#name : #CIMAverageNode,
	#superclass : #CIMTicketGroupNode,
	#instVars : [
		'ticketGroup',
		'value'
	],
	#category : #CIMTicketsDataModel
}

{ #category : #visiting }
CIMAverageNode >> acceptBuider: aGuiBuilder [
	aGuiBuilder buildAverageNode: self
]

{ #category : #accessing }
CIMAverageNode >> content [
	^ self tickets
]

{ #category : #initialization }
CIMAverageNode >> initialize [
	super initialize.
	value := 0 asDuration totalSeconds
]

{ #category : #accessing }
CIMAverageNode >> ticketGroup [
	^ ticketGroup
]

{ #category : #accessing }
CIMAverageNode >> ticketGroup: anObject [
	ticketGroup := anObject
]

{ #category : #accessing }
CIMAverageNode >> tickets [
	^ tickets
]

{ #category : #evaluating }
CIMAverageNode >> value [
	^ value
]

{ #category : #accessing }
CIMAverageNode >> value: anObject [
	value := anObject
]
