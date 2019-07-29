Class {
	#name : #CIMAbstractChart,
	#superclass : #Object,
	#instVars : [
		'minY',
		'maxY',
		'yFormateur',
		'yTranslation',
		'perDev',
		'timeSerie',
		'label',
		'title'
	],
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
CIMAbstractChart >> cimColor [
	^ self subclassResponsibility
]

{ #category : #'drawing-general' }
CIMAbstractChart >> convertYAxis [
	^ [ :v | yFormateur format: (v + yTranslation) asDuration ]
]

{ #category : #'drawing-general' }
CIMAbstractChart >> developeurDataSetOn: aDictionary [
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
CIMAbstractChart >> draw [
	| b ds |
	b := RTGrapher new.
	self isperDev
		ifTrue: [ b := RTDoubleGrapher new.
			b addRight: (self developeurDataSetOn: timeSerie).
			b axisYRight color: (Color fromString: '#4A9CFF') ].
	ds := RTData new.
	ds connectColor: self cimColor.
	ds points: timeSerie keys.
	ds y: [ :key | (timeSerie at: key) - yTranslation ].
	ds label: label.
	ds interaction popup text: [ :elt | self popupTextOn: elt ].
	b add: ds.
	b add: (self linearRegressionDataSetOn: timeSerie).
	minY ifNotNil: [ b maxY: minY ].
	maxY ifNotNil: [ b maxY: maxY ].
	b axisY
		numberOfLabels: (timeSerie size / 30) asInteger;
		labelConversion: self convertYAxis;
		title: title.
	b axisX
		numberOfLabels: (timeSerie size / 6) asInteger;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > timeSerie keys size ])
				ifTrue: [ '' ]
				ifFalse: [ CIMDateFormater map: (timeSerie keys at: v) asString ] ].
	"b legend."
	^ b
]

{ #category : #initialization }
CIMAbstractChart >> initialize [
	super initialize.
	yTranslation := 0.
	perDev := false
]

{ #category : #'as yet unclassified' }
CIMAbstractChart >> isperDev [
	^ perDev
]

{ #category : #'drawing-general' }
CIMAbstractChart >> linearRegressionDataSetOn: aDictionary [
	| ds linearRegression |
	linearRegression := QueryLinearRegression runOn: aDictionary.
	ds := RTData new.
	ds connectColor: Color lightBrown.
	ds points: aDictionary keys.
	ds
		y: [ :key | 
			key asSeconds * (linearRegression at: 'slope')
				+ (linearRegression at: 'intercept') - yTranslation];
		label: 'Droite de regression'.
	^ ds
]

{ #category : #accessing }
CIMAbstractChart >> maxY [
	^ maxY
]

{ #category : #accessing }
CIMAbstractChart >> maxY: anObject [
	maxY := anObject
]

{ #category : #accessing }
CIMAbstractChart >> minY [
	^ minY
]

{ #category : #accessing }
CIMAbstractChart >> minY: anObject [
	minY := anObject
]

{ #category : #'as yet unclassified' }
CIMAbstractChart >> perDev: aBoolean [
	perDev := aBoolean
]

{ #category : #'drawing-general' }
CIMAbstractChart >> popupTextOn: anObject [
	^ 'Month: ' , anObject key asString , String cr , 'Duration : '
		, (yFormateur format: (timeSerie at: anObject key) asDuration) asString
		, String cr , 'Median: ' , timeSerie median asString
]

{ #category : #accessing }
CIMAbstractChart >> timeSerie: anObject [
	timeSerie := anObject
]

{ #category : #accessing }
CIMAbstractChart >> yFormateur [
	^ yFormateur
]

{ #category : #accessing }
CIMAbstractChart >> yFormateur: anObject [
	yFormateur := anObject.
	title := yFormateur title
]

{ #category : #accessing }
CIMAbstractChart >> yTranslation [
	^ yTranslation
]

{ #category : #accessing }
CIMAbstractChart >> yTranslation: anObject [
	yTranslation := anObject
]
