import Toybox.WatchUi;

class TestIqMenu2View extends WatchUi.View {

    public function initialize() {
        View.initialize();
    }

    public function onShow(){
        var menu = new WatchUi.Menu2({:title=>"Menu2"});
        var delegate;
        // Add menu items for demonstrating toggles, checkbox and icon menu items
        menu.addItem(new WatchUi.MenuItem("Percorsi", "sublabel", "toggle", null));
        menu.addItem(new WatchUi.MenuItem("Segmenti", null, "check", null));
        menu.addItem(new WatchUi.MenuItem("Dati", null, "icon", null));
        menu.addItem(new WatchUi.MenuItem("Impostazioni", null, "custom", null));
        WatchUi.pushView(menu, new $.Menu2TestMenu2Delegate(), WatchUi.SLIDE_UP);
        return true;
    }
}
