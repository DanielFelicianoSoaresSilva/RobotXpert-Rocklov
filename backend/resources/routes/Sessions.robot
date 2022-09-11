*Settings*
Documentation       Implementation of the sessions route

*Keywords*
POST Login
    [Arguments]     ${payload}

    ${response}     POST
    ...             ${BASE_URL}/sessions
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}
    