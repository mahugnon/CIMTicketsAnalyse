Class {
	#name : #CIMWebModulesTimeToOpenCloseComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #'as yet unclassified' }
CIMWebModulesTimeToOpenCloseComponent >> defineStyleColors [
	^ Dictionary new
		add:
			'Evolutions'
				->
					(Dictionary
						with: #pointColor -> (Color fromHexString: '#58E8D7')
						with: #strokeColor -> (Color fromHexString: '#58E8D7'));
		add:
			'Bugs'
				->
					(Dictionary
						with: #pointColor -> (Color fromHexString: '#FFC961')
						with: #strokeColor -> (Color fromHexString: '#FFC961'));
		add:
			'Bugs regression'
				->
					(Dictionary
						with: #pointColor -> (Color fromHexString: '#FFC961')
						with: #strokeColor -> (Color fromHexString: '#FFC961'));
		add:
			'Evolution regression'
				->
					(Dictionary
						with: #pointColor -> (Color fromHexString: '#58E8D7')
						with: #strokeColor -> (Color fromHexString: '#58E8D7'));
		yourself
]

{ #category : #rendering }
CIMWebModulesTimeToOpenCloseComponent >> description [
	^ 'Time spent to close an opened ticket for:  '
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeToOpenCloseComponent >> initialize [
	super initialize.
	model := CIMWebTimeOpenCloseChartModel current
]
