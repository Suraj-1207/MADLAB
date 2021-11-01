package com.example.sdc;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

public class MainActivity extends AppCompatActivity {


    EditText file, name;
    Button write, read;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        file = findViewById(R.id.file);
        name = findViewById(R.id.name);
        write = findViewById(R.id.write);
        read = findViewById(R.id.read);

        write.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(isPermissionGranted()){
                    File f = new File(getExternalFilesDir("NewDirectory"), name.getText().toString());
                    try {
                        FileOutputStream fout = new FileOutputStream(f);
                        fout.write(file.getText().toString().getBytes());
                        fout.close();
                        Toast.makeText(MainActivity.this, "File written successfully", Toast.LENGTH_SHORT).show();
                        name.setText("");
                        file.setText("");
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        });

        read.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (isPermissionGranted()) {
                    File f = new File(getExternalFilesDir("NewDirectory"), name.getText().toString());
                    try{
                        Scanner s = new Scanner(f);
                        s.useDelimiter("\\z");
                        file.setText(s.nextLine());
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                    }
                }
            }
        });
    }

    public boolean isPermissionGranted(){
        if(ActivityCompat.checkSelfPermission(MainActivity.this, Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED){
            return true;
        }
        else{
            requestPermissions(new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, 1);
            return false;
        }
    }
}