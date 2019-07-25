Class {
	#name : #DevChart,
	#superclass : #LineChart,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'drawing-general' }
DevChart >> draw: aDictionary [
	| b ds |
	b := RTGrapher new.
	ds := RTData new.
	ds dotShape ellipse
		color: [ :key | 
			(aDictionary at: key) = aDictionary median
				ifTrue: [ Color red ]
				ifFalse: [ Color fromString: '#7D4EBF' ] ].
	ds connectColor: (Color fromString: '#7D4EBF').
	ds points: aDictionary keys.
	ds y: [ :month | aDictionary at: month ].
	ds label: 'Ticket per dev'.
	ds interaction popup
		text: [ :elt | 
			'Month: ' , elt key asString , String cr , 'Ticket per dev: '
				, (aDictionary at: elt key) asFloat asString , String cr
				, 'Median: ' , aDictionary median asString ].
	b add: ds.
	b add: (self linearRegressionDataSetOn: aDictionary).
	b axisY
		numberOfLabels: (aDictionary size / 30) asInteger;
		title: 'Ticket per developeur'.
	b axisX
		numberOfLabels: (aDictionary size / 6) asInteger;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > aDictionary keys size ])
				ifTrue: [ '' ]
				ifFalse: [ CIMDateFormater map: (aDictionary keys at: v) asString ] ].
	^ b
]
