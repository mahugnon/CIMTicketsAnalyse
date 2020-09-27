Class {
	#name : #EvolutionChart,
	#superclass : #LineChart,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
EvolutionChart class >> selectQuery [
	^ QueryEvolutions
]

{ #category : #'as yet unclassified' }
EvolutionChart >> cimColor [
	^ Color blue
]

{ #category : #initialization }
EvolutionChart >> initialize [
	super initialize.
	label := 'Evolution'
]
