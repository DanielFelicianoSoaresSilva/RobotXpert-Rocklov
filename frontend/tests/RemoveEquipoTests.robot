*Settings*
Documentation    Remove Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Run Keywords    Login Session                         jimmy@hotmail.com    pwd123
...              AND             Set Token Suite From Local Storage
Test Teardown    Finish Test

*Test Cases*
Remove Equipo
    [Tags]    rm_equipo

    ${equipo}              Get Equipo         saxofone
    #${Token}               Get Token From Local Storage
    #Set Token From Local Storage
    Remove Equipo          ${equipo}[name]
    POST Equipo Service    ${equipo}          ${TOKEN}
    Reload

    Request Removal    ${equipo}[name]
    Confirm Removal

    Equipo Should Not Be Visible    ${equipo}[name]

Removal Give Up
    [Tags]    rm_equipo

    ${equipo}              Get Equipo         conga
    Remove Equipo          ${equipo}[name]
    POST Equipo Service    ${equipo}          ${TOKEN}
    Reload

    Request Removal    ${equipo}[name]
    Cancel Removal

    Equipo Should Be Visible    ${equipo}[name]
