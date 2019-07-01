Class {
	#name : #DevTpsTotalMinusTpsEstimChart,
	#superclass : #PB2GraphsBlueRed,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'drawing-general' }
DevTpsTotalMinusTpsEstimChart >> draw: aDictionary [
	| datas b ds linearRegressionLowMonth linearRegressionUpMonth |
	datas := QuerySplitTicketsTimeSerie new
		month: 3544812000;
		runOn: aDictionary.
	linearRegressionLowMonth := QueryLinearRegression runOn: datas first.
	linearRegressionUpMonth := QueryLinearRegression runOn: datas second.
	b := RTGrapher new.
	ds := RTData new.
	"ds barShape color: Color blue."
	ds connectColor: Color blue.
	ds points: aDictionary keys.
	ds y: [ :key | aDictionary at: key ].
	b add: ds.
	ds := RTData new.
	ds connectColor: Color green.
	ds points: aDictionary keys.
	ds
		y: [ :key | 
			key asSeconds * (linearRegressionLowMonth at: 'slope')
				+ (linearRegressionLowMonth at: 'intercept') ].
	b add: ds.
	ds := RTData new.
	ds connectColor: Color red.
	ds points: aDictionary keys.
	ds
		y: [ :key | 
			key asSeconds * (linearRegressionUpMonth at: 'slope')
				+ (linearRegressionUpMonth at: 'intercept') ].
	b add: ds.
	b axisX
		numberOfLabels: aDictionary size;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > aDictionary keys size ])
				ifTrue: [ ''	"for 0" ]
				ifFalse: [ (aDictionary keys at: v) asString ] ].
	^ b
]
