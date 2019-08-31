Class {
	#name : #CIMTicketGroupNode,
	#superclass : #Object,
	#instVars : [
		'tickets',
		'time'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #'as yet unclassified' }
CIMTicketGroupNode class >> groupsFrom: aDictionary [
	^ (aDictionary keys
		collect: [ :key | 
			self new
				time: key;
				addTickets: (aDictionary at: key);
				yourself ]) asOrderedCollection
]

{ #category : #visiting }
CIMTicketGroupNode >> acceptBuider: aGuiBuilder [
	aGuiBuilder buildTicketGroupNode
]

{ #category : #adding }
CIMTicketGroupNode >> addTicket: aTicket [
	tickets add: aTicket
]

{ #category : #adding }
CIMTicketGroupNode >> addTickets: aCollection [
	tickets addAll: aCollection
]

{ #category : #initialization }
CIMTicketGroupNode >> initialize [
	super initialize.
	tickets := OrderedCollection new
]

{ #category : #testing }
CIMTicketGroupNode >> isEmptyOrNil [
	^ tickets isEmptyOrNil
]

{ #category : #accessing }
CIMTicketGroupNode >> size [
	^ tickets size
]

{ #category : #accessing }
CIMTicketGroupNode >> tickets [
	^ tickets
]

{ #category : #accessing }
CIMTicketGroupNode >> time [
	^ time
]

{ #category : #accessing }
CIMTicketGroupNode >> time: anObject [
	time := anObject
]
