Class {
	#name : #CIMWebModulesTimeSpentComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #'private-api' }
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
	^ 'Total development time on closed tickets'
]

{ #category : #initialization }
CIMWebModulesTimeSpentComponent >> initialize [
	super initialize.
	model := CIMWebTimeSpentChartModel current
]
