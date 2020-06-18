Class {
	#name : #CIMTicketGroupNode,
	#superclass : #Object,
	#instVars : [
		'tickets',
		'time',
		'name'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #'as yet unclassified' }
CIMTicketGroupNode class >> emptyGroup [
	^ self new tickets: {}
]

{ #category : #'as yet unclassified' }
CIMTicketGroupNode class >> groupsFrom: aDictionary [
	^ (aDictionary keys
		collect: [ :key | 
			self new
				time: key;
				tickets: (aDictionary at: key);
				yourself ]) asOrderedCollection
]

{ #category : #visiting }
CIMTicketGroupNode >> acceptBuider: aGuiBuilder [
	^ aGuiBuilder buildTicketGroupNode: self
]

{ #category : #adding }
CIMTicketGroupNode >> addTicket: aTicket [
	tickets add: aTicket
]

{ #category : #accessing }
CIMTicketGroupNode >> content [
	^ self tickets
]

{ #category : #initialization }
CIMTicketGroupNode >> initialize [
	super initialize.
	tickets := OrderedCollection new
]

{ #category : #api }
CIMTicketGroupNode >> isEmpty [
	^ tickets isEmpty
]

{ #category : #testing }
CIMTicketGroupNode >> isEmptyNode [
	^ self content isEmpty
]

{ #category : #testing }
CIMTicketGroupNode >> isEmptyOrNil [
	^ tickets isEmptyOrNil
]

{ #category : #accessing }
CIMTicketGroupNode >> size [
	self isEmpty
		ifTrue: [ ^ 1 ].
	^ tickets size
]

{ #category : #accessing }
CIMTicketGroupNode >> tickets [
	^ tickets
]

{ #category : #accessing }
CIMTicketGroupNode >> tickets: anObject [
	tickets := anObject
]

{ #category : #accessing }
CIMTicketGroupNode >> time [
	^ time
]

{ #category : #accessing }
CIMTicketGroupNode >> time: anObject [
	time := anObject
]

{ #category : #api }
CIMTicketGroupNode >> updateRoassalModel: aRoassalPresenterModel [
	aRoassalPresenterModel modelData: self
]
