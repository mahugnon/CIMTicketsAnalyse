Class {
	#name : #LineChart,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'drawing-general' }
LineChart >> draw: aDictionary [
	| b ds |
	b := RTGrapher new.
	ds := RTData new.
	"ds barShape color: Color blue."
	ds connectColor: Color blue.
	ds points: aDictionary keys.
	ds y: [ :year | aDictionary at: year ].
	b add: ds.
	b maxY: 10.
	b axisX
		numberOfLabels: aDictionary size;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > aDictionary keys size ])
				ifTrue: [ ''	"for 0" ]
				ifFalse: [ (aDictionary keys at: v) asString ] ].
	^ b
]
