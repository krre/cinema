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


        //stage.addActor(new Dice());
        //stage.addActor(new Card());

        Image sourceImage = new Image(Assets.card);
        sourceImage.setBounds(50, 325, 100, 100);
        stage.addActor(sourceImage);

        Image validTargetImage = new Image(Assets.card);
        validTargetImage.setBounds(200, 250, 100, 100);
        stage.addActor(validTargetImage);

        Image invalidTargetImage = new Image(Assets.card);
        invalidTargetImage.setBounds(200, 400, 100, 100);
        stage.addActor(invalidTargetImage);

        DragAndDrop dragAndDrop = new DragAndDrop();
        dragAndDrop.addSource(new DragAndDrop.Source(sourceImage) {
            public DragAndDrop.Payload dragStart (InputEvent event, float x, float y, int pointer) {
                DragAndDrop.Payload payload = new DragAndDrop.Payload();
                payload.setObject("Some payload!");


                payload.setDragActor(new Image(Assets.card));

                Image validImage = new Image(Assets.card);
                validImage.setColor(0, 1, 0, 1);
                payload.setValidDragActor(validImage);

                Image invalidImage = new Image(Assets.card);
                invalidImage.setColor(1, 0, 0, 1);
                payload.setInvalidDragActor(invalidImage);


                return payload;
            }
        });
        dragAndDrop.addTarget(new DragAndDrop.Target(validTargetImage) {
            public boolean drag (DragAndDrop.Source source, DragAndDrop.Payload payload, float x, float y, int pointer) {
                getActor().setColor(Color.GREEN);
                return true;
            }

            public void reset (DragAndDrop.Source source, DragAndDrop.Payload payload) {
                getActor().setColor(Color.WHITE);
            }

            public void drop (DragAndDrop.Source source, DragAndDrop.Payload payload, float x, float y, int pointer) {
                System.out.println("Accepted: " + payload.getObject() + " " + x + ", " + y);
            }
        });
        dragAndDrop.addTarget(new DragAndDrop.Target(invalidTargetImage) {
            public boolean drag (DragAndDrop.Source source, DragAndDrop.Payload payload, float x, float y, int pointer) {
                getActor().setColor(Color.RED);
                return false;
            }

            public void reset (DragAndDrop.Source source, DragAndDrop.Payload payload) {
                getActor().setColor(Color.WHITE);
            }

            public void drop (DragAndDrop.Source source, DragAndDrop.Payload payload, float x, float y, int pointer) {
            }
        });
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
        //Gdx.input.setInputProcessor(new GestureDetector(this));
    }

    @Override
    public void hide() {
        //Gdx.input.setInputProcessor(null);
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
