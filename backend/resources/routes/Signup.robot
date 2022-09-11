*Settings*
Documentation       Implementation of the signup route

*Keywords*
POST User
    [Arguments]     ${payload}

    ${response}     POST
    ...             ${BASE_URL}/signup
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}