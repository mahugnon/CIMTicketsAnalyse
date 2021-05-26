Class {
	#name : #CIMWebFooterCompenent,
	#superclass : #WAComponent,
	#category : #'CIMTicketsAnalyseWeb-WebComponentsCore'
}

{ #category : #rendering }
CIMWebFooterCompenent >> renderContentOn: html [
	html
		mdlMiniFooter: [ html
				mdlMiniFooterLeftSection: [ html mdlLogo: 'HOUEKPETODJI Honoré'.
					html
						mdlMiniFooterLinkList: [ html listItem: [ html anchor
								url: 'https://github.com/mahugnon/CIMTicketsAnalyse';
												target: '_blank';
												with: 'Github' ] .
											html listItem: [ html anchor
								url: 'https://www.linkedin.com/in/mahugnon-honore-4948b6114/';
												target: '_blank';
												with: 'Linkedin' ] ] ] ]
]
