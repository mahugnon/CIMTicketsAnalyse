Extension { #name : #Year }

{ #category : #'*CIMTicketsAnalyseWeb' }
Year >> neoJsonOn: neoJSONWriter [
	neoJSONWriter writeYear: self
]
