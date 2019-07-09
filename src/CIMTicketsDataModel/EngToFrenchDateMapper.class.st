Class {
	#name : #EngToFrenchDateMapper,
	#superclass : #Object,
	#category : #'CIMTicketsDataModel-Utils'
}

{ #category : #'operators-mapping' }
EngToFrenchDateMapper class >> map: anEngMonth [
	| months monthYear |
	months := {('January' -> 'Janvier').
	('February' -> 'Février').
	('March' -> 'Mars').
	('April' -> 'Avril').
	('May' -> 'Mai').
	('June' -> 'Juin').
	('July' -> 'Juillet').
	('August' -> 'Août').
	('September' -> 'Septembre').
	('October' -> 'Octobre').
	('November' -> 'Novembre').
	('December' -> 'Décembre')} asDictionary.
	monthYear := ' ' split: anEngMonth .
	^ (months at: monthYear first), ' ', monthYear second
]
