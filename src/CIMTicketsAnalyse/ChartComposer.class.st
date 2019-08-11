Class {
	#name : #ChartComposer,
	#superclass : #CIMChart,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
ChartComposer >> compose: aDictionary title: aString [
	"The idea here is to put different chart in the same view"

	| composer |
	composer := RTComposer new.
	aDictionary
		keysDo: [ :graphName | 
			(aDictionary at: graphName) view: composer view.
			composer group: graphName asSymbol ].
	composer setGeneralTitle: aString.
	^ composer view
]
