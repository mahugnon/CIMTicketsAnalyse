Class {
	#name : #CIMWebModulesTimeToOpenCloseComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #initialization }
CIMWebModulesTimeToOpenCloseComponent >> defineStyleColors [
	^ Dictionary new
		add:
			'Evolutions'
				->
					(Dictionary
						with: #pointColor -> (Color fromHexString: '#1774FF')
						with: #strokeColor -> (Color fromHexString: '#1774FF'));
		add:
			'Bugs'
				->
					(Dictionary
						with: #pointColor -> (Color fromHexString: '#EB2FA7')
						with: #strokeColor -> (Color fromHexString: '#EB2FA7'));
		add:
			'Bugs regression'
				->
					(Dictionary
						with: #pointColor -> (Color fromHexString: '#EB2FA7')
						with: #strokeColor -> (Color fromHexString: '#EB2FA7'));
		add:
			'Evolution regression'
				->
					(Dictionary
						with: #pointColor -> (Color fromHexString: '#1774FF')
						with: #strokeColor -> (Color fromHexString: '#1774FF'));
		yourself
]

{ #category : #rendering }
CIMWebModulesTimeToOpenCloseComponent >> description [
	^ 'Time spent to close an opened ticket  '
]

{ #category : #'private-api' }
CIMWebModulesTimeToOpenCloseComponent >> initialize [
	super initialize.
	model := CIMWebTimeOpenCloseChartModel current
]
