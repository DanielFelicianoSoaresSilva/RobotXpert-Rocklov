*Settings*
Documentation    Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Login Session    eddi@van.com    pwd123
Test Teardown    Finish Test

*Test Cases*
Add new Equipo

    ${equipo}        Get Equipo         violao
    Remove Equipo    ${equipo}[name]

    Go To Equipo Form
    Fill Equipo Form            ${equipo}
    Submit Equipo Form
    Equipo Should Be Visible    ${equipo}[name]

Duplicated Equipo
    [Tags]    dup_equipo

    ${equipo}              Get Equipo           fender
    Set Token From Local Storage
    POST Equipo Service    ${equipo}            ${TOKEN}

    Go To Equipo Form
    Fill Equipo Form        ${equipo}
    Submit Equipo Form
    Alert Text Should Be    Anúncio já existe :/

    [Teardown]    Take Screenshot And Go Back

Required Fields
    [tags]    required

    @{expected_alerts}    Create List                          
    ...                   Adicione uma foto no seu anúncio.
    ...                   Informe a descrição do anúncio.
    ...                   Escolha uma categoria.
    ...                   Informe o valor da diária.

    @{got_alerts}    Create List

    Go To Equipo Form
    Submit Equipo Form

    FOR               ${position}                     IN RANGE       1    5
    ${text}           Get Text For Required Alerts    ${position}
    Append To List    ${got_alerts}                   ${text}
    END

    # Alert Form Should Be    Adicione uma foto no seu anúncio.
    # Alert Form Should Be    Informe a descrição do anúncio.
    # Alert Form Should Be    Selecione uma categoria.
    # Alert Form Should Be    Informe o valor da diária.
