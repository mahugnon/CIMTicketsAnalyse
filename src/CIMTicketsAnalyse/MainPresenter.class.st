Class {
	#name : #MainPresenter,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #drawing }
MainPresenter >> draw2LineAvgTimeDevTpsTotalMinusEstimBugsTicketsPerMonth [
	<script:
		'MainPresenter new draw2LineAvgTimeDevTpsTotalMinusEstimBugsTicketsPerMonth open'>
	^ self
		draw2LineAvgTimeDevTpsTotalMinusEstimTicketsPerMonth: QueryBugs
]

{ #category : #drawing }
MainPresenter >> draw2LineAvgTimeDevTpsTotalMinusEstimEvolutionsTicketsPerMonth [
	<script:
		'MainPresenter new draw2LineAvgTimeDevTpsTotalMinusEstimEvolutionsTicketsPerMonth open'>
	^ self
		draw2LineAvgTimeDevTpsTotalMinusEstimTicketsPerMonth: QueryEvolutions
]

{ #category : #drawing }
MainPresenter >> draw2LineAvgTimeDevTpsTotalMinusEstimTicketsPerMonth [
	<script:
		'MainPresenter new draw2LineAvgTimeDevTpsTotalMinusEstimTicketsPerMonth open'>
	^ self
		draw2LineAvgTimeDevTpsTotalMinusEstimTicketsPerMonth: QueryBugsEvolutions
]

{ #category : #drawing }
MainPresenter >> draw2LineAvgTimeDevTpsTotalMinusEstimTicketsPerMonth: selectQuery [
	| timeSeries data1 data2 |
	timeSeries := (model
		avgTimeDevTpsTotalMinusEstimTicketsPerMonth: selectQuery)
		reject: [ :serie | serie asString = '-125526.52173913' ].
	data1 := QueryCutTimeSerie new
		cut: timeSeries
		before: (Date asMonth: 05 inYear: 2013).
	data2 := QueryCutTimeSerie new
		cut: timeSeries
		after: (Date asMonth: 05 inYear: 2013).
	^ DrawMultiLinearRegressionOnChart new
		timeSerie: timeSeries;
		drawWithRegressionIntervall:
			{data1.
			data2}
]

{ #category : #'as yet unclassified' }
MainPresenter >> drawAndExportToFilesTimeSpent: aFolder [
	<script: 'MainPresenter new drawFilesTimeSpent '>
	| presenter filenameWithTickets |
	filenameWithTickets := model ticketPerFile.
	presenter := self class new.
	^ model ticketPerFile keys
		collect: [ :fileName | 
			presenter model: (filenameWithTickets at: fileName).
			ChartComposer new
				compose:
					{('Bug' -> presenter drawAvgTimeSpentBugsTicketsPerMonth).
					('Evolution'
						-> presenter drawAvgTimeSpentEvolutionTicketsPerMonth).
					('TotalMinusEstim'
						-> presenter draw2LineAvgTimeDevTpsTotalMinusEstimTicketsPerMonth).
					('InterventionDev' -> presenter drawMovingAvgTicketPerDev)}
						asOrderedDictionary
				title: fileName ]
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevBugsTicketsPerMonth [
	^ self drawAvgTimeDevTicketsPerMonth: QueryBugs
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevEvolutionsTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryAvgTimeDevGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryCleanData runOn: (QueryEvolutions new runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevEvolutionsTicketsPerMonthPerDev [
	<script: 'MainPresenter new drawAvgTimeDevEvolutionsTicketsPerMonthPerDev open'>
	^ self drawAvgTimeDevTicketsPerMonth: QueryEvolutions
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevTicketsPerMonth: selectQuery [
	^ (LineChart chartFor: selectQuery)
		yFormateur: CIMDayFormater new;
		timeSerie: (MainPresenterModel new avgTimeDevTicketsPerMonth: selectQuery);
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevTpsTotalMinusEstimBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMHourFormater new;
		timeSerie:
			(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn:
									(QueryRejectNilEstimation runOn: (QueryBugs new runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevTpsTotalMinusEstimEvolutionsTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		timeSerie:
			(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn:
									(QueryRejectNilEstimation
										runOn: (QueryEvolutions new runOn: Tbl allTickets)))));
		draw
]

{ #category : #'as yet unclassified' }
MainPresenter >> drawAvgTimeSpentAndTimeEstim [
	<script: 'MainPresenter new drawAvgTimeSpentAndTimeEstim open'>
	^ DoubleChart  new
		yFormateur: CIMHourFormater new;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn: (QueryClosed runOn: (QueryCleanData runOn: Tbl allTickets)))));
		secondTimeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeDevTpsEstimOnTicketGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn: (QueryClosed runOn: (QueryCleanData runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMHourFormater new;
		maxY: 162271.2;
		timeSerie:
			(QueryAvgTimeOnTicketsGroupedByTime
				runOn:
					(QueryTicketPerMonthClosing new
						fillGaps: true;
						ordered: true;
						runOn:
							(QueryClosed
								runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentBugsTicketsPerMonthPerDev [
	^ BugsChart new
		yFormateur: CIMMinuteFormater new;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentEvolutionTicketsPerMonth [
	<script: 'MainPresenter new drawAvgTimeSpentEvolutionTicketsPerMonth open'>
	^ self drawAvgTimeSpentTicketsPerMonth: QueryEvolutions
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentEvolutionTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentTicketsPerMonth: selectQuery [
	^ (LineChart chartFor: selectQuery)
		yFormateur: CIMHourFormater new;
		maxY: 162271.2;
		timeSerie: (MainPresenterModel new avgTimeSpentTicketsPerMonth: selectQuery);
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		perDev: true;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn: (QueryClosed runOn: (QueryCleanData runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeTestBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMMinuteFormater new;
		timeSerie:
			(QueryAvgTimeTestGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryBugs runOn: (QueryCleanData new runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeTestEvolutionsTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMMinuteFormater;
		timeSerie:
			(QueryAvgTimeTestGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryCleanData runOn: (QueryEvolutions new runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeToOpenCloseBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryAvgTimeToOpenCloseTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn: (QueryBugs new runOn: Tbl allTickets)));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeToOpenCloseEvolutionTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryAvgTimeToOpenCloseTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn: (QueryEvolutions new runOn: Tbl allTickets)));
		draw
]

{ #category : #'as yet unclassified' }
MainPresenter >> drawBugsMultiRegressionLineForMovingAvgTicketPerDev [
	<script:
		'MainPresenter new drawBugsMultiRegressionLineForMovingAvgTicketPerDev open'>
	^ self drawMultiRegressionLineForMovingAvgTicketPerDev: QueryBugs
]

{ #category : #'as yet unclassified' }
MainPresenter >> drawEvolutionsMultiRegressionLineForMovingAvgTicketPerDev [
	<script:
		'MainPresenter new drawBugsMultiRegressionLineForMovingAvgTicketPerDev open'>
	^ self
		drawMultiRegressionLineForMovingAvgTicketPerDev: QueryEvolutions
]

{ #category : #'as yet unclassified' }
MainPresenter >> drawFilesTimeSpent [
	<script: 'MainPresenter new drawFilesTimeSpent '>
	| presenter filenameWithTickets |
	filenameWithTickets :=  model ticketPerFile.
	presenter := self class new.
	^ model ticketPerFile keys
		collect: [ :fileName | 
			presenter model: (MainPresenterModel new modelData: (filenameWithTickets at: fileName)).
			ChartComposer new
				compose:
					{('Bug' -> presenter drawMovingAvgTimeSpentBugsTicketsPerMonth).
					('Evolution'
						-> presenter drawMovingAvgTimeSpentEvolutionTicketsPerMonth).
					('TotalMinusEstim'
						-> presenter draw2LineAvgTimeDevTpsTotalMinusEstimTicketsPerMonth).
					('InterventionDev' -> presenter drawMovingAvgTicketPerDev)}
						asOrderedDictionary
				title: fileName ]
]

{ #category : #'as yet unclassified' }
MainPresenter >> drawMovingAvgOfBibliothequePerTicketsPerMonth [
	^ BibChart new
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgNumberOfBibliothequeModifiedGroupedByTime new
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn: (QueryClosed runOn: (QueryCleanData runOn: Tbl allTickets)))));
		draw
]

{ #category : #'as yet unclassified' }
MainPresenter >> drawMovingAvgTicketBugsPerDev [
	<script: 'MainPresenter new drawMovingAvgTicketBugsPerDev open'>
	^ self drawMovingAvgTicketPerDev: QueryBugs
]

{ #category : #'as yet unclassified' }
MainPresenter >> drawMovingAvgTicketEvolutionPerDev [
	<script: 'MainPresenter new drawMovingAvgTicketEvolutionPerDev open'>
	^ self drawMovingAvgTicketPerDev: QueryEvolutions 
]

{ #category : #'as yet unclassified' }
MainPresenter >> drawMovingAvgTicketPerDev [
	<script: 'MainPresenter new drawMovingAvgTicketPerDev open'>
	^ self drawMovingAvgTicketPerDev: QueryBugsEvolutions
]

{ #category : #'as yet unclassified' }
MainPresenter >> drawMovingAvgTicketPerDev: selectQuery [
	^ CIMChart new
		perDev: true;
		timeSerie:
			(QueryMovingAverage new
				runOn: (model avgDevInterventionPerMonth: selectQuery));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeDevBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeDevGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeDevEvolutionTicketsPerMonth [
	| data |
	data := QueryTicketPerMonthClosing new
		fillGaps: true;
		ordered: true;
		runOn:
			(QueryClosed
				runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))).
	^ EvolutionChart new
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeDevGroupedByTime
						runOn:
							(data associations
								reject: [ :ass | ass key = (Date asMonth: 9 inYear: 2015) ])
								asOrderedDictionary));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeDevTpsTotalMinusEstimEvolutionsTicketsPerMonth [
	^ EvolutionChart new
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
						runOn:
							(QueryTicketPerMonthClosing new
								runOn:
									(QueryClosed
										runOn:
											(QueryRejectNilEstimation
												runOn: (QueryEvolutions new runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMHourFormater new;
		"maxY: 114964.9740659338;"
			timeSerie: (model movingAvgTimeSpentTicketsPerMonth: QueryBugs);
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentBugsTicketsPerMonthPerDev [
	^ BugsChart new
		yFormateur: CIMHourFormater new;
		perDev: true;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryMovingAverage
						runOn:
							(QueryAvgTimeOnTicketsGroupedByTime
								runOn:
									(QueryTicketPerMonthClosing new
										fillGaps: true;
										ordered: true;
										runOn:
											(QueryClosed
												runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets)))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentEvolutionTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		timeSerie: (model movingAvgTimeSpentTicketsPerMonth: QueryEvolutions);
		draw
	"yTranslation: 16160.221023768798;
		maxY: 114964.9740659338;"
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentEvolutionTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		perDev: true;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryMovingAverage
						runOn:
							(QueryAvgTimeOnTicketsGroupedByTime
								runOn:
									(QueryTicketPerMonthClosing new
										fillGaps: true;
										ordered: true;
										runOn:
											(QueryClosed
												runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets)))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		perDev: true;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn: (QueryClosed runOn: (QueryCleanData runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeTestBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMMinuteFormater new;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeTestGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeTestBugsTicketsPerMonthPerDev [
	^ BugsChart new
		yFormateur: CIMMinuteFormater new;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryMovingAverage
						runOn:
							(QueryAvgTimeTestGroupedByTime
								runOn:
									(QueryTicketPerMonthClosing new
										fillGaps: true;
										ordered: true;
										runOn:
											(QueryClosed
												runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets)))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeTestEvolutionTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMMinuteFormater new;
		yTranslation: 2391.1500956546124;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeTestGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeTestEvolutionTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMMinuteFormater new;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryMovingAverage
						runOn:
							(QueryAvgTimeTestGroupedByTime
								runOn:
									(QueryTicketPerMonthClosing new
										fillGaps: true;
										ordered: true;
										runOn:
											(QueryClosed
												runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets)))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeToOpenCloseBugsTicketsPerMonth [
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
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeToOpenCloseBugsTicketsPerMonthPerDev [
	<script:
		'MainPresenter new drawMovingAvgTimeToOpenCloseBugsTicketsPerMonthPerDev open'>
	^ self drawMovingAvgTimeToOpenCloseTicketsPerMonthPerDev: QueryBugs
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeToOpenCloseEvolutionTicketsPerMonth [
	^ EvolutionChart new
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
										runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeToOpenCloseEvolutionTicketsPerMonthPerDev [
	<script:
		'MainPresenter new drawMovingAvgTimeToOpenCloseEvolutionTicketsPerMonthPerDev open'>
	^ self
		drawMovingAvgTimeToOpenCloseTicketsPerMonthPerDev: QueryEvolutions
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeToOpenCloseTicketsPerMonthPerDev: selectQuery [
	^ EvolutionChart new
		yFormateur: CIMDayFormater new;
		perDev: true;
		timeSerie:
			(model movingAvgTimeToOpenCloseTicketsPerMonthPerDev: selectQuery);
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingTimeSpentTicketsPerMonth [
	<script: 'MainPresenter new drawMovingTimeSpentTicketsPerMonth open'>
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		timeSerie: (model avgTimeSpentTicketsPerMonth: QueryBugsEvolutions);
		draw
]

{ #category : #'as yet unclassified' }
MainPresenter >> drawMultiRegressionLineForMovingAvgTicketPerDev: selectQuery [
	| dataSet |
	dataSet := model
		multiRegressionLineForMovingAvgTicketPerDevDataSet: selectQuery.
	^ DrawMultiLinearRegressionOnChart new
		timeSerie: dataSet first;
		drawWithRegressionIntervall:
			{dataSet second.
			dataSet third.
			dataSet fourth}
]

{ #category : #'as yet unclassified' }
MainPresenter >> drawReleaseRate [
	"To implement"
]

{ #category : #initialization }
MainPresenter >> initialize [ 
super initialize .
model := MainPresenterModel new 
]

{ #category : #accessing }
MainPresenter >> model [
	^ model
]

{ #category : #accessing }
MainPresenter >> model: anObject [
	model := anObject
]
