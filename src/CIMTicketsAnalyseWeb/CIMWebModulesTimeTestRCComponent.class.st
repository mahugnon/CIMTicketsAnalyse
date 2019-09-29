Class {
	#name : #CIMWebModulesTimeTestRCComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #'as yet unclassified' }
CIMWebModulesTimeTestRCComponent >> defineStyleColors [
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
CIMWebModulesTimeTestRCComponent >> description [
	^ 'Time spent testing by RC team for:  '
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeTestRCComponent >> initialize [
	super initialize.
	model := CIMWebTimeTestRCChartModel current
]
