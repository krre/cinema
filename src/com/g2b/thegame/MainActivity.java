package com.g2b.thegame;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class MainActivity extends Activity implements OnClickListener {

    Button producerBtn;
    Button gameBtn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        gameBtn = (Button) findViewById(R.id.game_button);
        gameBtn.setOnClickListener(this);
        producerBtn = (Button) findViewById(R.id.producer_button);
        producerBtn.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.producer_button:
                Intent producerIntent = new Intent(this, ProducerActivity.class);
                startActivity(producerIntent);
                break;
            case R.id.game_button:
                Intent gameIntent = new Intent(this, GameActivity.class);
                startActivity(gameIntent);
            default:
                break;
        }
    }
}
