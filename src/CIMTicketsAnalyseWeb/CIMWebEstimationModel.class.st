Class {
	#name : #CIMWebEstimationModel,
	#superclass : #Object,
	#instVars : [
		'totalTime',
		'percentBugs',
		'percentEvolutions',
		'modelData'
	],
	#classInstVars : [
		'current'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebEstimationModel class >> current [
	current
		ifNil: [ current := self basicNew
				modelData:
					(QueryBugsEvolutions
						runOn: (CIMTicketGroupNode new tickets: Tbl tbl_ft rows));
				initialize ].
	^ current
]

{ #category : #accessing }
CIMWebEstimationModel class >> resetCurrent [
	<script>
	current := nil.
	self current
]

{ #category : #initialization }
CIMWebEstimationModel >> initialize [
	super initialize.
	self initializeTotalTime.
	self initializePercentBugs.
	self initializePercentEvolutions
]

{ #category : #api }
CIMWebEstimationModel >> initializePercentBugs [
	percentBugs := self totalBugsTime / self totalTime * 100 asFloat
		printShowingDecimalPlaces: 0
]

{ #category : #api }
CIMWebEstimationModel >> initializePercentEvolutions [
	percentEvolutions := self totalEvolutionTime / self totalTime
		* 100 asFloat printShowingDecimalPlaces: 0
]

{ #category : #accessing }
CIMWebEstimationModel >> initializeTotalTime [
	totalTime := QueryTicketsTimeDev runOn: modelData
]

{ #category : #accessing }
CIMWebEstimationModel >> modelData [
	^ modelData
]

{ #category : #accessing }
CIMWebEstimationModel >> modelData: anObject [
	modelData := anObject
]

{ #category : #api }
CIMWebEstimationModel >> percentBugs [
	^ percentBugs
]

{ #category : #accessing }
CIMWebEstimationModel >> percentBugs: anObject [
	percentBugs := anObject
]

{ #category : #api }
CIMWebEstimationModel >> percentEvolutions [
	^ percentEvolutions
]

{ #category : #accessing }
CIMWebEstimationModel >> percentEvolutions: anObject [
	percentEvolutions := anObject
]

{ #category : #accessing }
CIMWebEstimationModel >> totalBugsTime [
	^ QueryTicketsTimeDev runOn: (QueryBugs runOn: modelData)
]

{ #category : #accessing }
CIMWebEstimationModel >> totalEvolutionTime [
	^ QueryTicketsTimeDev runOn: (QueryEvolutions runOn: modelData)
]

{ #category : #accessing }
CIMWebEstimationModel >> totalTime [
	^ totalTime
]

{ #category : #accessing }
CIMWebEstimationModel >> totalTime: anObject [
	totalTime := anObject
]
