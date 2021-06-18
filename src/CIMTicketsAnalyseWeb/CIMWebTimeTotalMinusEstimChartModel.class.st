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
			(closingQuery
				runOn:
					(selectQuery
						runOn:
							(QueryRejectNilEstimation
								runOn: (self dataWithCloseDate: aCIMTicketGroup))))
	"reject: [ :serie | serie asString = '-125526.52173913' ]"
]

{ #category : #'private - utility' }
CIMWebTimeTotalMinusEstimChartModel >> doubleRegressionCharacteristics: aCollection [
	^ QueryLinearRegression new runOn1: aCollection
]

{ #category : #'as yet unclassified' }
CIMWebTimeTotalMinusEstimChartModel >> needMultiRegressionLine [
	^ module releventYear isNotNil
]

{ #category : #accessing }
CIMWebTimeTotalMinusEstimChartModel >> releventYear [
	^ module releventYear
]
