Class {
	#name : #CIMWebTimeToOpenCloseBugsChart,
	#superclass : #CIMWebRoassalChart,
	#category : #CIMTicketsAnalyseWeb
}

{ #category : #'as yet unclassified' }
CIMWebTimeToOpenCloseBugsChart >> buildRoassalView [
	^ BugsChart new
		minY: 6e6;
		maxY: 1.6e7;
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeToOpenCloseTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn:
											(QueryBugs
												runOn:
													(QueryCleanData
														runOn: (CIMTicketGroupNode new tickets: Tbl allTickets)))))));
		draw
]
