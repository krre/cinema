package com.g2b.thegame;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class ProducerActivity extends Activity implements OnClickListener {

    Button nextBtn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.producer);

        nextBtn = (Button) findViewById(R.id.next_button);
        nextBtn.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.next_button:
                Intent gameIntent = new Intent(this, GameActivity.class);
                startActivity(gameIntent);
            default:
                break;
        }
    }
}
