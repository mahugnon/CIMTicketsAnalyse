Class {
	#name : #LineChart,
	#superclass : #Object,
	#instVars : [
		'title'
	],
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
	ds label: title.
	b add: ds.
	ds := RTData new.
	ds connectColor: Color red.
	ds points: aDictionary keys.
	ds
		y: [ :key | 
			key asSeconds * (linearRegression at: 'slope')
				+ (linearRegression at: 'intercept') ];
		label: 'Droite de regression'.
	b add: ds.
	b axisX
		numberOfLabels: aDictionary size;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > aDictionary keys size ])
				ifTrue: [ '' ]
				ifFalse: [ (aDictionary keys at: v) asString ] ].
	b axisY
		title: title;
		noDecimal.
	b legend right.
	^ b
]

{ #category : #accessing }
LineChart >> title: aString [ 
	title := aString
]
