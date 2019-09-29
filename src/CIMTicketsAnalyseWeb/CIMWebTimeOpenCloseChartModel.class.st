Class {
	#name : #CIMWebTimeOpenCloseChartModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'cimWebLineBarModel'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebTimeOpenCloseChartModel class >> current [
	current ifNil: [ current := self new ].
	^ current
]

{ #category : #accessing }
CIMWebTimeOpenCloseChartModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #'data sets' }
CIMWebTimeOpenCloseChartModel >> avgTimeTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ QueryAvgTimeToOpenCloseTicketsGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aCIMTicketGroup)))
]

{ #category : #initialization }
CIMWebTimeOpenCloseChartModel >> initialize [
	cimWebLineBarModel := CIMWebLineBarModel current.
	super initialize.
	self modelData: cimWebLineBarModel modelData.
	self initializeModules
]

{ #category : #initialization }
CIMWebTimeOpenCloseChartModel >> initializeModules [
	modules := cimWebLineBarModel modules
]

{ #category : #initialization }
CIMWebTimeOpenCloseChartModel >> initializeSelectedModule [
	selectedModule := cimWebLineBarModel selectedModule
]

{ #category : #'private - utility' }
CIMWebTimeOpenCloseChartModel >> timeConvert [
	"We suppose that 1 month contain 20 opened day and 1 day is 7.5 hours of work at CIM  "

	^ 27000 * 20
]
