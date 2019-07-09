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
	ds connectColor: Color lightBrown.
	ds points: aDictionary keys.
	ds
		y: [ :key | 
			key asSeconds * (linearRegression at: 'slope')
				+ (linearRegression at: 'intercept') ];
		label: 'Droite de regression'.
	b add: ds.
	b shouldUseNiceLabels: true.
	b axisY
		labelConversion: [ :v | v asDuration asString ];
		title: 'temps en jj:hh:mm:ss'.
	b axisX
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > aDictionary keys size ])
				ifTrue: [ '' ]
				ifFalse: [ EngToFrenchDateMapper map: (aDictionary keys at: v) asString ] ].
	b legend.
	^ b
]

{ #category : #accessing }
LineChart >> title: aString [ 
	title := aString
]
