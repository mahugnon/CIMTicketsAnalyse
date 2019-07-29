Class {
	#name : #QueryAvgTimeDevOnPerBibliotheque,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryAvgTimeDevOnPerBibliotheque >> runOn: aCollection [
	^ aCollection
		collect:
			[ :bib | bib name -> (QueryAvgTicketsTimeDev new runOn: bib tickets) ]
]
