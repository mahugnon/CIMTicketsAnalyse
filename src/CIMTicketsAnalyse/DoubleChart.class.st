Class {
	#name : #DoubleChart,
	#superclass : #LineChart,
	#instVars : [
		'secondTimeSerie'
	],
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'drawing-general' }
DoubleChart >> draw [
	| ds |
	graphic := super draw.
	ds := RTData new.
	ds connectColor: (Color fromString: '#E8CC4F').
	ds points: secondTimeSerie keys.
	ds y: [ :key | (secondTimeSerie at: key) - yTranslation ].
	ds label: label.
	ds interaction popup text: [ :elt | self popupTextOn: elt ].
	graphic add: ds.
	graphic
		add:
			(self
				linearRegressionDataSetOn: secondTimeSerie
				color: (Color fromString: '#F6FED6')).
	^ graphic
]

{ #category : #accessing }
DoubleChart >> secondTimeSerie [
	^ secondTimeSerie
]

{ #category : #accessing }
DoubleChart >> secondTimeSerie: anObject [
	secondTimeSerie := anObject
]
