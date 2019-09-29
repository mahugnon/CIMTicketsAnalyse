Class {
	#name : #CIMWebModulesTimeSpentComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #'as yet unclassified' }
CIMWebModulesTimeSpentComponent >> defineStyleColors [
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
CIMWebModulesTimeSpentComponent >> description [
	^ 'Time spent developping by dev team  for: '
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeSpentComponent >> initialize [
	super initialize.
	model := CIMWebTimeSpentChartModel current
]
