describe('homepage', () => {
    it('shows correct title', () => {
        cy.visit('/');
        cy.title().should('eq', 'Create Next App');
    });
});
