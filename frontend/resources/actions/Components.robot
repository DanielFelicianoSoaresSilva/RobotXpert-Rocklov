*Settings*
Documentation       Shared Elements

*Keywords*
Alert Text Should Be
    [Arguments]    ${expected_message}

    ${element}    Set Variable    css=.alert

    Wait For Elements State    ${element}    visible    5
    Get Text                   ${element}    ==         ${expected_message}
