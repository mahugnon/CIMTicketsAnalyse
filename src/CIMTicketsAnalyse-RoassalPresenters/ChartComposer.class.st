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
	composer gap: 35.
	aDictionary
		keysDo: [ :graphName | 
			| g |
			g := aDictionary at: graphName.
			g view: composer view.
			composer group: graphName asSymbol.
			g build ].
	composer setGeneralTitle: aString.
	composer layout: RTHorizontalLineLayout new.
	composer groups do: [ :g | composer nameGroup: g as: g asString ].
	composer propagateHighlightToAll.
	^ composer view
]
