"
I plot data serie with many linear regressions. The second argument should be a collection of dictionaries
"
Class {
	#name : #DrawMultiLinearRegressionOnChart,
	#superclass : #PB2GraphsBlueRed,
	#instVars : [
		'charColor'
	],
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #accessing }
DrawMultiLinearRegressionOnChart >> charColor [
	^ charColor
]

{ #category : #accessing }
DrawMultiLinearRegressionOnChart >> charColor: anObject [
	charColor := anObject
]

{ #category : #'as yet unclassified' }
DrawMultiLinearRegressionOnChart >> draw: aDictionary withRegressionIntervall: aCollection [
	| b ds regressionLinesColors firstX |
	firstX := aDictionary keys first asSeconds.
	b := RTGrapher new.
	ds := RTData new.
	ds connectColor: Color blue.
	ds points: aDictionary keys.
	ds y: [ :key | aDictionary at: key ].
	ds x: [ :key | key asSeconds - firstX ].
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
		numberOfLabels: (aDictionary size / 6) asInteger;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > aDictionary keys size ])
				ifTrue: [ '' ]
				ifFalse: [ CIMDateFormater map: (aDictionary keys at: v) asString ] ].
	b view @ RTZoomableView.
	^ b
]
