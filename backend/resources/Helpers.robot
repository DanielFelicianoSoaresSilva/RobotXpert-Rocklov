*Settings*
Documentation       Aqui teremos as KWS de ajuda

Library     OperatingSystem

*Keywords*
Get Json
    [Arguments]     ${route}        ${file_name}

#   ${fixture}      Get File        ${EXECDIR}/resources/fixtures/sessions/${file_name}

    ${fixture}      Get File        ${EXECDIR}/resources/fixtures/${route}/${file_name}

    #fazer que a variavel seja entendida como Json
    ${json}         Evaluate        json.loads($fixture)        json

    [return]        ${json}

Get Token
    [Arguments]     ${email}        ${password}

    &{payload}      Create Dictionary       email=${email}      password=${password}

    ${response}     POST Login      ${payload}

    ${user_token}   Set Variable    ${response.json()}[user_token]

    [return]        ${user_token}
