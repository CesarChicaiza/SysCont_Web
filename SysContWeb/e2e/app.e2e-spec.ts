import { SysContWebPage } from './app.po';

describe('sys-cont-web App', function() {
  let page: SysContWebPage;

  beforeEach(() => {
    page = new SysContWebPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
