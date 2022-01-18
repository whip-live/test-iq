import Toybox.WatchUi;

class TestIqMenu2View extends WatchUi.View {

    public function initialize() {
        View.initialize();
    }

    public function onShow(){
        var menu = new $.ImagesMenuWhip(80, Graphics.COLOR_BLACK);
        var delegate;
        // Add menu items for demonstrating toggles, checkbox and icon menu items
        // menu.addItem(new WatchUi.MenuItem("Percorsi", "sublabel", "toggle", null));
        menu.addItem(new $.CustomImagesItemWhip(:bear, "Percorsi", WatchUi.loadResource($.Rez.Drawables.bear) as BitmapResource));
        menu.addItem(new $.CustomImagesItemWhip(null, "Segmenti", null);
        menu.addItem(new $.CustomImagesItemWhip(null, "Dati", null);
        menu.addItem(new $.CustomImagesItemWhip(null, "Impostazioni", null);
        WatchUi.pushView(menu, new $.Menu2TestMenu2Delegate(), WatchUi.SLIDE_UP);
        return true;
    }
}

class ImagesMenuWhip extends WatchUi.CustomMenu {

    //! Constructor
    //! @param itemHeight The pixel height of menu items rendered by this menu
    //! @param backgroundColor The color for the menu background
    public function initialize(itemHeight as Number, backgroundColor as ColorType) {
        CustomMenu.initialize(itemHeight, backgroundColor, {});
    }

    //! Draw the menu title
    //! @param dc Device Context
    public function drawTitle(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_DK_GRAY);
        dc.setPenWidth(3);
        dc.drawLine(0, dc.getHeight() - 2, dc.getWidth(), dc.getHeight() - 2);
        dc.setPenWidth(1);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth() / 2, dc.getHeight() / 2, Graphics.FONT_LARGE, "Images", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}

class CustomImagesItemWhip extends WatchUi.CustomMenuItem {

    private var _label as String;
    private var _bitmap as BitmapResource;
    private var _bitmapOffset as Number;

    public function initialize(id as Symbol, label as String, bitmap as BitmapResource) {
        CustomMenuItem.initialize(id, {});
        _label = label;
        if (bitmap != null) {
            _bitmap = bitmap;
            _bitmapOffset = 0 - bitmap.getWidth() / 2;
        } else {
            _bitmapOffset = 0;
        }
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

        if (_bitmap != null) {
            dc.drawBitmap(bmXY, bmXY, _bitmap);
        }

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getHeight(), dc.getHeight() / 2, font, _label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}
