describe('Gå til førstesiden og søk opp fagsak', () => {
  before(() => {
    // logger inn
    Cypress.Cookies.debug(false);
    cy.login(Cypress.env('USERNAME'), Cypress.env('PASSWORD'));
  });

  beforeEach(() => {
    Cypress.Cookies.preserveOnce('sut_ID_token');
  });

  it('Gå til førstesiden', () => {
    const saksnummer = Cypress.env('SAKSNUMMER');
    const uttakUtl = '/fpsak/';
    cy.visit(uttakUtl);
    cy.get('h2.typo-systemtittel').should('contain', 'Foreldrepenger');
    cy.get('input#searchString').type(`${saksnummer}{enter}`);
    cy.wait(1000);
    cy.get('.knapp__spinner', {timeout: 30000}).should('not.exist');
    cy.get('.spinner', {timeout: 30000}).should('not.exist');
    cy.get('.snakkeboble__panel', {timeout: 30000}).should('exist');
    cy.screenshot('sak' + saksnummer, {capture: 'viewport'});
  });
});
