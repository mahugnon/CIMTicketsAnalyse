Class {
	#name : #CIMWebTimeSpentChartModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'cimWebLineBarModel'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebTimeSpentChartModel class >> current [
	current ifNil: [ current := self new ].
	^ current
]

{ #category : #'as yet unclassified' }
CIMWebTimeSpentChartModel >> initialize [
	cimWebLineBarModel := CIMWebLineBarModel current.
	self modelData: cimWebLineBarModel modelData
]
