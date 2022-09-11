*Settings*
Documentation    Aqui teremos as KWS de ajuda

Library    OperatingSystem

*Keywords*
Get Equipo
    [Arguments]    ${equipo}

    ${fixture}    Get File    ${EXECDIR}/resources/fixtures/equipos.json

    #fazer que a variavel seja entendida como Json
    ${json}    Evaluate    json.loads($fixture)    json

    ${select_equipo}    Set Variable    ${json}[${equipo}]

    [return]    ${select_equipo}

Get Token From Local Storage

    ${token}    LocalStorage Get Item    user_token

    [return]    ${token}

Set Token From Local Storage

    ${TOKEN}    LocalStorage Get Item    user_token

    Set Test Variable    ${TOKEN}

Set Token Suite From Local Storage

    ${TOKEN}    LocalStorage Get Item    user_token

    Set Suite Variable    ${TOKEN}
