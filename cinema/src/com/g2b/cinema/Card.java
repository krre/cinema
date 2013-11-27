package com.g2b.cinema;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;

public class Card extends Actor {

    public Card() {
        setWidth(Assets.card.getRegionWidth());
        setHeight(Assets.card.getRegionHeight());
        setBounds(100, 700, getWidth(), getHeight());

        addListener(new InputListener() {
            public boolean touchDown(InputEvent event, float x, float y, int pointer, int button) {
                Gdx.app.log("Cinema", "down");
                return true;
            }

            public void touchUp(InputEvent event, float x, float y, int pointer, int button) {
                Gdx.app.log("Cinema", "up");
            }
        });
    }

    @Override
    public void draw(SpriteBatch batch, float parentAlpha) {
        batch.draw(Assets.card, 100, 700);
    }
}
