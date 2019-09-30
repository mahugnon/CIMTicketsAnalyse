Class {
	#name : #CIMWebTimeTestRCChartModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'cimWebLineBarModel',
		'avgTimeRCTestTicketsPerYear'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebTimeTestRCChartModel class >> current [
	current ifNil: [ current := self new ].
	^ current
]

{ #category : #accessing }
CIMWebTimeTestRCChartModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #'data sets' }
CIMWebTimeTestRCChartModel >> avgTimeTicketsPerYear: selectQuery for: aTicketGroupNode [
	^ QueryAvgTicketsTimeRCTestGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aTicketGroupNode)))
	"asOrderedDictionary
	collect: [ :node | node time -> node value ]"
]

{ #category : #initialization }
CIMWebTimeTestRCChartModel >> initialize [
	cimWebLineBarModel := CIMWebMainFLineBarModel current.
	super initialize.
	self modelData: cimWebLineBarModel modelData.
	self initializeModules
]

{ #category : #initialization }
CIMWebTimeTestRCChartModel >> initializeModules [
	modules := cimWebLineBarModel modules
]

{ #category : #initialization }
CIMWebTimeTestRCChartModel >> initializeSelectedModule [
	selectedModule := cimWebLineBarModel selectedModule
]
