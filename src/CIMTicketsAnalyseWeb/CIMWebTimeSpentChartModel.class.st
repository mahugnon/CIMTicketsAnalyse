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
CIMWebTimeSpentChartModel >> avgTimeModulePerYear: aModule selectQuery: selectQuery [
	^ self
		avgTimeTicketsPerYear: selectQuery
		for: (CIMTicketGroupNode new tickets: aModule tickets)
]

{ #category : #'data sets' }
CIMWebTimeSpentChartModel >> avgTimeTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aCIMTicketGroup)))
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
