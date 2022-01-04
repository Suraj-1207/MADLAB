package com.example.ex7;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;



public class MainActivity extends AppCompatActivity {
    // Declare the View object references
    Button btnSave, btnLoad;
    EditText content, filenamev;
    TextView tvLoad;
    // Define some String variables, initialized with empty string

    String filepath = "";
    String filename = "";
    String fileContent = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btnSave = findViewById(R.id.writebtn);
        btnLoad = findViewById(R.id.btnLoad);
        content = findViewById(R.id.content);
        filenamev = findViewById(R.id.filename);
        filepath = "NewDirectory";

        /*if(!isExternalStorageAvailableForRW()){
            btnSave.setEnabled(false);
        }

         */

        btnSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                fileContent = content.getText().toString().trim();
                filename = filenamev.getText().toString().trim();

                // Check for Storage Permission
                if(isStoragePermissionGranted()){

                    if(!fileContent.equals("")){
                        File myExternalFile = new File(getExternalFilesDir(filepath), filename);
                        FileOutputStream fos = null;
                        try {
                            fos = new FileOutputStream(myExternalFile);
                            fos.write(fileContent.getBytes());
                            fos.close();
                        } catch (FileNotFoundException e) {
                            e.printStackTrace();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }

                        content.setText("");
                        filenamev.setText("");
                        // Show a Toast message to inform the user that the operation has been successfully completed.
                        Toast.makeText(MainActivity.this, "File saved to SD card.", Toast.LENGTH_SHORT).show();
                    } else{
                        // If the Text field is empty show corresponding Toast message
                        Toast.makeText(MainActivity.this, "Text field can not be empty.", Toast.LENGTH_SHORT).show();
                    }
                }

            }
        });

        btnLoad.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent myIntent = new Intent(MainActivity.this, ReadFile.class);
                MainActivity.this.startActivity(myIntent);
            }
        });
    }

    public boolean isStoragePermissionGranted() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (checkSelfPermission(android.Manifest.permission.WRITE_EXTERNAL_STORAGE)
                    == PackageManager.PERMISSION_GRANTED) {
                //Permission is granted
                return true;
            } else {
                //Permission is revoked
                ActivityCompat.requestPermissions(this, new String[]{android.Manifest.permission.WRITE_EXTERNAL_STORAGE}, 1);
                return false;
            }
        }
        else {
            //permission is automatically granted on sdk<23 upon installation
            //Permission is granted
            return true;
        }
    }

    private boolean isExternalStorageAvailableForRW() {
        // Check if the external storage is available for read and write by calling
        // Environment.getExternalStorageState() method. If the returned state is MEDIA_MOUNTED,
        // then you can read and write files. So, return true in that case, otherwise, false.
        String extStorageState = Environment.getExternalStorageState();
        if(extStorageState.equals(Environment.MEDIA_MOUNTED)){
            return true;
        }
        return false;
    }
}