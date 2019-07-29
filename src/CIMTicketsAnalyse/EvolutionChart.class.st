Class {
	#name : #EvolutionChart,
	#superclass : #CIMAbstractChart,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
EvolutionChart >> cimColor [
	^ Color blue
]

{ #category : #initialization }
EvolutionChart >> initialize [
	super initialize.
	label := 'Evolution'
]
