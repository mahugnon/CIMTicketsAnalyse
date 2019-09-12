Class {
	#name : #TimeEstimMinusTimeDevPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'roassal'
	],
	#category : #'CIMTicketsDataModelGui-Roassals'
}

{ #category : #specs }
TimeEstimMinusTimeDevPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #roassal;
		yourself
]

{ #category : #specs }
TimeEstimMinusTimeDevPresenter class >> run [
	<example>
	self new openWithSpec
]

{ #category : #initialization }
TimeEstimMinusTimeDevPresenter >> initializeWidgets [
	self selectQuery.
	model := RoassalPresenterModel new.
	model roassalView: self.
	roassal := self instantiate: RoassalPresenter.
	model isEmpty
		ifFalse: [ roassal
				script: [ :view | 
					self
						raw2LineAvgTimeDevTpsTotalMinusEstimTicketsPerMonth: self selectQuery
						on: view ] ]
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

{ #category : #initialize }
TimeEstimMinusTimeDevPresenter >> selectQuery [
	^ self subclassResponsibility
]

{ #category : #updating }
TimeEstimMinusTimeDevPresenter >> update [
	roassal refresh
]
