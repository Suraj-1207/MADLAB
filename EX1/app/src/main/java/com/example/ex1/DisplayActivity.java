package com.example.ex1;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

public class DisplayActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display);

        Bundle extras = getIntent().getExtras();
        String name,address,age,dob,time,phone,addict,gender,status;
        name = extras.getString("com.example.EX1.name");
        address = extras.getString("com.example.EX1.address");
        age = extras.getString("com.example.EX1.age");
        dob = extras.getString("com.example.EX1.dob");
        time = extras.getString("com.example.EX1.time");
        phone = extras.getString("com.example.EX1.phone");
        addict = extras.getString("com.example.EX1.addict");
        gender = extras.getString("com.example.EX1.gender");
        status = extras.getString("com.example.EX1.status");

        TextView nameText = findViewById(R.id.Name);
        TextView addressText = findViewById(R.id.Address);
        TextView ageText = findViewById(R.id.Age);
        TextView dobText = findViewById(R.id.DOB);
        TextView genderText = findViewById(R.id.Gender);
        TextView statusText = findViewById(R.id.Status);
        TextView timeText = findViewById(R.id.Time);
        TextView addictText = findViewById(R.id.Addict);
        TextView phoneText = findViewById(R.id.Phone);

        nameText.setText(name);
        addressText.setText(address);
        ageText.setText(age);
        dobText.setText(dob);
        genderText.setText(gender);
        statusText.setText(status);
        timeText.setText(time);
        addictText.setText(addict);
        phoneText.setText(phone);

    }
}