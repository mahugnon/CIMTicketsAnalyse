Class {
	#name : #DrawMultiLinearRegressionOnChart,
	#superclass : #LineChart,
	#category : #'CIMTicketsDataModelGui-Roassals'
}

{ #category : #'as yet unclassified' }
DrawMultiLinearRegressionOnChart >> drawWithRegressionIntervall1: aCollection [
	| ds regressionLinesColors firstX |
	firstX := timeSerie first time asSeconds.
	graphic := RTGrapher new.
	ds := RTData new connectColor: Color blue.
	ds dotShape
		color: (Color red alpha: 0.3);
		size: 50.
	ds points: timeSerie.
	ds y: [ :node | node value ].
	ds x: [ :node | node time asSeconds - firstX ].
	"ds interaction addInteraction: RISetYourModelWhenMouseClick new."
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
	"graphic renderIn: view."
	graphic axisX
		numberOfLabels: (timeSerie size / 6) asInteger;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > timeSerie size ])
				ifTrue: [ '' ]
				ifFalse: [ CIMDateFormater map: (timeSerie at: v) time asString ] ].
	graphic build.
	^ graphic view
]

{ #category : #'as yet unclassified' }
DrawMultiLinearRegressionOnChart >> drawWithRegressionIntervall: aCollection [
	| ds regressionLinesColors firstX |
	firstX := timeSerie first time asSeconds.
	graphic := RTGrapher new.
	ds := RTData new connectColor: Color blue.
	ds dotShape
		color: (Color red alpha: 0.3);
		size: 50.
	ds points: timeSerie.
	ds y: [ :node | node value ].
	ds x: [ :node | node time asSeconds - firstX ].
	ds interaction addInteraction: RISetYourModelWhenMouseClick new.
	ds elements @ (RSPopup text: [ :elt | self popupTextOn: elt ]).
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
		numberOfLabels: (timeSerie size / 6) asInteger;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > timeSerie size ])
				ifTrue: [ '' ]
				ifFalse: [ CIMDateFormater map: (timeSerie at: v) time asString ] ].
	view zoomToFit.
	^ graphic build
]

{ #category : #'as yet unclassified' }
DrawMultiLinearRegressionOnChart >> popupTextOn: anObject [
	^ 'Month: ' , anObject key asString , String cr , 'value : '
		, (timeSerie at: anObject key) asString , String cr , 'Median: '
		, timeSerie median asString
]

{ #category : #accessing }
DrawMultiLinearRegressionOnChart >> view [
	^ view
]

{ #category : #accessing }
DrawMultiLinearRegressionOnChart >> view: anObject [
	view := anObject
]
