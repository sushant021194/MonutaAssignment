*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SearchButton}    id=footer_search_location
${url}            https://www.monuta.nl/
${searchbar}      id=footer_search_location
${cookiesID}      id=mcc-cookie-button-close
${pageURL}        https://www.monuta.nl/uitvaart/monuta-bij-u-in-de-buurt/?query=7336AM

*** Test Cases ***
TC_VerifyLocation
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${cookiesID}    60s
    Click Button    ${cookiesID}
    Input Text    ${searchbar}    7336AM
    Capture Page Screenshot
    Press Key    ${SearchButton}    \\13
    Capture Page Screenshot
    ${currentUrl}=    Get Location
    Should Be Equal    ${currentUrl}    ${pageURL}    Opps! Does not satisfied expected URL
    [Teardown]    Close Browser
