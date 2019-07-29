Class {
	#name : #TimeResolutionChart,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
TimeResolutionChart >> drawOn: aCollection withTimeQuery: aTimeQuery andTicketTypeQuery: aTicketQuery [
	CIMAbstractChart new
		draw:
			(QueryAvgTimeOnTicketsGroupedByTime new
				runOn: (aTimeQuery new runOn: (aTicketQuery new runOn: aCollection)))
]
