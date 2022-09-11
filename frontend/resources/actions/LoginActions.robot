*Settings*
Documentation    Login Actions

*Keywords*
Login With
    [Arguments]    ${email}    ${password}

    Fill Text    css=input[placeholder="Seu email"]    ${email}
    Fill Text    css=input[placeholder*="senha"]       ${password}

    Click    css=.btn-primary >> text=Entrar

Do Logout
    Click    css=.do-Logout

User Should Be Logged In
    Wait For Elements State    css=.dashboard    visible    5    Heroku Ligando
