Class {
	#name : #CIMWebTimeSpentChartModel,
	#superclass : #CIMWebAbstractModel,
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebTimeSpentChartModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #'data sets' }
CIMWebTimeSpentChartModel >> avgTimeTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aCIMTicketGroup)))
]
