Class {
	#name : #TimeEstimMinusTimeDevPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'roassal',
		'timeSeries',
		'rISetYourModelWhenMouseClick'
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

{ #category : #'as yet unclassified' }
TimeEstimMinusTimeDevPresenter >> drawWithRegressionIntervall: aCollection onView: view [
	| ds regressionLinesColors firstX graphic |
	firstX := timeSeries first time asSeconds.
	graphic := RTGrapher new.
	ds := RTData new connectColor: Color blue.
	ds dotShape
		color: (Color red alpha: 0.3);
		size: 50.
	ds points: timeSeries.
	ds y: [ :node | node value ].
	ds x: [ :node | node time asSeconds - firstX ].
	ds interaction addInteraction: rISetYourModelWhenMouseClick .
"	ds elements @ (RTPopup text: [ :elt | self popupTextOn: elt ])."
	graphic add: ds.
	regressionLinesColors := RTCPQualitative new
		colors: aCollection size + 2.
	1 to: aCollection size do: [ :i | 
		| linearRegression data |
		data := aCollection at: i.
		ds := RTData new.
		ds connectColor: (regressionLinesColors at: i).
		linearRegression := QueryLinearRegression runOn: data.
		ds points: data.
		ds x: [ :node | node time asSeconds - firstX ].
		ds
			y: [ :node | 
				node time asSeconds * (linearRegression at: 'slope')
					+ (linearRegression at: 'intercept') ].
		graphic add: ds ].
	graphic renderIn: view.
	graphic axisX
		numberOfLabels: (timeSeries size / 6) asInteger;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > timeSeries size ])
				ifTrue: [ '' ]
				ifFalse: [ CIMDateFormater map: (timeSeries at: v) time asString ] ].
	view zoomToFit.
	^ graphic build
]

{ #category : #initialization }
TimeEstimMinusTimeDevPresenter >> initializeWidgets [
	self selectQuery.
	model := RoassalPresenterModel new.
	roassal := self instantiate: RoassalPresenter.
	model isEmpty
		ifFalse: [ self setScript ].
	
]

{ #category : #initialization }
TimeEstimMinusTimeDevPresenter >> initializeWindow: w [
	w
		title: 'Roassal packages';
		initialExtent: 800 @ 500;
		centered
]

{ #category : #accessing }
TimeEstimMinusTimeDevPresenter >> model: aRoassalModel [
	model := aRoassalModel.
	model roassalView: self.
	rISetYourModelWhenMouseClick := RISetYourModelWhenMouseClick new
		model:
			(RIModel new
				subscribe:  model;
				yourself)
]

{ #category : #'as yet unclassified' }
TimeEstimMinusTimeDevPresenter >> raw2LineAvgTimeDevTpsTotalMinusEstimTicketsPerMonth: selectQuery on: aView [
	| data1 data2 |
	timeSeries := (model
		avgTimeDevTpsTotalMinusEstimTicketsPerMonth: selectQuery)
		reject: [ :serie | serie asString = '-125526.52173913' ].
	data1 := QueryCutTimeSerie new
		cut: timeSeries
		before: (Date asMonth: 05 inYear: 2013).
	data2 := QueryCutTimeSerie new
		cut: timeSeries
		after: (Date asMonth: 05 inYear: 2013).
	^ self
		drawWithRegressionIntervall:
			{data1.
			data2}
		onView: aView
]

{ #category : #refreshing }
TimeEstimMinusTimeDevPresenter >> refresh [
	self setScript.
	"roassal refresh"
]

{ #category : #initialize }
TimeEstimMinusTimeDevPresenter >> selectQuery [
	^ self subclassResponsibility
]

{ #category : #initialization }
TimeEstimMinusTimeDevPresenter >> setScript [
	roassal
		script: [ :view | 
			self
				raw2LineAvgTimeDevTpsTotalMinusEstimTicketsPerMonth: self selectQuery
				on: view ]
]

{ #category : #updating }
TimeEstimMinusTimeDevPresenter >> update [
	roassal refresh
]
