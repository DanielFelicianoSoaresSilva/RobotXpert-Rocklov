*Settings*
Documentation    Arquivo principal

Library    Browser
Library    Collections
Library    libs/mongo.py
Library    OperatingSystem

Resource    Helpers.robot
Resource    Services.robot

Resource    actions/Components.robot
Resource    actions/EquipoActions.robot
Resource    actions/LoginActions.robot

*Keywords*
Start Session
    New Browser          chromium       False    slowMo=00:00:01
    New Page             about:blank
    #Set Viewport Size    1920           1080

    Go To    https://rocklov-daniel-web.herokuapp.com

Finish Test
    Take Screenshot    10

Take Screenshot and Logout
    Take Screenshot    10
    Do Logout

Take Screenshot And Go Back
    Take Screenshot
    Go Back

Login Session
    [Arguments]    ${email}    ${password}

    Start Session
    Login With       ${email}    ${password}
