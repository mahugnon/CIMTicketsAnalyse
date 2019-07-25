Class {
	#name : #LineChart,
	#superclass : #Object,
	#instVars : [
		'title',
		'minY',
		'maxY',
		'yFormateur',
		'yTranslation',
		'perDev'
	],
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
LineChart >> cimColor [
	^ self subclassResponsibility
]

{ #category : #'drawing-general' }
LineChart >> developeurDataSetOn: aDictionary [
	| ds |
	ds := RTData new.
	ds connectColor: (Color fromString: '#1BB330').
	ds points: aDictionary keys.
	ds
		y: [ :key | 
			QueryNumberOfDeveloppeurForAmonth new
				runOn: (Tbl tables at: 12) rows
				for: key ];
		label: 'Nombre developpeurs'.
	^ ds
]

{ #category : #'drawing-general' }
LineChart >> draw: aDictionary [
	| b ds |
	"ds barShape color: Color blue."
	b := RTGrapher new.
	self isperDev
		ifTrue: [ b := RTDoubleGrapher new.
			b addRight: (self developeurDataSetOn: aDictionary).
			b axisYRight color: (Color fromString: '#4A9CFF') ].
	ds := RTData new.
	ds connectColor: self cimColor.
	ds points: aDictionary keys.
	ds y: [ :key | aDictionary at: key ].
	ds label: title.
	ds interaction popup
		text: [ :elt | 
			'Month: ' , elt key asString , String cr , 'Temps : '
				, (aDictionary at: elt key) asDuration asString ].
	b add: ds.
	b add: (self linearRegressionDataSetOn: aDictionary).
	minY ifNotNil: [ b maxY: minY ].
	maxY ifNotNil: [ b maxY: maxY ].
	b axisY
		numberOfLabels: (aDictionary size / 30) asInteger;
		labelConversion: [ :v | yFormateur format: v asDuration ];
		title: yFormateur title.
	b axisX
		numberOfLabels: (aDictionary size / 6) asInteger;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > aDictionary keys size ])
				ifTrue: [ '' ]
				ifFalse: [ CIMDateFormater map: (aDictionary keys at: v) asString ] ].

	"b legend."
	^ b
]

{ #category : #initialization }
LineChart >> initialize [
	super initialize.
	yTranslation := 0.
	perDev := false
]

{ #category : #'as yet unclassified' }
LineChart >> isperDev [
	^ perDev
]

{ #category : #'drawing-general' }
LineChart >> linearRegressionDataSetOn: aDictionary [
	| ds linearRegression |
	linearRegression := QueryLinearRegression runOn: aDictionary.
	ds := RTData new.
	ds connectColor: Color lightBrown.
	ds points: aDictionary keys.
	ds
		y: [ :key | 
			key asSeconds * (linearRegression at: 'slope')
				+ (linearRegression at: 'intercept') ];
		label: 'Droite de regression'.
	^ ds
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

{ #category : #'as yet unclassified' }
LineChart >> perDev: aBoolean [
	perDev := aBoolean
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
