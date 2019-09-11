Class {
	#name : #TimeEstimMinusTimeDevPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'roassal',
		'selectQuery'
	],
	#category : #'CIMTicketsDataModelGui-Roassals'
}

{ #category : #initialization }
TimeEstimMinusTimeDevPresenter >> initializeWidgets [
	model := RoassalPresenterModel new.
	model addListener: self.
	roassal := self instantiate: RoassalPresenter.
	roassal
		script: [ :view | 
			self
				raw2LineAvgTimeDevTpsTotalMinusEstimTicketsPerMonth: selectQuery
				on: view ]
]

{ #category : #initialization }
TimeEstimMinusTimeDevPresenter >> initializeWindow: w [
	w
		title: 'Roassal packages';
		initialExtent: 800 @ 500;
		centered
]

{ #category : #'as yet unclassified' }
TimeEstimMinusTimeDevPresenter >> raw2LineAvgTimeDevTpsTotalMinusEstimTicketsPerMonth: selectQuery on: aView [
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
		view: aView;
		timeSerie: timeSeries;
		drawWithRegressionIntervall:
			{data1.
			data2}
]

{ #category : #updating }
TimeEstimMinusTimeDevPresenter >> update [
	roassal refresh
]
