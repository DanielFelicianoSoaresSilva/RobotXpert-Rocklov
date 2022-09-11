*Settings*
Documentation       Seeds

Resource        ${EXECDIR}/resources/Base.robot

Suite Setup     Create Users

*Keywords*
Create Users

    ${users}        Get Json  signup  user_seeds.json

    FOR     ${user}    IN      @{users}
        POST User  ${user}
    END
