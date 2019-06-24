Class {
	#name : #LineChart,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'drawing-general' }
LineChart >> draw: aDictionary [
	| b ds linearRegression |
	linearRegression := QueryLinearRegression runOn: aDictionary.
	b := RTGrapher new.
	ds := RTData new.
	"ds barShape color: Color blue."
	ds connectColor: Color blue.
	ds points: aDictionary keys.
	ds y: [ :key | aDictionary at: key ].
	b add: ds.
	ds := RTData new.
	ds connectColor: Color red.
	ds points: aDictionary keys.
	ds
		y: [ :key | 
			key asSeconds * (linearRegression at: 'slope')
				+ (linearRegression at: 'intercept') ].
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
