Class {
	#name : #CIMWebTimeDevChartModel,
	#superclass : #CIMWebModuleAbstractModel,
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebTimeDevChartModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #'data sets' }
CIMWebTimeDevChartModel >> avgTimeTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ QuerySumTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aCIMTicketGroup)))
]

{ #category : #'private - utility' }
CIMWebTimeDevChartModel >> timeConvert [
	^ 28*24*3600
]
