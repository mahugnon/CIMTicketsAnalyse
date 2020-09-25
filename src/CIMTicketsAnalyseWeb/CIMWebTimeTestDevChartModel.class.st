Class {
	#name : #CIMWebTimeTestDevChartModel,
	#superclass : #CIMWebModuleAbstractModel,
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebTimeTestDevChartModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #'data sets' }
CIMWebTimeTestDevChartModel >> avgTimeTicketsPerYear: selectQuery for: aTicketGroupNode [
	^ QueryAvgTicketsTimeDevTestGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aTicketGroupNode)))
	"asOrderedDictionary
	collect: [ :node | node time -> node value ]"
]

{ #category : #'private - utility' }
CIMWebTimeTestDevChartModel >> timeConvert [
	^ 3600
]
