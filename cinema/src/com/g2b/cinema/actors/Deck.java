package com.g2b.cinema.actors;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.scenes.scene2d.Actor;

public class Deck extends Actor {
    private ShapeRenderer shapeRenderer;
    private BitmapFont bitmapFont;

    public Deck(float x, float y) {
        shapeRenderer = new ShapeRenderer();

        bitmapFont = new BitmapFont();
        bitmapFont.setScale(2f);
        bitmapFont.setColor(0.0f, 0.0f, 0.0f, 1.0f);
        bitmapFont.getRegion().getTexture().setFilter(Texture.TextureFilter.Linear, Texture.TextureFilter.Linear);

        setPosition(x, y);
        setSize(197, 336);
    }

    @Override
    public void draw(SpriteBatch batch, float parentAlpha) {
        batch.end();

        shapeRenderer.setProjectionMatrix(batch.getProjectionMatrix());
        shapeRenderer.begin(ShapeRenderer.ShapeType.Filled);
        shapeRenderer.setColor(Color.LIGHT_GRAY);
        shapeRenderer.rect(getX(), getY(), getWidth(), getHeight());
        shapeRenderer.end();

        shapeRenderer.begin(ShapeRenderer.ShapeType.Line);
        shapeRenderer.setColor(Color.BLACK);
        shapeRenderer.rect(getX() , getY(), getWidth(), getHeight());
        shapeRenderer.end();

        batch.begin();

        bitmapFont.draw(batch, "Genre", 50, 900);

    }
}
