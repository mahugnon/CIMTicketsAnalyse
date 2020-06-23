Class {
	#name : #Tomcat,
	#superclass : #Object,
	#instVars : [
		'port'
	],
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
Tomcat >> start [
	| serverPath |
	serverPath := (self locateRoot / 'resources/dba-restfull-server.jar')
		pathString.
	LibC
		runCommand:
			'java -Ddb2.jcc.charsetDecoderEncoder=3 -jar ' , serverPath
				, ' --server.port=9599 &'
]

{ #category : #accessing }
Tomcat >> startOn: aPortString [
	| serverPath |
	self traceCr: 'Stating tomcat server .....'.
	port := aPortString.
	serverPath := (IceBergProjectLocator locateRoot
		/ 'resources/dba-restfull-server.jar') pathString.
	self stop.
	LibC
		runCommand:
			'java -Ddb2.jcc.charsetDecoderEncoder=3 -jar ' , serverPath
				, ' --server.port=' , port , ' &'
]

{ #category : #accessing }
Tomcat >> stop [
self traceCr: 'stopping tomcat server ....'.
	LibC
		runCommand: 'curl -X POST localhost:' , port , '/actuator/shutdown'
]
