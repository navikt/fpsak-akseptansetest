describe('tester innlogging mot baseurl', () => {
  before(() => {
    // logger inn
    Cypress.Cookies.debug(false);
    cy.login(Cypress.env('USERNAME'), Cypress.env('PASSWORD'));
  });

  beforeEach(() => {
    Cypress.Cookies.preserveOnce('sut_ID_token');
  });

  it('Lager en sak og kjører den igjennom', () => {
    const uttakUtl = '/fpsak/';
    cy.visit(uttakUtl);
    cy.request('http://localhost:8060/api/cases/aksjonspunktStoppFoedsel').
        then((res) => {
              const saksnummer = res.body;
              cy.get('h2.typo-systemtittel').should('contain', 'Foreldrepenger');
              cy.get('input#searchString').type(`${saksnummer}{enter}`);
              cy.wait(1000);
              cy.get('.knapp__spinner', {timeout: 30000}).should('not.exist');
              cy.get('.spinner', {timeout: 30000}).should('not.exist');
              cy.get('.snakkeboble__panel', {timeout: 30000}).should('exist');
              cy.url().should('include', 'fakta=foedselsvilkaaret');
              cy.contains('Dokumentasjon foreligger').should('exist').click();
              cy.get('#antallBarnFodt').type("1");
              cy.get('input[placeholder="dd.mm.åååå"]').
                  type("12.02.2019");
              cy.get('#begrunnelse').type('Manglet i testgrunnlaget... :-/');
              cy.contains('Bekreft og fortsett').click();
            },
        );
  });
});
