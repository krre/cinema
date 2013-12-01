package com.g2b.cinema;

import com.badlogic.gdx.tools.imagepacker.TexturePacker2;

public class TexturePack {
    public static void main(String[] args) {
        TexturePacker2.Settings settings = new TexturePacker2.Settings();
        settings.maxWidth = 1024;
        settings.maxHeight = 2048;
        TexturePacker2.process(settings, "images/common", "cinema-android/assets", "common");
    }

}
