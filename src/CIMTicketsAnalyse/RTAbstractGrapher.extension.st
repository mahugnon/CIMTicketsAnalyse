Extension { #name : #RTAbstractGrapher }

{ #category : #'*CIMTicketsAnalyse' }
RTAbstractGrapher >> exportChartTo: path [
	^ RTPNGExporter new
		builder: self build;
		fileName: path asFileReference fullName;
		exportToFile
]
