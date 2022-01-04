package com.example.ex1;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Spinner;


public class MainActivity extends AppCompatActivity {

    EditText name,address,age,dob,phone,time;
    CheckBox smoking,alcohol;
    Spinner marital;
    String addict,gender,status;
    RadioButton male,female;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        marital=findViewById(R.id.spinner);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,R.array.maritaloptions, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        marital.setAdapter(adapter);
    }
    public void onSubmit(View v) {
        name=findViewById(R.id.Name);
        address=findViewById(R.id.Address);
        age=findViewById(R.id.Age);
        dob=findViewById(R.id.DOB);
        marital=findViewById(R.id.spinner);
        time=findViewById(R.id.Time);
        phone=findViewById(R.id.Phone);
        smoking=findViewById(R.id.Smoking);
        alcohol=findViewById(R.id.Alcohol);
        if(smoking.isChecked() && alcohol.isChecked())
            addict="Alcohol,Smoking";
        else if(smoking.isChecked())
            addict="Smoking";
        else if(alcohol.isChecked())
            addict="Alcohol";
        else
            addict="None";
        male=findViewById(R.id.Male);
        female=findViewById(R.id.Female);
        if(male.isChecked())
            gender="Male";
        else
            gender="Female";
        status=marital.getSelectedItem().toString();

        Intent intent = new Intent(this,DisplayActivity.class);
        Bundle extras = new Bundle();
        extras.putString("com.example.EX1.name",name.getText().toString());
        extras.putString("com.example.EX1.address",address.getText().toString());
        extras.putString("com.example.EX1.age",age.getText().toString());
        extras.putString("com.example.EX1.dob",dob.getText().toString());
        extras.putString("com.example.EX1.time",time.getText().toString());
        extras.putString("com.example.EX1.phone",phone.getText().toString());
        extras.putString("com.example.EX1.addict",addict);
        extras.putString("com.example.EX1.gender",gender);
        extras.putString("com.example.EX1.status",status);
        intent.putExtras(extras);
        startActivity(intent);

    }
}