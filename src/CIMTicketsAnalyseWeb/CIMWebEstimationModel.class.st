Class {
	#name : #CIMWebEstimationModel,
	#superclass : #CIMWebAbstractModel,
	#category : #CIMTicketsAnalyseWeb
}

{ #category : #'as yet unclassified' }
CIMWebEstimationModel >> percentBugs [
	^ self totalBugsTime / self totalTime * 100 asFloat
		printShowingDecimalPlaces: 0
]

{ #category : #'as yet unclassified' }
CIMWebEstimationModel >> percentEvolutions [
	^ self totalEvolutionTime / self totalTime * 100 asFloat
		printShowingDecimalPlaces: 0
]

{ #category : #accessing }
CIMWebEstimationModel >> totalBugsTime [
	^ QueryTicketsTimeDev
		runOn:
			(QueryBugs runOn: (CIMTicketGroupNode new tickets: Tbl tbl_ft rows))
]

{ #category : #accessing }
CIMWebEstimationModel >> totalEvolutionTime [
	^ QueryTicketsTimeDev
		runOn:
			(QueryEvolutions
				runOn: (CIMTicketGroupNode new tickets: Tbl tbl_ft rows))
]

{ #category : #accessing }
CIMWebEstimationModel >> totalTime [
	^ QueryTicketsTimeDev
		runOn:
			(QueryBugsEvolutions
				runOn: (CIMTicketGroupNode new tickets: Tbl tbl_ft rows))
]
