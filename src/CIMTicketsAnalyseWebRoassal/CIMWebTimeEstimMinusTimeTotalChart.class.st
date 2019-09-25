Class {
	#name : #CIMWebTimeEstimMinusTimeTotalChart,
	#superclass : #CIMWebRoassalChart,
	#category : #CIMTicketsAnalyseWebRoassal
}

{ #category : #'as yet unclassified' }
CIMWebTimeEstimMinusTimeTotalChart >> buildRoassalView [
	| timeSeries |
	timeSeries := (model
		avgTimeDevTpsTotalMinusEstimTicketsPerMonth: QueryBugsEvolutions)
		reject: [ :serie | serie time asString = '-125526.52173913' ].
	^ DrawMultiLinearRegressionOnChart new
		timeSerie: timeSeries;
		drawWithRegressionIntervall1:
			(QuerySplitTicketNodeByTime new
				month: (Date asMonth: 05 inYear: 2013);
				runOn: timeSeries)
]
