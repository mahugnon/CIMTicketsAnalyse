Class {
	#name : #CIMWebHeaderCompenent,
	#superclass : #WAComponent,
	#category : #'CIMTicketsAnalyseWeb-WebComponentsCore'
}

{ #category : #rendering }
CIMWebHeaderCompenent >> renderContentOn: html [
	html mdlLayout
		with: [ html
				mdlLayoutHeader: [ html
						mdlLayoutHeaderRow: [" html image
								style: 'width: 200px; height: 70px; background-color: white';
								url: (CIMIconLibrary urlOf: 'logocimSvg')."
							html space: 100.
							html mdlLayoutTitle: 'TicketsDashboard'.
							html space: 50.
							html image
								style: 'width: 75px; height: 70px;';
								url: (CIMIconLibrary urlOf: 'rmodPng') ] ] ]
]
