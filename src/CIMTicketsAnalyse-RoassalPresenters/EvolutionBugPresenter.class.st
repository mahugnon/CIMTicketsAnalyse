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
	graph data1 size > 0 | (graph data2 size > 0)
		ifTrue: [ roassal := graph draw.
			roassal  axisY noDecimal.
			roassal title: aString ].
	^ roassal
]

{ #category : #'as yet unclassified' }
EvolutionBugPresenter >> exportEvolutionCorrectionPerYearForTickets: aTicketCollection title: aString [
	| graph |
	graph := self
		drawEvolutionCorrectionForTickets: aTicketCollection
		timeQuery: QueryTicketPerYear
		title: aString.
	graph ifNil: [ ^ self ].
	^ RTPNGExporter new
		builder: graph build;
		fileName: self location , '/' , aString , '.png';
		exportToFile
]

{ #category : #accessing }
EvolutionBugPresenter >> location [
	^ 'C:/Users\h.houekpetodji/Documents/Pharo/images/utility/Plot11062019'
]
