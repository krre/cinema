package com.g2b.cinema;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Screen;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.input.GestureDetector;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.ui.Image;
import com.badlogic.gdx.scenes.scene2d.ui.Table;
import com.badlogic.gdx.scenes.scene2d.utils.DragAndDrop;

public class PhaseScreen implements Screen, GestureDetector.GestureListener {
    private Stage stage;

    public PhaseScreen() {
        stage = new Stage();
        Gdx.input.setInputProcessor(stage);
        stage.addActor(new Board());
        stage.addActor(new Dice(565, 636, 147, 147));

    }

    @Override
    public void resize(int width, int height) {
        stage.setViewport(Cinema.WIDTH, Cinema.HEIGHT, true);
        stage.getCamera().translate(-stage.getGutterWidth(), -stage.getGutterHeight(), 0);
    }

    @Override
    public void render(float delta) {
        Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);
        stage.act(Gdx.graphics.getDeltaTime());
        stage.draw();
        Table.drawDebug(stage);
    }

    @Override
    public void show() {
    }

    @Override
    public void hide() {
    }

    @Override public boolean fling(float velocityX, float velocityY, int button) { return false; }

    @Override public void resume() {}

    @Override public void dispose() {
        stage.dispose();
    }
    @Override public void pause() {}
    @Override public boolean tap(float x, float y, int count, int button) { return false; }
    @Override public boolean touchDown(float x, float y, int pointer, int button) { return false; }
    @Override public boolean longPress(float x, float y) { return false; }
    @Override public boolean pan(float x, float y, float deltaX, float deltaY) { return false; }
    @Override public boolean panStop(float x, float y, int pointer, int button) { return false; }
    @Override public boolean zoom(float initialDistance, float distance) { return  false; }
    @Override public boolean pinch(Vector2 initialPointer1, Vector2 initialPointer2, Vector2 pointer1, Vector2 pointer2) { return false; }
}
