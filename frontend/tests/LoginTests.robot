*Settings*
Documentation    Login Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Start Session
Test Teardown    Finish Test

*Test Cases*
User Login

    Login With                  rogers@shield.com             pwd123
    User Should Be Logged In
    [Teardown]                  Take Screenshot and Logout

Incorrect Password
    [Tags]    attempt_login

    Login With              rogers@shield.com                abc123
    Alert Text Should Be    Usuário e/ou senha inválidos.

User Not Found
    [Tags]    attempt_login

    Login With              404@shield.com                   pwd123
    Alert Text Should Be    Usuário e/ou senha inválidos.

Empty Email
    [Tags]    attempt_login

    Login With              ${EMPTY}                          pwd123
    Alert Text Should Be    Oops. Informe um email válido!

Empty Password
    [Tags]    attempt_login

    Login With              rogers@shield.com                   ${EMPTY}
    Alert Text Should Be    Oops. Informe sua senha secreta!

Incorrect Email
    [Tags]    attempt_login

    Login With              rogers&shield.com                 pwd123
    Alert Text Should Be    Oops. Informe um email válido!
