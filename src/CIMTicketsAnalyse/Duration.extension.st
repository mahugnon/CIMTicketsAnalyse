Extension { #name : #Duration }

{ #category : #'*CIMTicketsAnalyse' }
Duration >> cimDays [
 	"Answer a number that represents the number of complete days in the receiver"
	^ seconds quo: (7.5*3600)

]

{ #category : #'*CIMTicketsAnalyse' }
Duration >> cimHours [
	"Answer a number that represents the number of complete hours in the receiver, after the number of complete days has been removed."

	^ (seconds rem: 7.5 * 3600) quo: SecondsInHour
]

{ #category : #'*CIMTicketsAnalyse' }
Duration >> printCIMFormatOn: aStream [
	"Format as per ANSI 5.8.2.16: [-]D:HH:MM:SS[.S]"

	| d h m s n |
	d := self cimDays abs.
	h := self cimHours abs.
	m := self minutes abs.
	s := self seconds abs truncated.
	n := self nanoSeconds abs.
	self negative
		ifTrue: [ aStream nextPut: $- ].
	d printOn: aStream.
	aStream nextPut: $:.
	h < 10
		ifTrue: [ aStream nextPut: $0 ].
	h printOn: aStream.
	aStream nextPut: $:.
	m < 10
		ifTrue: [ aStream nextPut: $0 ].
	m printOn: aStream.
	aStream nextPut: $:.
	s < 10
		ifTrue: [ aStream nextPut: $0 ].
	s printOn: aStream.
	n = 0
		ifFalse: [ | z ps |
			aStream nextPut: $..
			ps := n printString padLeftTo: 9 with: $0.
			z := ps findLast: [ :c | c asciiValue > $0 asciiValue ].
			ps from: 1 to: z do: [ :c | aStream nextPut: c ] ]
]
