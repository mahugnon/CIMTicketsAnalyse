Class {
	#name : #CIMWebAbstractChartComponent,
	#superclass : #WAComponent,
	#instVars : [
		'title',
		'model'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsGeneralIzyProtect'
}

{ #category : #accessing }
CIMWebAbstractChartComponent >> chartDataSet [
	
]

{ #category : #accessing }
CIMWebAbstractChartComponent >> description [
	^ self class description
]

{ #category : #initialization }
CIMWebAbstractChartComponent >> initialize [
	super initialize.
	model := CIMWebAbstractModel new
]

{ #category : #'as yet unclassified' }
CIMWebAbstractChartComponent >> linearRegressionCaracteristcs [
	^ QueryLinearRegression new  runOn1: self chartDataSet
]

{ #category : #accessing }
CIMWebAbstractChartComponent >> plotRegLinefunction: x [
	^ x * self linearRegressionCaracteristcs slope
		+ self linearRegressionCaracteristcs intercept
]

{ #category : #accessing }
CIMWebAbstractChartComponent >> renderChartJsComponentOn: html [
	html
		render:
			(ChartJsComponent
				data:
					((Chart2dData
						xObjects: self chartDataSet keys
						yObjects: self chartDataSet values
						yFunction:
							[ :x | self plotRegLinefunction: x ])
						keyDisplayBlock: #printString;
						"valueDisplayBlock: [ :v | CIMDayFormater new format: v asDuration ];"
							chartType: ChartLine))
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
