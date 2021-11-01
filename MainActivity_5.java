package com.example.test_modelpracs_2;

import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.Random;

public class MainActivity extends AppCompatActivity {

    public Button startButton, resetButton, leftButton, rightButton;
    public ImageView contentImage;
    public TextView tv;
    public final Handler ha = new Handler();
    public Paint paint;
    public Canvas canvas;
    public Bitmap bitmap;
    public int cnt;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        tv = findViewById(R.id.textView2);
        contentImage = findViewById(R.id.contentImageView);
        startButton = findViewById(R.id.startButton);
        resetButton = findViewById(R.id.resetButton);
        leftButton = findViewById(R.id.leftButton);
        rightButton = findViewById(R.id.rightButton);

        bitmap = Bitmap.createBitmap(1000,1000, Bitmap.Config.ARGB_8888);
        contentImage.setImageBitmap(bitmap);
        canvas = new Canvas(bitmap);
        paint = new Paint();
        paint.setTextSize(200);
        cnt = 0;

        startButton.setOnClickListener(new View.OnClickListener(){
            public void onClick(View v){
                runnable.run();
            }
        });

        resetButton.setOnClickListener(new View.OnClickListener(){
            public void onClick(View v){
                cnt = 0;
                canvas.drawColor(Color.WHITE);
                ha.removeCallbacksAndMessages(null);
                tv.setText(Integer.toString(cnt) + "th iteration ");
            }
        });

        leftButton.setOnClickListener(new View.OnClickListener(){
            public void onClick(View v){
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            contentImage.animate().translationXBy(-300).setDuration(600);
                        }
                        catch (Exception e) {
                            e.printStackTrace();
                        }
                        finally {
                            //alertDialog.dismiss();
                        }
                    }
                }).start();

            }
        });

        rightButton.setOnClickListener(new View.OnClickListener(){
            public void onClick(View v){
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            contentImage.animate().translationXBy(300).setDuration(600);
                        }
                        catch (Exception e) {
                            e.printStackTrace();
                        }
                        finally {
                            //alertDialog.dismiss();
                        }
                    }
                }).start();

            }
        });
    }

    public int getRandomColor(){
        Random rnd = new Random();
        return Color.argb(255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256));
    }

    public String getRandomText(){
        String name[] = {"abc","def","ghj","abc","def","ghj"};
        Random rnd = new Random();
        int index = rnd.nextInt(name.length - 0) + 0;
        return name[index];
    }

    Runnable runnable = new Runnable() {
        @Override
        public void run() {
            try {
                doTask();
            }catch (Exception e){
                e.printStackTrace();
            } finally {
                ha.postDelayed(runnable, 100);
            }
        }
    };

    public void doTask() {
        canvas.drawColor(getRandomColor());
        tv.setText(Integer.toString(cnt) + "th iteration ");
        int rndColor = getRandomColor();
        int myTag = Log.d("myTag", String.valueOf(rndColor));
        paint.setColor(rndColor);
        canvas.drawText(getRandomText(), 300, 300, paint);
        cnt++;
    }
}