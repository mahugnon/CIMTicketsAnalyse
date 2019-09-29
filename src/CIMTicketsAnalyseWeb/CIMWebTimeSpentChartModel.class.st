Class {
	#name : #CIMWebTimeSpentChartModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'cimWebLineBarModel'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebTimeSpentChartModel class >> current [
	current ifNil: [ current := self new ].
	^ current
]

{ #category : #accessing }
CIMWebTimeSpentChartModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #'private - utility' }
CIMWebTimeSpentChartModel >> avgTimeDevModulePerYear: aModule selectQuery: selectQuery [
	^ self
		avgTimeDevTicketsPerYear: selectQuery
		for: (CIMTicketGroupNode new tickets: aModule tickets)
]

{ #category : #'data sets' }
CIMWebTimeSpentChartModel >> avgTimeDevTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aCIMTicketGroup)))
]

{ #category : #'as yet unclassified' }
CIMWebTimeSpentChartModel >> computeBugsDataSetForModule: aModule [
	^ self avgTimeDevModulePerYear: aModule selectQuery: QueryBugs
]

{ #category : #'as yet unclassified' }
CIMWebTimeSpentChartModel >> computeEvolutionsDataSetForModule: aModule [
	^ self avgTimeDevModulePerYear: aModule selectQuery: QueryEvolutions
]

{ #category : #'as yet unclassified' }
CIMWebTimeSpentChartModel >> initialize [
	cimWebLineBarModel := CIMWebLineBarModel current.
	super initialize.
	self modelData: cimWebLineBarModel modelData.
	self initializeModules
]

{ #category : #initialization }
CIMWebTimeSpentChartModel >> initializeModules [
	modules := cimWebLineBarModel modules
]

{ #category : #initialization }
CIMWebTimeSpentChartModel >> initializeSelectedModule [
	selectedModule := cimWebLineBarModel selectedModule
]
