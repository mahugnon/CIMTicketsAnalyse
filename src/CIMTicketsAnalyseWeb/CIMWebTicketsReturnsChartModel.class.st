Class {
	#name : #CIMWebTicketsReturnsChartModel,
	#superclass : #CIMWebModuleAbstractModel,
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #'data sets' }
CIMWebTicketsReturnsChartModel >> avgTimeTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ QueryNumberOfReturnsGroupedByTime new
		runOn:
			(closingQuery new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aCIMTicketGroup)))
]
