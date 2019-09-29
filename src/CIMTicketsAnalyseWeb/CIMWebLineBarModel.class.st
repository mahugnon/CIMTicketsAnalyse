Class {
	#name : #CIMWebLineBarModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'percentModuleTime',
		'avgTimeDevTpsTotalMinusEstimTicketsPerYear'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebLineBarModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #'private - utility' }
CIMWebLineBarModel >> avgTimeDevTpsTotalMinusEstimTicketsPerYear [
	^ avgTimeDevTpsTotalMinusEstimTicketsPerYear
]

{ #category : #'private - utility' }
CIMWebLineBarModel >> avgTimeDevTpsTotalMinusEstimTicketsPerYear: selectQuery [
	^ QueryMovingAverage
		runOn:
			(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
				runOn:
					(QueryTicketPerYearClosing
						runOn:
							(selectQuery
								runOn:
									(QueryRejectNilEstimation
										runOn: (QueryClosed new runOn: self modelData)))))
	"reject: [ :serie | serie asString = '-125526.52173913' ]"
]

{ #category : #'private - utility' }
CIMWebLineBarModel >> computedatasSetForModule: aModule [
	
]

{ #category : #initialization }
CIMWebLineBarModel >> initialize [
	super initialize.
	self initializePercentModuleTime.
	self initializeAvgTimeDevTpsTotalMinusEstimTicketsPerYear
]

{ #category : #'private - utility' }
CIMWebLineBarModel >> initializeAvgTimeDevTpsTotalMinusEstimTicketsPerYear [
	avgTimeDevTpsTotalMinusEstimTicketsPerYear := ((self
		avgTimeDevTpsTotalMinusEstimTicketsPerYear: QueryBugsEvolutions)
		collect: [ :node | node time -> node value ]) asOrderedDictionary
]

{ #category : #initialization }
CIMWebLineBarModel >> initializeModules [
	modules := Tbl tbl_Module rows
]

{ #category : #'private - utility' }
CIMWebLineBarModel >> initializePercentModuleTime [
	| modulesNamesWithTimeSpent totalInDays |
	modulesNamesWithTimeSpent := self moduleGroupByTime.
	totalInDays := (modulesNamesWithTimeSpent collect: #value) sum.
	percentModuleTime := (modulesNamesWithTimeSpent
		collect: [ :ass | 
			ass key
				-> (ass value * 100 / totalInDays printShowingDecimalPlaces: 2) asNumber ])
		select: [ :ass | ass value >= 2 ]
]

{ #category : #initialization }
CIMWebLineBarModel >> initializeSelectedModule [
	selectedModule := Tbl tbl_Module moduleNamed: 'IZY Protect'
]

{ #category : #'private - utility' }
CIMWebLineBarModel >> moduleGroupByTime [
	^ (((modules reject: [ :each | each nom = 'IZY Protect' ])
		collect: [ :module | 
			module nom
				->
					(QueryTicketsTimeDev
						runOn:
							(QueryBugsEvolutions
								runOn: (CIMTicketGroupNode new tickets: module tickets))) ])
		sorted: [ :a :b | a value > b value ]) asOrderedCollection
]

{ #category : #'private - utility' }
CIMWebLineBarModel >> percentModuleTime [
	^ percentModuleTime
]
