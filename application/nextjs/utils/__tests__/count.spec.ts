import { count } from '../count';

describe('count', () => {
    it('works', () => {
        const fin = count(1, 1);
        expect(fin).toBe(2);
    });
});
