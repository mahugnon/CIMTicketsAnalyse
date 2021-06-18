Extension { #name : #Month }

{ #category : #'*CIMTicketsAnalyseWeb' }
Month >> neoJsonOn: neoJSONWriter [
	neoJSONWriter writeMonth: self
]
