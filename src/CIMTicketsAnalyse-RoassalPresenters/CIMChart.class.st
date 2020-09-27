Class {
	#name : #CIMChart,
	#superclass : #LineChart,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
CIMChart >> cimColor [
	^ Color fromString: '#7D4EBF'
]

{ #category : #'drawing-general' }
CIMChart >> convertYAxis [
	^ [ :v | v asFloat rounded ]
]

{ #category : #initialization }
CIMChart >> initialize [
	super initialize.
	label := 'Number of ticket'.
	title := 'Ticket per dev'
]

{ #category : #'drawing-general' }
CIMChart >> popupTextOn: anObject [
	^ 'Month: ' , anObject key asString , String cr , 'Ticket per dev: '
		, (timeSerie at: anObject key) asFloat asString , String cr
		, 'Median: ' , timeSerie median asString
]
