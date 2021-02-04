Extension { #name : #ThemeIcons }

{ #category : #'*CIMTicketsDataModel-DataBase' }
ThemeIcons >> dashbordIcon [
	^ icons
			at: #'dashbordIcon'
			ifAbsentPut:[ Form fromBinaryStream: self dashbordIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'*CIMTicketsDataModel-DataBase' }
ThemeIcons >> dashbordIconContents [
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAAbwAAAG8B8aLcQwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoA
AAIbSURBVDiNnZNNSFRRGIafc+6dn66jIzNmyqBNptTYykEoxBRsUYQQEWq5MgkMXARtglpU
S9etWuSqRT/LXNaiKHBTgovKwphCg9SB+dE7c2fm3tPipjNTN4je5Xu+83zf93KOGEqOPlAw
DRAQAkspdqVpGrZt8zcJmJcKptp0jfEDBg+HIszGQ3sFw8dPEQ5VuHxuzROgYEoCcqzZYHIk
SMOVCmcmfVzvaHQ7CEE0XOL0wBYAvQEfsp4hJcCCVcB/1h1VSzgsNZQQHh3vtUdo1TWsbj92
s4vSATZ+2zMtbBSwmd6gI9ZHOh+h51Cc7/vDdGpRxEAA51OOH4urLuCP3X7luPxxifbWGHPz
bUCRW2tFAHzPTYqlYnWCHVMxNpPbA5gFl3C4s4fVb589Azzo06sAgN6uDCeCAVIrEZ4pE4B4
R1cd4HyTgSEFKMg7iq/liguQUnHtUoovL45yoaWJxYLFZsVGRzAbacRSColgsWCxYpUJSkHW
dqoTOI7gznKCN/1tXM0Uyabcw6gmeJoz2ajUh2zZ1ccmTiZHFYDyCYpH/ARSZeS2C2gKhek7
1u+ZQS6fYen9W8TI4MQrz4p/lB7tTvQD+/7zfkFXcFPABFQfn1KOv+LYLXWdpLYlhCzVWErB
Y6Fqfh/A+MxceH39w6Bpmgu1vmEYo7FY4vWT+zeytX4d4OL03aTj8BJBCC8ptqVk+NH87Xe7
1k9Pub5FpCBfkwAAAABJRU5ErkJggg=='
]
