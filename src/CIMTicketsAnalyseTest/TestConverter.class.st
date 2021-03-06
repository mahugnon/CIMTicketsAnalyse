Class {
	#name : #TestConverter,
	#superclass : #TestCase,
	#category : #CIMTicketsAnalyseTest
}

{ #category : #tests }
TestConverter >> testConvertHourContainingEtFormat [
	self
		assert: (CIMDateFormatConverter selectConverterFor: '16 h et 6 h test') class
		equals: ConvertHourContainingEtFormat
]

{ #category : #tests }
TestConverter >> testConvertHourContainingEtFormat1 [
	self
		assert: (CIMDateFormatConverter convert: '16 h et 6 h test')
		equals: (16 * 3600) asDuration
]

{ #category : #tests }
TestConverter >> testConvertHourFor8Hnico3HPasc [
	self
		assert: (CIMDateFormatConverter convert: '8H nico 3H Pasc')
		equals: ((8 + 3) * 3600) asDuration
]

{ #category : #tests }
TestConverter >> testConvertHourFor8Hnico3HPasc1 [
	self
		assert: (CIMDateFormatConverter selectConverterFor: '8H nico 3H Pasc') class
		equals: CIMHourOfTwoDevConverter
]

{ #category : #tests }
TestConverter >> testFindConverterFor0 [
	self
		assert: (CIMDateFormatConverter selectConverterFor: '0') class
		equals: ConvertMinuteFormat
]

{ #category : #tests }
TestConverter >> testFindConverterFor18heure [
	self
		assert: (CIMDateFormatConverter selectConverterFor: '18 heures') class
		equals: ConvertHourFormat
]

{ #category : #tests }
TestConverter >> testFindConverterFor1H30 [
	self
		assert: (CIMDateFormatConverter selectConverterFor: '1H30') class
		equals: ConvertHourMinuteFormat
]

{ #category : #tests }
TestConverter >> testFindConverterFor5jours [
	self
		assert: (CIMDateFormatConverter selectConverterFor: '5,5 jour') class
		equals: ConvertJoursFormat
]

{ #category : #tests }
TestConverter >> testFindConverterFor7H [
	self
		assert: (CIMDateFormatConverter selectConverterFor: '7H') class
		equals: ConvertHourFormat
]

{ #category : #tests }
TestConverter >> testconverterFor18Heures [
	self
		assert: (CIMDateFormatConverter convert: '18 heures')
		equals: (18 * 3600) asDuration
]

{ #category : #tests }
TestConverter >> testconverterFor5Jours [
	self
		assert: (CIMDateFormatConverter convert: '5 jours')
		equals: (5 * 27000) asDuration
]

{ #category : #tests }
TestConverter >> testconverterFor5commas5Jours [
	self
		assert: (CIMDateFormatConverter convert: '5.5 jours')
		equals: (5.5 * 27000) asDuration
]

{ #category : #tests }
TestConverter >> testconverterFor5g [
	self
		assert: (CIMDateFormatConverter convert: '5g')
		equals: (5 * 27000) asDuration
]

{ #category : #tests }
TestConverter >> testconverterFor7H [
	self
		assert: (CIMDateFormatConverter convert: '7H')
		equals: (7 * 3600) asDuration
]

{ #category : #tests }
TestConverter >> testconverterFor7heures [
	self
		assert: (CIMDateFormatConverter convert: '7 Heures')
		equals: (7 * 3600) asDuration
]

{ #category : #tests }
TestConverter >> testconverterShouldNotConvert5f [
	self
		assert: (CIMDateFormatConverter convert: '5f')
		equals: '5f'
]
