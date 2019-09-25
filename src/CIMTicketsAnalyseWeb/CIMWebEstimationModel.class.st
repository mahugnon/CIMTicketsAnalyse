Class {
	#name : #CIMWebEstimationModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'selectedModule'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #initialization }
CIMWebEstimationModel >> initialize [
	super initialize.
	selectedModule := modules first
]

{ #category : #api }
CIMWebEstimationModel >> percentBugs [
	^ self totalBugsTime / self totalTime * 100 asFloat
		printShowingDecimalPlaces: 0
]

{ #category : #api }
CIMWebEstimationModel >> percentEvolutions [
	^ self totalEvolutionTime / self totalTime * 100 asFloat
		printShowingDecimalPlaces: 0
]

{ #category : #accessing }
CIMWebEstimationModel >> selectedModule [
	^ selectedModule
]

{ #category : #accessing }
CIMWebEstimationModel >> selectedModule: anObject [
	selectedModule := anObject
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
