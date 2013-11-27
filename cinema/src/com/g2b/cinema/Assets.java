package com.g2b.cinema;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;

public class Assets {
    public static TextureAtlas atlas;
    public static TextureRegion board;
    public static TextureRegion dice;

    public static void load() {
        atlas = new TextureAtlas(Gdx.files.internal("images.atlas"));
        board = atlas.findRegion("phase-screen");
        dice = atlas.findRegion("dice");
    }

    public static void dispose() {
        atlas.dispose();
    }
}
