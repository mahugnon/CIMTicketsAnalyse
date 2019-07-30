Class {
	#name : #QueryReleaseGap,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryReleaseGap >> runOn: aFolder [
	^ QueryDistanceBeteewnMonths
		runOn: (QueryReleaseDateFromFolder runOn: aFolder) values
]
