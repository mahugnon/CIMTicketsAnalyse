Class {
	#name : #CIMWebTimeTotalMinusEstimChartModel,
	#superclass : #CIMWebModuleAbstractModel,
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebTimeTotalMinusEstimChartModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #'data sets' }
CIMWebTimeTotalMinusEstimChartModel >> avgTimeTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing
				runOn:
					(selectQuery
						runOn:
							(QueryRejectNilEstimation
								runOn: (self dataWithCloseDate: aCIMTicketGroup))))
	"reject: [ :serie | serie asString = '-125526.52173913' ]"
]
