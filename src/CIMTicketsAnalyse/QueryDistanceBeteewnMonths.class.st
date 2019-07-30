Class {
	#name : #QueryDistanceBeteewnMonths,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryDistanceBeteewnMonths >> runOn: aCollection [
	| result |
	result := OrderedDictionary new.
	1 to: aCollection size - 1 do: [ :i | 
		result
			add:
				{(aCollection at: i).
				(aCollection at: i + 1)}
					-> ((aCollection at: i + 1) - (aCollection at: i)) ].
	^ result
]
