import Toybox.WatchUi;

class TestIqMenu2View extends WatchUi.View {

    public function initialize() {
        View.initialize();
    }

    public function onShow(){
        var menu = new WatchUi.Menu2({:title=>"Menu2"});
        var delegate;
        // Add menu items for demonstrating toggles, checkbox and icon menu items
        // menu.addItem(new WatchUi.MenuItem("Percorsi", "sublabel", "toggle", null));
        menu.addItem(new $.CustomImagesItemWhip(:bear, "Percorsi", WatchUi.loadResource($.Rez.Drawables.bear) as BitmapResource));
        menu.addItem(new WatchUi.MenuItem("Segmenti", null, "check", null));
        menu.addItem(new WatchUi.MenuItem("Dati", null, "icon", null));
        menu.addItem(new WatchUi.MenuItem("Impostazioni", null, "custom", null));
        WatchUi.pushView(menu, new $.Menu2TestMenu2Delegate(), WatchUi.SLIDE_UP);
        return true;
    }
}

class CustomImagesItemWhip extends WatchUi.CustomMenuItem {

    private var _label as String;
    private var _bitmap as BitmapResource;
    private var _bitmapOffset as Number;

    public function initialize(id as Symbol, label as String, bitmap as BitmapResource) {
        CustomMenuItem.initialize(id, {});
        _label = label;
        _bitmap = bitmap;
        _bitmapOffset = 0 - bitmap.getWidth() / 2;
    }

    public function draw(dc as Dc) as Void {
        var font = Graphics.FONT_SMALL;
        var bmXY = dc.getHeight() / 2 + _bitmapOffset;
        if (isFocused()) {
            font = Graphics.FONT_LARGE;
        }

        if (isSelected()) {
            dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
            dc.clear();
        }

        dc.drawBitmap(bmXY, bmXY, _bitmap);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getHeight(), dc.getHeight() / 2, font, _label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}
