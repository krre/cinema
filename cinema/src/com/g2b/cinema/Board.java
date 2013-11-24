package com.g2b.cinema;

import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.scenes.scene2d.Actor;

public class Board extends Actor {

    public Board() {
    }

    public void draw(SpriteBatch batch, float parentAlpha) {
        batch.draw(Assets.board, 0, 0);
    }
}
