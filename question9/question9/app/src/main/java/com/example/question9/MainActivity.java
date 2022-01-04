package com.example.question9;

import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import  java.util.Random;
public class MainActivity extends AppCompatActivity {

    TextView tv;
    Button btnStart, btnStop, btnMove;
    int dir=0; //0 - up, 1 - down
    ImageView iv;
    Handler handler = new Handler();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        tv = findViewById(R.id.textView);
        btnMove = findViewById(R.id.buttonMove);
        btnStart = findViewById(R.id.buttonStart);
        btnStop = findViewById(R.id.buttonStop);
        iv = findViewById(R.id.imageView);
        String x = String.valueOf(iv.getX());
        String y = String.valueOf(iv.getY());

        tv.setText("X: "+x+ ", Y: "+y);

        btnStart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                runnable.run();
            }
        });

        btnStop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                handler.removeCallbacks(runnable);
            }
        });

        btnMove.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try{
                            if(dir==0){
                                iv.animate().translationYBy(-50f).setDuration(1000);
                                dir=1;
                            }
                            else{
                                iv.animate().translationYBy(50f).setDuration(1000);
                                dir=0;
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        finally {
                            String x = String.valueOf(iv.getX());
                            String y = String.valueOf(iv.getY());

                            tv.setText("X: "+x+ ", Y: "+y);
                        }
                    }
                }).run(); ;
            }
        });
    }

    Runnable runnable = new Runnable() {
        @Override
        public void run() {
            iv = findViewById(R.id.imageView);
            Random random = new Random();
            try{
                iv.setBackgroundColor(Color.argb(255, random.nextInt(256),random.nextInt(256),random.nextInt(256)));
            } catch (Exception e) {
                e.printStackTrace();
            }
            finally {
                handler.postDelayed(runnable,500);
            }
        }
    };
}