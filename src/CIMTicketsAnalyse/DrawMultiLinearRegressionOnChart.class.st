"
I plot data serie with many linear regressions. The second argument should be a collection of dictionaries
"
Class {
	#name : #DrawMultiLinearRegressionOnChart,
	#superclass : #LineChart,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
DrawMultiLinearRegressionOnChart >> drawWithRegressionIntervall: aCollection [
	| b ds regressionLinesColors firstX |
	firstX := timeSerie keys first asSeconds.
	b := RTGrapher new.
	ds := RTData new connectColor: Color blue.
	ds points: timeSerie keys.
	ds y: [ :key | timeSerie at: key ].
	ds x: [ :key | key asSeconds - firstX ].
	ds interaction popup text: [ :elt | self popupTextOn: elt ].
	b add: ds.
	regressionLinesColors := RTCPQualitative new
		colors: aCollection size + 2.
	1 to: aCollection size do: [ :i | 
		| linearRegression dic |
		dic := aCollection at: i.
		ds := RTData new.
		ds connectColor: (regressionLinesColors at: i).
		linearRegression := QueryLinearRegression runOn: dic.
		ds points: dic keys.
		ds x: [ :key | key asSeconds - firstX ].
		ds
			y: [ :key | 
				key asSeconds * (linearRegression at: 'slope')
					+ (linearRegression at: 'intercept') ].
		b add: ds ].
	b axisX
		numberOfLabels: (timeSerie size / 6) asInteger;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > timeSerie keys size ])
				ifTrue: [ '' ]
				ifFalse: [ CIMDateFormater map: (timeSerie keys at: v) asString ] ].
	b view @ RTZoomableView.
	^ b
]

{ #category : #'drawing-general' }
DrawMultiLinearRegressionOnChart >> popupTextOn: anObject [
	^ 'Month: ' , anObject key asString , String cr , 'value : '
		, (timeSerie at: anObject key) asString , String cr , 'Median: '
		, timeSerie median asString
]
