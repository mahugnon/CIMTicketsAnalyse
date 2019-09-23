Class {
	#name : #LineChart,
	#superclass : #Object,
	#instVars : [
		'minY',
		'maxY',
		'yFormateur',
		'yTranslation',
		'perDev',
		'timeSerie',
		'label',
		'title',
		'graphic',
		'view'
	],
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
LineChart class >> chartFor: aSelectQuery [
	self subclasses
		detect: [ :chart | chart selectQuery = aSelectQuery ]
		ifFound: [ :chart | ^ chart new ]
]

{ #category : #'as yet unclassified' }
LineChart class >> selectQuery [
	
]

{ #category : #'as yet unclassified' }
LineChart >> cimColor [
	^ Color blue
]

{ #category : #'drawing-general' }
LineChart >> convertYAxis [
	^ [ :v | yFormateur format: (v + yTranslation) asDuration ]
]

{ #category : #'drawing-general' }
LineChart >> developeurDataSetOn: aCollection [
	| ds |
	ds := RTData new.
	ds connectColor: (Color fromString: '#1BB330').
	ds points: (aCollection collect: #time).
	ds
		y: [ :time | 
			QueryNumberOfDeveloppeurForAmonth new
				runOn: Tbl izyDevs rows
				for: time ];
		label: 'Nombre developpeurs'.
	^ ds
]

{ #category : #'drawing-general' }
LineChart >> draw [
	| ds |
	graphic := RTGrapher new.
	self isperDev
		ifTrue: [ graphic := RTDoubleGrapher new.
			graphic addRight: (self developeurDataSetOn: timeSerie).
			graphic axisYRight color: (Color fromString: '#4A9CFF') ].
	ds := RTData new.
	ds connectColor: self cimColor.
	ds points: timeSerie.
	ds y: [ :aNode | aNode value - yTranslation ].
	ds label: label.
	graphic add: ds.
	graphic
		add: (self linearRegressionDataSetOn: timeSerie color: Color lightBrown).
	minY ifNotNil: [ graphic maxY: minY ].
	maxY ifNotNil: [ graphic maxY: maxY ].
	graphic axisY
		numberOfLabels: (timeSerie size / 30) asInteger;
		labelConversion: self convertYAxis;
		title: title.
	graphic axisX
		numberOfLabels: (timeSerie size / 6) asInteger;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > timeSerie size ])
				ifTrue: [ '' ]
				ifFalse: [ CIMDateFormater map: (timeSerie at: v) time asString ] ].
	"b legend."
	graphic build.
	^ graphic view
]

{ #category : #'drawing-general' }
LineChart >> draw: aView [
	| ds |
	graphic := RTGrapher new.
	graphic view: aView.
	self isperDev
		ifTrue: [ graphic := RTDoubleGrapher new.
			graphic addRight: (self developeurDataSetOn: timeSerie).
			graphic axisYRight color: (Color fromString: '#4A9CFF') ].
	ds := RTData new.
	ds connectColor: self cimColor.
	ds points: timeSerie.
	ds y: [ :aNode | aNode value - yTranslation ].
	ds label: label.
	"ds interaction popup text: [ :elt | self popupTextOn: elt ]."
	graphic add: ds.
	graphic
		add: (self linearRegressionDataSetOn: timeSerie color: Color lightBrown).
	minY ifNotNil: [ graphic maxY: minY ].
	maxY ifNotNil: [ graphic maxY: maxY ].
	graphic axisY
		numberOfLabels: (timeSerie size / 30) asInteger;
		labelConversion: self convertYAxis;
		title: title.
	graphic axisX
		numberOfLabels: (timeSerie size / 6) asInteger;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > timeSerie size ])
				ifTrue: [ '' ]
				ifFalse: [ CIMDateFormater map: (timeSerie at: v) time asString ] ].
	"b legend."
	^ graphic
]

{ #category : #initialization }
LineChart >> initialize [
	super initialize.
	yTranslation := 0.
	perDev := false.
	view := RTView new
]

{ #category : #'as yet unclassified' }
LineChart >> isperDev [
	^ perDev
]

{ #category : #'drawing-general' }
LineChart >> linearRegressionDataSetOn: aCollection color: aColor [
	| ds linearRegression |
	linearRegression := QueryLinearRegression runOn: aCollection.
	ds := RTData new.
	ds connectColor: aColor.
	ds points: aCollection.
	ds
		y: [ :node | 
			node time asSeconds * (linearRegression at: 'slope')
				+ (linearRegression at: 'intercept') - yTranslation ];
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

{ #category : #'drawing-general' }
LineChart >> popupTextOn: anObject [
	^ 'Month: ' , anObject key asString , String cr , 'value : '
		, (yFormateur format: (timeSerie at: anObject key) asDuration) asString
		, String cr , 'Median: ' , timeSerie median asString
]

{ #category : #accessing }
LineChart >> timeSerie: anObject [
	timeSerie := anObject
]

{ #category : #accessing }
LineChart >> yFormateur [
	^ yFormateur
]

{ #category : #accessing }
LineChart >> yFormateur: anObject [
	yFormateur := anObject.
	title := yFormateur title
]

{ #category : #accessing }
LineChart >> yTranslation [
	^ yTranslation
]

{ #category : #accessing }
LineChart >> yTranslation: anObject [
	yTranslation := anObject
]
