Class {
	#name : #CIMWebTimeTestRCChartModel,
	#superclass : #CIMWebModuleAbstractModel,
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebTimeTestRCChartModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #'data sets' }
CIMWebTimeTestRCChartModel >> avgTimeTicketsPerYear: selectQuery for: aTicketGroupNode [
	^ QueryAvgTicketsTimeRCTestGroupedByTime new
		runOn:
			(closingQuery new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aTicketGroupNode)))
	"asOrderedDictionary
	collect: [ :node | node time -> node value ]"
]
