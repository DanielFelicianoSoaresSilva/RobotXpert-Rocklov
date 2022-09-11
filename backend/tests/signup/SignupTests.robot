*Settings*
Documentation       Signup Tests

Resource            ${EXECDIR}/resources/Base.robot

*Test Cases*
Add New User

    ${payload}              Get Json    signup      new_user.json

    Remove User By Email    ${payload}[email]

    # ${email}              FakerLibrary.free email

    # &{payload}            Create Dictionary
    # ...                   name=Tony Stark
    # ...                   email=${email}
    # ...                   password=pwd123

    ${response}             POST User       ${payload}
    Status Should Be        200             ${response}

Duplicated Email

    ${payload}              Get Json    signup      duplicated.json

    #aqui garante que o usuário estará ja cadstrado
    POST User               ${payload}

    ${response}             POST User       ${payload}
    Status Should Be        409             ${response}









