Class {
	#name : #EvolutionBugPresenter,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
EvolutionBugPresenter >> drawEvolutionCorrectionForTickets: aTicketCollection timeQuery: aCIMQuery title: aString [
	| graph roassal |
	graph := PB2GraphsBlueRed new.
	graph maxY: 400.
	graph
		data1:
			((aCIMQuery new runOn: (QueryEvolutions new runOn: aTicketCollection))
				associations collect: [ :ass | ass key -> ass value size ])
				asOrderedDictionary.
	graph
		data2:
			((aCIMQuery new runOn: (QueryBugs new runOn: aTicketCollection))
				associations collect: [ :ass | ass key -> ass value size ])
				asOrderedDictionary.
	"graph exportData: aString , '.csv'."
	roassal := graph draw.
	roassal axisY noDecimal.
	roassal title: aString.
	^ roassal
]
