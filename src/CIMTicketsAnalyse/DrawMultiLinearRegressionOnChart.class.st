Class {
	#name : #DrawMultiLinearRegressionOnChart,
	#superclass : #LineChart,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
DrawMultiLinearRegressionOnChart >> drawWithRegressionIntervall: aCollection [
	| ds dsRegression regressionLinesColors firstX |
	firstX := timeSerie first time asSeconds.
	graphic := RTGrapher new.
	ds := RTData new connectColor: Color blue.
	ds points: timeSerie.
	ds label: label.
	ds y: [ :node | node value ].
	ds x: [ :node | node time asSeconds - firstX ].
	"ds interaction popup text: [ :elt | self popupTextOn: elt ]."
	graphic add: ds.
	regressionLinesColors := RTCPQualitative new
		colors: aCollection size + 2.
	1 to: aCollection size do: [ :i | 
		| linearRegression data |
		data := aCollection at: i.
		dsRegression := RTData new.
		dsRegression connectColor: (regressionLinesColors at: i).
		linearRegression := QueryLinearRegression runOn: data.
		dsRegression points: data.
		dsRegression x: [ :node | node time asSeconds - firstX ].
		dsRegression
			y: [ :node | 
				node time asSeconds * (linearRegression at: 'slope')
					+ (linearRegression at: 'intercept') ].
		graphic add: dsRegression ].
	graphic axisY
		numberOfLabels: (timeSerie size / 30) asInteger;
		labelConversion: self convertYAxis;
		title: title.
	graphic axisX
		numberOfLabels: (timeSerie size / 6) asInteger;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > timeSerie size ])
				ifTrue: [ '' ]
				ifFalse: [ "CIMDateFormater map: " (timeSerie at: v + firstX) time	"asString" ] ].
	graphic view @ RTZoomableView.
	^ graphic
]

{ #category : #'as yet unclassified' }
DrawMultiLinearRegressionOnChart >> popupTextOn: anObject [
	^ 'Month: ' , anObject key asString , String cr , 'value : '
		, (timeSerie at: anObject key) asString , String cr , 'Median: '
		, timeSerie median asString
]
