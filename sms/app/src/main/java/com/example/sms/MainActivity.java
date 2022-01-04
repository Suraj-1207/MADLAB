package com.example.sms;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.telephony.SmsManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import static android.Manifest.permission.READ_PHONE_STATE;
import static android.Manifest.permission.READ_SMS;
import static android.Manifest.permission.RECEIVE_SMS;
import static android.Manifest.permission.SEND_SMS;

public class MainActivity extends AppCompatActivity {

    EditText contact, msg;
    Button send;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ActivityCompat.requestPermissions(MainActivity.this, new String[]{READ_SMS, RECEIVE_SMS, SEND_SMS, READ_PHONE_STATE},1);

        contact = findViewById(R.id.editTextTextPersonName);
        msg = findViewById(R.id.editTextTextPersonName2);
        send = findViewById(R.id.button);

        send.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendMsg(contact.getText().toString(), msg.getText().toString());
    }
});

}

        void sendMsg(String contact, String msg){
        PendingIntent sentPI = PendingIntent.getBroadcast(this,0, new Intent("Message Sent"),0);
        PendingIntent deliveredPI = PendingIntent.getBroadcast(this, 0, new Intent("Message Delivered"),0);
        SmsManager smsManager = SmsManager.getDefault();
        smsManager.sendTextMessage(contact,null, msg, sentPI, deliveredPI);
        Toast.makeText(getApplicationContext(), "Message Sent", Toast.LENGTH_SHORT).show();
        }

        }
