"
I compute the gap between release using version table
		version_date_arret field
"
Class {
	#name : #QueryReleaseGap,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryReleaseGap >> runOn: aCollection [
	^ QueryDurationBeteewnVersions
		runOn:
			((QueryCleanData new rejectVersionWithNilDateArret: aCollection)
				sorted: [ :a :b | a version_date_arret < b version_date_arret ])
]
