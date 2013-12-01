package com.g2b.cinema;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.scenes.scene2d.Actor;

public class Board extends Actor {
    private ShapeRenderer shapeRenderer;

    public Board() {
        shapeRenderer = new ShapeRenderer();
    }

    public void draw(SpriteBatch batch, float parentAlpha) {
        batch.end();

        shapeRenderer.setProjectionMatrix(batch.getProjectionMatrix());
        shapeRenderer.begin(ShapeRenderer.ShapeType.Filled);
        shapeRenderer.setColor(Color.WHITE);
        shapeRenderer.rect(0, 0, Cinema.WIDTH, Cinema.HEIGHT);
        shapeRenderer.end();

        batch.begin();
    }
}
