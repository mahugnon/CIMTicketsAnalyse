Class {
	#name : #CIMGrapher,
	#superclass : #RTGrapher,
	#instVars : [
		'isSetMaxY',
		'isSetMinY'
	],
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #initialization }
CIMGrapher >> initialize [
	super initialize.
	isSetMaxY := false.
	isSetMinY := false
]

{ #category : #accessing }
CIMGrapher >> maxY [
	isSetMaxY
		ifFalse: [ ^ super maxY ].
	^ maxY
]

{ #category : #'public - accessing' }
CIMGrapher >> maxY: aNumber [
	super maxY: aNumber.
	isSetMaxY := true
]

{ #category : #accessing }
CIMGrapher >> minY [
	isSetMinY
		ifFalse: [ ^ super minY ].
	^ minY
]

{ #category : #'public - accessing' }
CIMGrapher >> minY: aNumber [
	super minY: aNumber.
	isSetMinY := true
]
