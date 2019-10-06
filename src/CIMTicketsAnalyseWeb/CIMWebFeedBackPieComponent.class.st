Class {
	#name : #CIMWebFeedBackPieComponent,
	#superclass : #CIMWebAbstractPieComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #accessing }
CIMWebFeedBackPieComponent >> description [
	^ 'total feedback'
]

{ #category : #initialization }
CIMWebFeedBackPieComponent >> initialize [
	super initialize.
	model := CIMWebFeedBackPieModel current.
	chartDataSet := model feedBacksData
]

{ #category : #accessing }
CIMWebFeedBackPieComponent >> title [
	^ 'Feedback per tickets'
]
