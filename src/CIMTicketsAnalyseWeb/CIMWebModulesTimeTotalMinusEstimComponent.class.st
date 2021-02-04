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

{ #category : #rendering }
CIMWebModulesTimeTotalMinusEstimComponent >> description [
	^ 'Total difference bewteen estimated and actual Dev time on tickets '
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
