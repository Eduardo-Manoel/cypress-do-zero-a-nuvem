const longtext = Cypress._.repeat('Teste,', 100)
Cypress.Commands.add('fillMandatoryFieldsAndSubmit', (data = {
    firstName: 'Eduardo',
    lastName: 'Maanoel',
    email: 'eduardomanoelnn@yahoo.com.br',
    text: longtext
}) => {
    cy.get('#firstName')
        .type(data.firstName)
    cy.get('#lastName')
        .type(data.lastName)
    cy.get('#email')
        .type(data.email)
    cy.get('#open-text-area')
        .type(data.text, { delay: 0 })
    cy.contains('button', 'Enviar')
        .click()
})