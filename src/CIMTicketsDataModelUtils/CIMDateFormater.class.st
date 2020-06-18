Class {
	#name : #CIMDateFormater,
	#superclass : #Object,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #'operators-mapping' }
CIMDateFormater class >> map: anEngMonth [
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

{ #category : #accessing }
CIMDateFormater >> format: aDuration [
	^ aDuration days asString , 'j' , aDuration hours asString,'h'
]

{ #category : #accessing }
CIMDateFormater >> title [
	^ 'Temps en Jours heure'
]
