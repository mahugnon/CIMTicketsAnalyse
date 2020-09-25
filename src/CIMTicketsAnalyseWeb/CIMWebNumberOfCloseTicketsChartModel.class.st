Class {
	#name : #CIMWebNumberOfCloseTicketsChartModel,
	#superclass : #CIMWebModuleAbstractModel,
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebNumberOfCloseTicketsChartModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #'data sets' }
CIMWebNumberOfCloseTicketsChartModel >> avgTimeTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ QueryNumberOfTicketsGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aCIMTicketGroup)))
]

{ #category : #'private - utility' }
CIMWebNumberOfCloseTicketsChartModel >> timeConvert [
	^ 1
]
