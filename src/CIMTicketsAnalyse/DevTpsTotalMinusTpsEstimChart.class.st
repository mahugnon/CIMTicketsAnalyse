Class {
	#name : #DevTpsTotalMinusTpsEstimChart,
	#superclass : #PB2GraphsBlueRed,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'drawing-general' }
DevTpsTotalMinusTpsEstimChart >> draw: aDictionary [
	| datas b ds firstLinearRegression secondLinearRegression firstX |
	firstX := aDictionary keys first asSeconds.
	datas := QuerySplitTicketsTimeSerie new
		month: ('05/01/2013' asDate asSeconds) ;
		runOn: aDictionary.
	firstLinearRegression := QueryLinearRegression runOn: datas first.
	secondLinearRegression := QueryLinearRegression runOn: datas second.
	b := RTGrapher new.
	ds := RTData new.
	"ds barShape color: Color blue."
	ds connectColor: Color blue.
	ds points: aDictionary keys.
	ds y: [ :key | aDictionary at: key ].
	ds x: [ :key | key asSeconds - firstX].
	b add: ds.
	ds := RTData new.
	ds connectColor: Color green.

	ds points: (aDictionary keys select: [ :m | m < ('05/01/2013' asDate) ]).
	ds x: [ :key | key asSeconds - firstX].
	ds
		y: [ :key | 
			key asSeconds * (firstLinearRegression at: 'slope')
				+ (firstLinearRegression at: 'intercept') ].
	b add: ds.
	ds := RTData new.
	ds connectColor: Color red.
	ds points: (aDictionary keys select: [ :m | m > ('05/01/2013' asDate) ]).
	ds
		y: [ :key | 
			key asSeconds * (secondLinearRegression at: 'slope')
				+ (secondLinearRegression at: 'intercept') ].
	ds x: [ :key | key asSeconds - firstX].
	b add: ds.
	b axisX
		numberOfLabels: aDictionary size;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > aDictionary keys size ])
				ifTrue: [ ''	"for 0" ]
				ifFalse: [ (aDictionary keys at: v) asString ] ].
	b view @ RTZoomableView.
	^ b
]
