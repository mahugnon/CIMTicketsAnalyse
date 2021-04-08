Class {
	#name : #QueryDurationBeteewnVersions,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryDurationBeteewnVersions >> runOn: aCollection [
	| result |
	result := OrderedDictionary new.
	1 to: aCollection size - 1 do: [ :i | 
		result
			add:
				((aCollection at: i) version_libelle , '->'
					, (aCollection at: i + 1) version_libelle)
					->
						((aCollection at: i + 1) version_date_arret
							- (aCollection at: i) version_date_arret) totalSeconds ].
	^ result
]
