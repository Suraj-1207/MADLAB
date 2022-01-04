package com.example.ex7;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class ReadFile extends AppCompatActivity {
    Button  btnLoad;
    TextView tvLoad;
    EditText filenamev;
    String filename = "";
    String filepath = "NewDirectory";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_read_file);

        btnLoad = findViewById(R.id.loadbtn);
        filenamev = findViewById(R.id.filename2);
        tvLoad = findViewById(R.id.tvLoad);

        btnLoad.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                filename = filenamev.getText().toString().trim();

                FileReader fr = null;
                File myExternalFile = new File(getExternalFilesDir(filepath), filename);
                StringBuilder stringBuilder = new StringBuilder();

                try {
                    fr = new FileReader(myExternalFile);
                    BufferedReader br = new BufferedReader(fr);
                    String line = br.readLine();

                    while(line != null){
                        stringBuilder.append(line).append('\n');
                        line = br.readLine();
                    }
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    String fileContents = stringBuilder.toString();
                    tvLoad.setText(fileContents);
                }
            }
        });
    }
}