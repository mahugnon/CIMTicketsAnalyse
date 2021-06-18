Extension { #name : #NeoJSONWriter }

{ #category : #'*CIMTicketsAnalyseWeb' }
NeoJSONWriter >> writeMonth: aMonth [
	writeStream << '"'.
	aMonth printOn: writeStream.
	writeStream << '"'
]

{ #category : #'*CIMTicketsAnalyseWeb' }
NeoJSONWriter >> writeYear: aYear [
	aYear start year printOn: writeStream
]
