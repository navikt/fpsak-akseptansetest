describe('tester innlogging mot baseurl', () => {
  before(() => {
    // logger inn
    Cypress.Cookies.debug(false);
    cy.login('Z990654', Cypress.env('SAKSBEHANDLER_PASSWORD'));
  });

  beforeEach(() => {
    Cypress.Cookies.preserveOnce('sut_ID_token');
  });

  it('Sjekker hvordan Uttak ser ut...', () => {

    const uttakUtl = '/fpsak/aktoer/1482701628320';
    cy.visit(uttakUtl);
    cy.get('h2.typo-systemtittel')
      .should('contain', 'Foreldrepenger');
  });
});
