Class {
	#name : #BibChart,
	#superclass : #CIMChart,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #initialization }
BibChart >> initialize [
	super initialize.
	label := 'Bibliotheques'.
	title := 'Bibliotheques per ticket'
]

{ #category : #'drawing-general' }
BibChart >> popupTextOn: anObject [
	^ 'Month: ' , anObject key asString , String cr
		, 'Number of bibliotheques: '
		, (timeSerie at: anObject key) asFloat asString , String cr
		, 'Median: ' , timeSerie median asString
]
