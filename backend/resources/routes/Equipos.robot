*Settings*
Documentation       Implementation of the sessions route

Library     OperatingSystem

*Keywords*
POST Equipo
    [Arguments]     ${equipo}      ${token}

    &{headers}      Create Dictionary   user_token=${token}

    ${bin_image}    Get Binary File     ${EXECDIR}/resources/fixtures/equipos/thumbnails/${equipo}[thumb]
    &{thumbnail}    Create Dictionary   thumbnail=${bin_image}

    ${response}     POST
    ...             ${BASE_URL}/equipos
#   ...             json=${payload}
    ...             data=${equipo}[payload]
    ...             headers=${headers}
    ...             files=${thumbnail}
    ...             expected_status=any

    [return]        ${response}

GET Unique Equipo
    [Arguments]     ${token}        ${equipo_id}

    &{headers}      Create Dictionary   user_token=${token}

    ${response}     GET
    ...             ${BASE_URL}/equipos/${equipo_id}
    ...             headers=${headers}
    ...             expected_status=any

    [return]        ${response}
    
DELETE Equipo
    [Arguments]     ${token}        ${equipo_id}

    &{headers}      Create Dictionary   user_token=${token}

    ${response}     DELETE
    ...             ${BASE_URL}/equipos/${equipo_id}
    ...             headers=${headers}
    ...             expected_status=any

    [return]        ${response}

GET Equipos List
    [Arguments]     ${token}

    &{headers}      Create Dictionary   user_token=${token}

    ${response}     GET
    ...             ${BASE_URL}/equipos
    ...             headers=${headers}
    ...             expected_status=any

    [return]        ${response}
    