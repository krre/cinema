package com.g2b.cinema;

import com.badlogic.gdx.ApplicationListener;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes.Usage;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;

public class Cinema implements ApplicationListener {
    private static final int VIRTUAL_WIDTH = 480;
    private static final int VIRTUAL_HEIGHT = 800;
    private static final float ASPECT_RATIO = (float) VIRTUAL_WIDTH / (float) VIRTUAL_HEIGHT;
    private Camera camera;
    private Rectangle viewport;
    private SpriteBatch sb;
    private Mesh screenQuad;
    private Mesh quad;

    @Override
    public void create() {
        sb = new SpriteBatch();
        camera = new OrthographicCamera(VIRTUAL_WIDTH, VIRTUAL_HEIGHT);

        screenQuad = new Mesh(true, 4, 4,
                new VertexAttribute(Usage.Position, 3, "attr_position"),
                new VertexAttribute(Usage.ColorPacked, 4, "attr_color"));

        float[] vertX = new float[]{-(float) VIRTUAL_WIDTH / 2f, (float) VIRTUAL_WIDTH / 2f};
        float[] vertY = new float[]{-(float) VIRTUAL_HEIGHT / 2f, (float) VIRTUAL_HEIGHT / 2f};
        screenQuad.setVertices(new float[]{
                vertX[0], vertY[0], 0f, Color.toFloatBits(0, 128, 0, 255),
                vertX[1], vertY[0], 0f, Color.toFloatBits(0, 192, 0, 255),
                vertX[0], vertY[1], 0f, Color.toFloatBits(0, 192, 0, 255),
                vertX[1], vertY[1], 0f, Color.toFloatBits(0, 255, 0, 255)
        });
        screenQuad.setIndices(new short[]{0, 1, 2, 3});

        quad = new Mesh(true, 4, 4,
                new VertexAttribute(Usage.Position, 3, "attr_position"),
                new VertexAttribute(Usage.ColorPacked, 4, "attr_color"));
        vertX = new float[]{-40f, 40f};
        vertY = new float[]{-40f, 40f};
        quad.setVertices(new float[]{
                vertX[0], vertY[0], 0f, Color.toFloatBits(255, 0, 0, 255),
                vertX[1], vertY[0], 0f, Color.toFloatBits(192, 0, 0, 255),
                vertX[0], vertY[1], 0f, Color.toFloatBits(192, 0, 0, 255),
                vertX[1], vertY[1], 0f, Color.toFloatBits(128, 0, 0, 255)
        });
        quad.setIndices(new short[]{0, 1, 2, 3});

    }

    @Override
    public void render() {
        // update camera
        camera.update();
        camera.apply(Gdx.gl10);

        // set viewport
        Gdx.gl.glViewport((int) viewport.x, (int) viewport.y,
                (int) viewport.width, (int) viewport.height);

        // clear previous frame
        Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);

        screenQuad.render(GL20.GL_TRIANGLE_STRIP, 0, 4);
        quad.render(GL20.GL_TRIANGLE_STRIP, 0, 4);
    }

    @Override
    public void resize(int width, int height) {
        // calculate new viewport
        float aspectRatio = (float) width / (float) height;
        float scale = 1f;
        Vector2 crop = new Vector2(0f, 0f);

        if (aspectRatio > ASPECT_RATIO) {
            scale = (float) height / (float) VIRTUAL_HEIGHT;
            crop.x = (width - VIRTUAL_WIDTH * scale) / 2f;
        } else if (aspectRatio < ASPECT_RATIO) {
            scale = (float) width / (float) VIRTUAL_WIDTH;
            crop.y = (height - VIRTUAL_HEIGHT * scale) / 2f;
        } else {
            scale = (float) width / (float) VIRTUAL_WIDTH;
        }

        float w = (float) VIRTUAL_WIDTH * scale;
        float h = (float) VIRTUAL_HEIGHT * scale;
        viewport = new Rectangle(crop.x, crop.y, w, h);
    }

    @Override
    public void resume() {
    }

    @Override
    public void dispose() {
    }

    @Override
    public void pause() {
    }


}
