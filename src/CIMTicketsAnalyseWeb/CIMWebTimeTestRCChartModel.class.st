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
CIMWebTimeTestRCChartModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #'data sets' }
CIMWebTimeTestRCChartModel >> avgTimeRCTestTicketsPerYear: selectQuery for: aTicketGroupNode [
	^ QueryAvgTicketsTimeRCTestGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aTicketGroupNode)))
]

{ #category : #'as yet unclassified' }
CIMWebTimeTestRCChartModel >> avgTimeTestRCModulePerYear: aModule selectQuery: selectQuery [
	^ self
		avgTimeRCTestTicketsPerYear: selectQuery
		for: (CIMTicketGroupNode new tickets: aModule tickets)
]

{ #category : #'as yet unclassified' }
CIMWebTimeTestRCChartModel >> computeBugsDataSetForModule: aModule [
	^ self avgTimeTestRCModulePerYear: aModule selectQuery: QueryBugs
]

{ #category : #'as yet unclassified' }
CIMWebTimeTestRCChartModel >> computeEvolutionsDataSetForModule: aModule [
	^ self
		avgTimeTestRCModulePerYear: aModule
		selectQuery: QueryEvolutions
]

{ #category : #initialization }
CIMWebTimeTestRCChartModel >> initialize [
	cimWebLineBarModel := CIMWebLineBarModel current.
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
