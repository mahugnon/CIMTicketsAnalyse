Class {
	#name : #Tomcat,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'CIMTicketsDataModelUtils-TicketServerUtils'
}

{ #category : #accessing }
Tomcat class >> start [
	uniqueInstance ifNotNil: [ uniqueInstance stop ].
	uniqueInstance := self new.
	uniqueInstance start
]

{ #category : #starting }
Tomcat class >> startOn: aPortString [
	uniqueInstance ifNotNil: [ uniqueInstance stop ].
	uniqueInstance := self new.
	uniqueInstance startOn: aPortString
]

{ #category : #accessing }
Tomcat class >> stop [
	uniqueInstance stop
]

{ #category : #accessing }
Tomcat >> locateRoot [
	^ IceBergProjectLocator new
		locationOfProjectRepo: 'CIMTicketsAnalyse'
]

{ #category : #accessing }
Tomcat >> start [
	| serverPath |
	serverPath := (self locateRoot / 'dba-restfull-server.jar')
		pathString.
	LibC
		runCommand:
			'java -Ddb2.jcc.charsetDecoderEncoder=3 -jar ' , serverPath
				, ' --server.port=8080 &'
]

{ #category : #accessing }
Tomcat >> startOn: aPortString [
	| serverPath |
	serverPath := (self locateRoot / 'dba-restfull-server.jar')
		pathString.
	LibC
		runCommand:
			'java -Ddb2.jcc.charsetDecoderEncoder=3 -jar ' , serverPath
				, ' --server.port=' , aPortString , ' &'
]

{ #category : #accessing }
Tomcat >> stop [
	LibC runCommand: 'curl -X POST localhost:8080/actuator/shutdown'
]
