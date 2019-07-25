Class {
	#name : #DevChart,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'drawing-general' }
DevChart >> draw: aDictionary [
	| b ds |
	b := RTGrapher new.
	ds := RTData new.
	"ds barShape color: Color blue."
	ds connectColor: Color blue.
	ds points: aDictionary keys.
	ds y: [ :month | aDictionary at: month ].
	ds label: 'Ticket per dev'.
	ds interaction popup
		text: [ :elt | 
			'Month: ' , elt key asString , String cr , 'Ticket per dev: '
				, (aDictionary at: elt key) asString ].
	b add: ds.
	b axisX
		numberOfLabels: aDictionary size;
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > aDictionary keys size ])
				ifTrue: [ ''	"for 0" ]
				ifFalse: [ (aDictionary keys at: v) asString ] ].
	b axisY
		title: 'Number of Evolution or Bugs';
		noDecimal.
	b legend below.
	b
]
