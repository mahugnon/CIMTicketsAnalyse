Class {
	#name : #CIMWebTimeToOpenCloseEvolutionChart,
	#superclass : #CIMWebRoassalChart,
	#category : #CIMTicketsAnalyseWeb
}

{ #category : #'as yet unclassified' }
CIMWebTimeToOpenCloseEvolutionChart >> buildRoassalView [
	^ EvolutionChart new
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
											(QueryEvolutions
												runOn:
													(QueryCleanData
														runOn: (CIMTicketGroupNode new tickets: Tbl allTickets)))))));
		draw
]
