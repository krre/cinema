package com.g2b.thegame;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class GameActivity extends Activity implements OnClickListener {

    Button backBtn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.game);

        backBtn = (Button) findViewById(R.id.back_button);
        backBtn.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.back_button:
                Intent mainIntent = new Intent(this, MainActivity.class);
                startActivity(mainIntent);
                break;
        }
    }
}
