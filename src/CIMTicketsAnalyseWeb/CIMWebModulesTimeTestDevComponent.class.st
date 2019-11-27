Class {
	#name : #CIMWebModulesTimeTestDevComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #'private-api' }
CIMWebModulesTimeTestDevComponent >> defineStyleColors [
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
CIMWebModulesTimeTestDevComponent >> description [
	^ 'Time spent testing by Dev team  '
]

{ #category : #initialization }
CIMWebModulesTimeTestDevComponent >> initialize [
	super initialize.
	model := CIMWebTimeTestDevChartModel current
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeTestDevComponent >> yAxesLegend [
	^ 'Time in hour'
]
