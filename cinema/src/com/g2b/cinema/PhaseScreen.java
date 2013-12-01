package com.g2b.cinema;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Screen;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.input.GestureDetector;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.ui.Table;
import com.g2b.cinema.actors.ActionButton;
import com.g2b.cinema.actors.Board;
import com.g2b.cinema.actors.Card;
import com.g2b.cinema.actors.Deck;
import com.g2b.cinema.actors.Description;
import com.g2b.cinema.actors.Fortune;
import com.g2b.cinema.actors.GamerHand;
import com.g2b.cinema.actors.OpponentAvatar;
import com.g2b.cinema.actors.Slot;
import com.g2b.cinema.actors.Tool;
import com.g2b.cinema.actors.UserAvatar;

public class PhaseScreen implements Screen, GestureDetector.GestureListener {
    private Stage stage;
    private GamerHand gamerHand;

    public PhaseScreen() {
        stage = new Stage();
        Gdx.input.setInputProcessor(stage);

        stage.addActor(new Board());

        stage.addActor(new OpponentAvatar(11, 1128));
        stage.addActor(new OpponentAvatar(165, 1128));
        stage.addActor(new OpponentAvatar(327, 1128));
        stage.addActor(new UserAvatar(484, 1018));

        stage.addActor(new ActionButton(565, 853));
        stage.addActor(new ActionButton(565, 674));
        stage.addActor(new ActionButton(565, 489));

        stage.addActor(new Deck(9, 683));

        stage.addActor(new Card(232, 854));
        stage.addActor(new Card(335, 854));
        stage.addActor(new Card(439, 854));

        stage.addActor(new Card(232, 686));
        stage.addActor(new Card(335, 686));
        stage.addActor(new Card(439, 686));

        stage.addActor(new Description());

        gamerHand = new GamerHand();
        stage.addActor(gamerHand);

        stage.addActor(new Slot(5, 214));
        stage.addActor(new Slot(126, 214));
        stage.addActor(new Slot(245, 214));
        stage.addActor(new Slot(366, 214));
        stage.addActor(new Slot(485, 214));

        stage.addActor(new Slot(5, 6));
        stage.addActor(new Slot(126, 6));
        stage.addActor(new Slot(245, 6));
        stage.addActor(new Slot(366, 6));
        stage.addActor(new Slot(485, 6));

        stage.addActor(new Tool(615, 327));
        stage.addActor(new Tool(615, 208));
        stage.addActor(new Fortune(615, 6));


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
