Class {
	#name : #CIMWebModulesTimeTotalMinusEstimComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #'private-api' }
CIMWebModulesTimeTotalMinusEstimComponent >> bugsEvolutionLinearRegression [
	model needMultiRegressionLine
		ifTrue: [ ^ self twoRegressionsForBugsAndEvolutions ]
		ifFalse: [ ^ super bugsEvolutionLinearRegression ]
]

{ #category : #'private-api' }
CIMWebModulesTimeTotalMinusEstimComponent >> defineStyleColors [
	^ Dictionary new
		add:
			'Evolutions'
				->
					(Dictionary
						with: #pointColor -> Color blue
						with: #strokeColor -> Color blue);
		add:
			'Bugs'
				->
					(Dictionary
						with: #pointColor -> Color red
						with: #strokeColor -> Color red);
		add:
			'Bugs regression'
				->
					(Dictionary
						with: #pointColor -> Color red
						with: #strokeColor -> Color red);
		add:
			'Evolution regression'
				->
					(Dictionary
						with: #pointColor -> Color blue
						with: #strokeColor -> Color blue);
		yourself
]

{ #category : #rendering }
CIMWebModulesTimeTotalMinusEstimComponent >> description [
	^ 'Time total spent minus estimated time spent  '
]

{ #category : #initialization }
CIMWebModulesTimeTotalMinusEstimComponent >> initialize [
	super initialize.
	model := CIMWebTimeTotalMinusEstimChartModel current
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeTotalMinusEstimComponent >> twoRegressionsForBugsAndEvolutions [
	| keys |
	keys := self dataSet first.
	^ {('Bugs regression'
		->
			((SplitSimpleTicketsByYear new
				time: model releventYear;
				runOn:
					(OrderedDictionary
						newFromKeys: keys
						andValues: self dataSet second value))
				collect: [ :data | QueryLinearRegression new runOn1: data ])).
	('Evolution regression'
		->
			((SplitSimpleTicketsByYear new
				time: model releventYear;
				runOn:
					(OrderedDictionary
						newFromKeys: keys
						andValues: self dataSet second value))
				collect: [ :data | QueryLinearRegression new runOn1: data ]))}
		asOrderedDictionary
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeTotalMinusEstimComponent >> yDoubleRegLineFunctionYear: x [
	| regression |
	x < model releventYear
		ifTrue: [ regression := x * self twoRegressionsForBugsAndEvolutions first slope
				+ self twoRegressionsForBugsAndEvolutions first intercept ].
	x > model releventYear
		ifTrue: [ regression := x * self twoRegressionsForBugsAndEvolutions second slope
				+ self twoRegressionsForBugsAndEvolutions second intercept ].
	x = model releventYear
		ifTrue: [ regression := 'NaN' ].
	^ regression
]
