package com.g2b.cinema;

import com.badlogic.gdx.Game;

public class Cinema extends Game {
    public static final int WIDTH = 720;
    public static final int HEIGHT = 1280;
    private PhaseScreen phaseScreen;

    @Override
    public void create() {
        Assets.load();
        phaseScreen = new PhaseScreen();
        setScreen(phaseScreen);
    }

    @Override
    public void dispose() {
        Assets.dispose();
        phaseScreen.dispose();
    }
}
