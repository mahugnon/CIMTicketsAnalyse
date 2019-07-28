Class {
	#name : #DevChart,
	#superclass : #LineChart,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
DevChart >> cimColor [
	^ Color fromString: '#7D4EBF'
]

{ #category : #'drawing-general' }
DevChart >> convertYAxis [
	^ [ :v | v ]
]

{ #category : #initialization }
DevChart >> initialize [
	super initialize.
	label := ''.
	title := 'Ticket per dev'
]

{ #category : #'drawing-general' }
DevChart >> popupTextOn: anObject [
	^ 'Month: ' , anObject key asString , String cr , 'Ticket per dev: '
		, (timeSerie at: anObject key) asFloat asString , String cr
		, 'Median: ' , timeSerie median asString
]
