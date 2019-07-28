Class {
	#name : #BugsChart,
	#superclass : #LineChart,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
BugsChart >> cimColor [
	^ Color red
]

{ #category : #initialization }
BugsChart >> initialize [
	super initialize.
	label := 'Bugs'
]