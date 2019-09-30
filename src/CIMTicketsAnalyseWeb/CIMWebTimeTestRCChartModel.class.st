Class {
	#name : #CIMWebTimeTestRCChartModel,
	#superclass : #CIMWebAbstractModel,
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
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aTicketGroupNode)))
	"asOrderedDictionary
	collect: [ :node | node time -> node value ]"
]
