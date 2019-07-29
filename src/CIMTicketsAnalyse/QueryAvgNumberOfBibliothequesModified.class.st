Class {
	#name : #QueryAvgNumberOfBibliothequesModified,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Bibliotheque'
}

{ #category : #running }
QueryAvgNumberOfBibliothequesModified >> runOn: aCollection [
	aCollection ifEmpty: [ ^ 0 ].
	^ ((QueryNumberOfBibliothequesModified runOn: aCollection)
		/ aCollection size) asFloat
]
