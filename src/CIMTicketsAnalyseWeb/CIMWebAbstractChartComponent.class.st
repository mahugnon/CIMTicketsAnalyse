Class {
	#name : #CIMWebAbstractChartComponent,
	#superclass : #WAComponent,
	#instVars : [
		'title',
		'model'
	],
	#category : #'CIMTicketsAnalyseWeb-WebComponents'
}

{ #category : #accessing }
CIMWebAbstractChartComponent >> description [
	^ self class description
]

{ #category : #initialization }
CIMWebAbstractChartComponent >> initialize [
	super initialize.
	model := CIMWebAbstractModel new
]

{ #category : #accessing }
CIMWebAbstractChartComponent >> renderChartJsComponentOn: html [
	^ self subclassResponsibility
]

{ #category : #accessing }
CIMWebAbstractChartComponent >> renderChartOn: html [
	html div
		class: 'chartJs-demo-snippet-demo';
		with: [ self renderChartJsComponentOn: html ]
]

{ #category : #accessing }
CIMWebAbstractChartComponent >> renderContentOn: html [
	self renderTitleOn: html.
	html div
		class: 'chartJs-demo-snippet-group';
		with: [ self renderChartOn: html ]
]

{ #category : #accessing }
CIMWebAbstractChartComponent >> renderTitleOn: html [
	html div
		class: 'chartJs-demo-page-title';
		with: [ html heading
				level3;
				with: self title.
			html paragraph: self description.
			self warningDescription ifNotNil: [ :desc | html strong: desc ] ]
]

{ #category : #accessing }
CIMWebAbstractChartComponent >> title [
	^ title
]

{ #category : #accessing }
CIMWebAbstractChartComponent >> title: anObject [
	title := anObject
]

{ #category : #accessing }
CIMWebAbstractChartComponent >> warningDescription [
	"If a demo needs a warning, override this method."

	^ nil
]
