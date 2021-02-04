Class {
	#name : #CIMWebTimeOpenCloseChartModel,
	#superclass : #CIMWebModuleAbstractModel,
	#category : #'CIMTicketsAnalyseWeb-models'
}

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

{ #category : #'private - utility' }
CIMWebTimeOpenCloseChartModel >> timeConvert [


	^ 3600* 24*7
]
