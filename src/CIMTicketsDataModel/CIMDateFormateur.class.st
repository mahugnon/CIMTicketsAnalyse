Class {
	#name : #CIMDateFormateur,
	#superclass : #Object,
	#category : #'CIMTicketsDataModel-Utils'
}

{ #category : #accessing }
CIMDateFormateur class >> format: aDuration [
	^ aDuration days asString , 'j' , aDuration hours asString,'h'
]

{ #category : #'operators-mapping' }
CIMDateFormateur class >> map: anEngMonth [
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
