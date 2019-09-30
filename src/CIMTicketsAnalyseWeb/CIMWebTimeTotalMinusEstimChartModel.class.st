Class {
	#name : #CIMWebTimeTotalMinusEstimChartModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'cimWebLineBarModel'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebTimeTotalMinusEstimChartModel class >> current [
	current ifNil: [ current := self new ].
	^ current
]

{ #category : #accessing }
CIMWebTimeTotalMinusEstimChartModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #'data sets' }
CIMWebTimeTotalMinusEstimChartModel >> avgTimeTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing
				runOn:
					(selectQuery
						runOn:
							(QueryRejectNilEstimation
								runOn: (self dataWithCloseDate: aCIMTicketGroup))))
	"reject: [ :serie | serie asString = '-125526.52173913' ]"
]

{ #category : #initialization }
CIMWebTimeTotalMinusEstimChartModel >> initialize [
	cimWebLineBarModel := CIMWebMainFLineBarModel current.
	super initialize.
	self modelData: cimWebLineBarModel modelData.
	self initializeModules
]

{ #category : #initialization }
CIMWebTimeTotalMinusEstimChartModel >> initializeModules [
	modules := cimWebLineBarModel modules
]

{ #category : #initialization }
CIMWebTimeTotalMinusEstimChartModel >> initializeSelectedModule [
	selectedModule := cimWebLineBarModel selectedModule
]
