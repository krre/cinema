package com.g2b.cinema.actors;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.g2b.cinema.Cinema;

public class GamerHand extends Actor {
    private ShapeRenderer shapeRenderer;

    public GamerHand() {
        shapeRenderer = new ShapeRenderer();

        setPosition(0, 0);
        setSize(Cinema.WIDTH, 450);
    }

    @Override
    public void draw(SpriteBatch batch, float parentAlpha) {
        batch.end();

        shapeRenderer.setProjectionMatrix(batch.getProjectionMatrix());
        shapeRenderer.begin(ShapeRenderer.ShapeType.Filled);
        shapeRenderer.setColor(0.46f, 0.45f, 0.6f, 1);
        shapeRenderer.rect(getX(), getY(), getWidth(), getHeight());
        shapeRenderer.end();

        batch.begin();
    }
}
