Class {
	#name : #LineChart,
	#superclass : #Object,
	#instVars : [
		'title',
		'minY',
		'maxY',
		'yFormateur',
		'yTranslation'
	],
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
LineChart >> cimColor [
	^ self subclassResponsibility
]

{ #category : #'drawing-general' }
LineChart >> draw: aDictionary [
	| b ds linearRegression |
	linearRegression := QueryLinearRegression runOn: aDictionary.
	b := RTGrapher new.
	ds := RTData new.
	"ds barShape color: Color blue."
	ds connectColor: self cimColor.
	ds points: aDictionary keys.
	ds y: [ :key | (aDictionary at: key) - yTranslation ].
	ds label: title.
	b add: ds.
	b minXFromDataSets.
	b maxXFromDataSets.
	ds := RTData new.
	ds connectColor: Color lightBrown.
	ds points: aDictionary keys.
	ds
		y: [ :key | 
			key asSeconds * (linearRegression at: 'slope')
				+ (linearRegression at: 'intercept') - yTranslation ];
		label: 'Droite de regression'.
	b add: ds.
	minY ifNotNil: [ b maxY: minY ].
	maxY ifNotNil: [ b maxY: maxY ].
	b axisY
		numberOfLabels: (aDictionary size / 12) asInteger;
		labelConversion: [ :v | yFormateur format: v asDuration ];
		title: yFormateur title.
	b axisX
		numberOfLabels: (aDictionary size / 6) asInteger;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > aDictionary keys size ])
				ifTrue: [ '' ]
				ifFalse: [ CIMDateFormater map: (aDictionary keys at: v) asString ] ].
	b legend.
	^ b
]

{ #category : #initialization }
LineChart >> initialize [
	super initialize.
	yTranslation := 0
]

{ #category : #accessing }
LineChart >> maxY [
	^ maxY
]

{ #category : #accessing }
LineChart >> maxY: anObject [
	maxY := anObject
]

{ #category : #accessing }
LineChart >> minY [
	^ minY
]

{ #category : #accessing }
LineChart >> minY: anObject [
	minY := anObject
]

{ #category : #accessing }
LineChart >> title: aString [ 
	title := aString
]

{ #category : #accessing }
LineChart >> yFormateur [
	^ yFormateur
]

{ #category : #accessing }
LineChart >> yFormateur: anObject [
	yFormateur := anObject
]

{ #category : #accessing }
LineChart >> yTranslation [
	^ yTranslation
]

{ #category : #accessing }
LineChart >> yTranslation: anObject [
	yTranslation := anObject
]
