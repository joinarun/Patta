*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Library           SeleniumLibrary
Library           ProcessCaptcha.py
Test Setup       Open Session    chrome

*** Variables ***
${districtCode}         03 
${talukCode}         02
${villageCode}         198
${surveyNo}        307
${subdivNo}         1E

*** Test Cases ***
Get Patta From Survey No
    [Template]    Patta Screenshot   
	306		1A1
	306		1A1B
	306		1A2
	306		1A3
	306		1A4
	306		1A5
	306		1A6
	306		1A7
	306		1B
	306		2B
	306		2C
	306		3
	306		4
	306		5
	306		6
	306		7
	306		8
	306		9
	306		10
	306		11
	306		12
	306		13
	306		14
	306		15
	306		16
	306		17
	306		18
	306		19
	306		20
	306		21
	306		22
	306		23
	306		24
	306		25
	306		26
	306		27
	306		28
	306		29
	306		30
	306		31
	306		32
	313		1A1A1A
	313		1A1A1B
	313		1B
	313		1C
	313		1D
	313		1E
	313		1F
	313		2
	313		3
	313		4
	313		5
	313		6
	313		7
	313		8
	313		9
	313		10
	313		11
	313		12
	313		13
	313		14
	313		15
	313		16
	313		17
	313		18
	313		19
	313		20
	313		21
	313		22
	313		23
	313		24
	313		25
	313		26
	313		27
	313		28
	313		29
	313		30
	313		31
	313		32
	313		33
	313		34
	313		35
	313		36
	313		37
	313		38
	313		39
	313		40
	313		41
	313		42
	313		43
	313		44
	313		45
	313		46
	313		47
	313		48
	313		49
	313		50
	313		51
	313		52
	313		53
	313		54
	307		1
	307		1A
	307		1B
	307		1C
	307		1D
	307		1D1
	307		1D2
	307		1E
	307		2
	307		3
	307		4
	307		5
	307		6
	307		7
	307		8
	307		9
	307		10
	307		11
	307		12
	307		13A
	307		13B
	307		13C
	307		13D
	307		14
	307		15
	307		16
	307		17
	307		18
	307		19
	307		20
	307		21
	307		22A1
	307		22A2
	307		22B
	
	

*** Keywords ***
Open Session
    [Arguments]    ${browser}
    Open Browser    http://eservices.tn.gov.in/eservicesnew/land/chitta.html?lan=en  ${browser}
    Maximize Browser Window
    Set Selenium Speed    0
	wait until page contains Element  //select[@name='districtCode']
	Select From List By Value   xpath://select[@name='districtCode']    ${districtCode} 
	Select Radio Button    areaType    rural
	Submit Form

Patta Screenshot
    [Arguments]    ${surveyNo}    ${subdivNo}    
	wait until page contains Element  //select[@name='talukCode']
	Select From List By Value   xpath://select[@name='talukCode']    ${talukCode}
	wait until page contains Element  //select[@name='villageCode']
	Click Element    //select[@name='villageCode']  
	Select From List By Value   xpath://select[@name='villageCode']    ${villageCode}
	Select Radio Button    viewOpt    sur
	Input Text    //input[@name='surveyNo']    ${surveyNo}
	wait until page contains Element  //select[@name='subdivNo']
	sleep    3s
	Click Element    xpath://select[@name='subdivNo']
	
	#take screenshot, crop for captcha and return value to hack_captcha
	Capture Page Screenshot    filename=myscreenshot.png
	${hack_captcha}    Captchatotext    myscreenshot.png 
	
	Select From List By Value   xpath://select[@name='subdivNo']    ${subdivNo}
	Select Radio Button    viewOption    view
	Input Text    //input[@name='captcha']    ${hack_captcha}
	Submit Form	
	Select Window    NEW
	#Page Should Contain    3239
	Capture Page Screenshot    filename=patta_${surveyNo}_${subdivNo}.png
	Close Window
	Select Window    MAIN
