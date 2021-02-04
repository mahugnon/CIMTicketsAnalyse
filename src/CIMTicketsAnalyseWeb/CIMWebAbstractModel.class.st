Class {
	#name : #CIMWebAbstractModel,
	#superclass : #Object,
	#classInstVars : [
		'current'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebAbstractModel class >> current [
	current ifNil: [ current := self new ].
	^ current
]

{ #category : #initialization }
CIMWebAbstractModel class >> resetCurrent [
	current := nil.
	^ self current
]
