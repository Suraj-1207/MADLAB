UI
package com.example.uiagain;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;

public class MainActivity extends AppCompatActivity {

    EditText name, age, dob;
    RadioGroup gender;
    RadioButton male, female;
    CheckBox ai, bc;
    Button submit, reset;
    Spinner year;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        name = findViewById(R.id.editTextName);
        age = findViewById(R.id.editTextAge);
        dob = findViewById(R.id.editTextDob);

        gender = findViewById(R.id.radioGroup);
        male = findViewById(R.id.radioButtonMale);
        female = findViewById(R.id.radioButtonFemale);

        ai = findViewById(R.id.checkBoxAI);
        bc = findViewById(R.id.checkBoxBC);

        submit = findViewById(R.id.buttonSubmit);
        reset = findViewById(R.id.buttonReset);

        year = findViewById(R.id.spinnerYear);

        reset.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                name.setText("");
                age.setText("");
                dob.setText("");

                gender.clearCheck();

                if(ai.isChecked()) ai.toggle();
                if(bc.isChecked()) bc.toggle();
            }
        });

        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(),DisplayActivity.class);
                intent.putExtra("name", name.getText().toString());
                int radioCh = gender.getCheckedRadioButtonId();
                RadioButton choice = findViewById(radioCh);
                intent.putExtra("gender",choice.getText().toString());
                intent.putExtra("age",age.getText().toString());
                intent.putExtra("dob", dob.getText().toString());

                String subs = "";
                if(ai.isChecked()) subs+="AI ";
                if(bc.isChecked()) subs += "Block Chain";
                intent.putExtra("subject",subs);

                intent.putExtra("year",year.getSelectedItem().toString());

                startActivity(intent);
            }
        });
    }
}

<resources>
    <string name="app_name">UIAgain</string>
    <string-array name="year">
        <item>Year 1</item>
        <item>Year 2</item>
        <item>Year 3</item>
        <item>Year 4</item>
    </string-array>
</resources>

package com.example.uiagain;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class DisplayActivity extends AppCompatActivity {

    TextView name, age, dob, gender, subject, year;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display);

        Intent intent = getIntent();

        name = findViewById(R.id.textViewName);
        age = findViewById(R.id.textViewAge);
        dob = findViewById(R.id.textViewDob);
        gender = findViewById(R.id.textViewGender);
        subject = findViewById(R.id.textViewSubject);
        year = findViewById(R.id.textViewYear);

        name.setText(intent.getStringExtra("name"));
        age.setText(intent.getStringExtra("age"));
        dob.setText(intent.getStringExtra("dob"));
        gender.setText(intent.getStringExtra("gender"));
        subject.setText(intent.getStringExtra("subject"));
        year.setText(intent.getStringExtra("year"));

    }
}

GRAPHICS
package com.example.graphics;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.BitmapDrawable;
import android.os.Build;
import android.os.Bundle;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    ImageView image;

    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        image = findViewById(R.id.imageView);

        Bitmap bitmap = Bitmap.createBitmap(400,600, Bitmap.Config.ARGB_8888);

        image.setBackgroundDrawable(new BitmapDrawable(bitmap));

        Canvas canvas = new Canvas(bitmap);

        Paint paint = new Paint();

        paint.setColor(Color.RED);
        paint.setTextSize(20);

        canvas.drawText("Line", 100, 100, paint);
        canvas.drawLine(100, 150,100, 200, paint);

        canvas.drawText("Rectangle", 300,100,paint);
        canvas.drawRect(200, 150,300,200,paint);

        canvas.drawCircle(100,300,50,paint);

        canvas.drawArc(200, 300,300,500,90,45,true,paint);
    }
}

<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <ImageView
        android:id="@+id/imageView"
        android:layout_width="0dp"
        android:layout_height="0dp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />
</androidx.constraintlayout.widget.ConstraintLayout>

Animation
package com.example.practice;

import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    ImageView iv;
    Button fw, bw, up, down, rot, zoom, fade;
    float angle = 5;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        iv = findViewById(R.id.imageView);
        fw = findViewById(R.id.button);
        bw = findViewById(R.id.button2);
        up = findViewById(R.id.button3);
        down = findViewById(R.id.button4);
        rot = findViewById(R.id.button5);
        zoom = findViewById(R.id.button6);
        fade = findViewById(R.id.button7);
        Bitmap bitmap = Bitmap.createBitmap(400,600,Bitmap.Config.ARGB_8888);

        iv.setBackgroundDrawable(new BitmapDrawable(bitmap));

        Canvas canvas = new Canvas(bitmap);
        Paint paint = new Paint();

        paint.setColor(Color.BLACK);
        paint.setTextSize(20);

        canvas.drawLine(30,180,30,250,paint);
        canvas.drawLine(30,180,270,180,paint);
        canvas.drawLine(270,180,270,250,paint);
        canvas.drawLine(30,250,270,250,paint);
        canvas.drawLine(100,130,200,130,paint);
        canvas.drawLine(200,130,200,180,paint);
        canvas.drawLine(200,180,100,180,paint);
        canvas.drawLine(100,180,100,130,paint);
        canvas.drawCircle(80,250,20, paint);
        canvas.drawCircle(220,250,20, paint);

        fw.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                move();
            }
        });

        bw.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                back();
            }
        });

        up.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                up();
            }
        });

        down.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                down();
            }
        });

        rot.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                rot();
            }
        });

        zoom.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                zoom();
            }
        });

        fade.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                fade();
            }
        });
    }

    void move(){
        iv.animate().translationXBy(50f).setDuration(600);
        angle*=-1;
        iv.animate().rotationBy(angle);
    }

    void back(){
        iv.animate().translationXBy(-50f).setDuration(600);
        angle*=-1;
        iv.animate().rotationBy(angle);
    }

    void up(){
        iv.animate().translationYBy(-50f).setDuration(600);
    }
    void down(){
        iv.animate().translationYBy(50f).setDuration(600);
    }

    void rot(){
        iv.animate().rotationBy(360).setDuration(600);
    }

    void zoom(){
        Animation zoom = AnimationUtils.loadAnimation(getApplicationContext(),R.anim.zoom);
        iv.startAnimation(zoom);
    }

    void fade(){
        Animation fade = AnimationUtils.loadAnimation(getApplicationContext(), R.anim.fade);
        iv.startAnimation(fade);
    }
}

zoom
<?xml version="1.0" encoding="utf-8"?>
<set xmlns:android="http://schemas.android.com/apk/res/android">
    <scale xmlns:android="http://schemas.android.com/apk/res/android"
        android:fromXScale="1"
        android:toXScale="2"
        android:fromYScale="1"
        android:toYScale="2"
        android:duration="1000"
        >
    </scale>
</set>

fade
<?xml version="1.0" encoding="utf-8"?>
<set xmlns:android="http://schemas.android.com/apk/res/android">
    <alpha
        android:fromAlpha="0"
        android:toAlpha="1"
        android:duration="1000">

    </alpha>
</set>

DATABASE
MainActivity.java
package com.example.employee;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    Button create, insert, update, delete, retrieve;
    SQLiteDatabase db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        create = findViewById(R.id.createBtn);
        insert = findViewById(R.id.insertBtn);
        update = findViewById(R.id.updateBtn);
        delete = findViewById(R.id.deleteBtn);
        retrieve = findViewById(R.id.retrieveBtn);

        create.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                db = openOrCreateDatabase("DB",MODE_PRIVATE, null);
                db.execSQL("drop table if exists Employee");
                db.execSQL("create table Employee(id number, name varchar)");
                Toast.makeText(getApplicationContext(),"DB created",Toast.LENGTH_SHORT).show();
            }
        });

        insert.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(),InsertActivity.class);
                startActivity(intent);
            }
        });

        update.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), UpdateActivity.class);
                startActivity(intent);
            }
        });

        delete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(),DeleteActivity.class);
                startActivity(intent);
            }
        });

        retrieve.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), RetrieveActivity.class);
                startActivity(intent);
            }
        });
    }

}

Insert
package com.example.employee;

import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class InsertActivity extends AppCompatActivity {

    EditText et1, et2;
    Button insert;

    SQLiteDatabase db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_insert);

        et1 = findViewById(R.id.editTextTextPersonName);
        et2 = findViewById(R.id.editTextTextPersonName2);
        insert = findViewById(R.id.button);

        insert.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String name = et1.getText().toString();
                String id = et2.getText().toString();

                db = openOrCreateDatabase("DB", MODE_PRIVATE, null);
                try{
                    db.execSQL("insert into Employee values(?,?)",new String[]{id,name});
                    Toast.makeText(getApplicationContext(),"Insert success",Toast.LENGTH_SHORT).show();
                }
                catch (Exception e){
                    Toast.makeText(getApplicationContext(),"Insert failed",Toast.LENGTH_SHORT).show();
                }




            }
        });
    }
}

Delete
package com.example.employee;

import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class DeleteActivity extends AppCompatActivity {

    EditText et5;
    Button delete;

    SQLiteDatabase db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_delete);

        et5 = findViewById(R.id.editTextTextPersonName5);
        delete = findViewById(R.id.button3);

        delete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String id = et5.getText().toString();

                db = openOrCreateDatabase("DB", MODE_PRIVATE, null);
                try
                {
                    db.execSQL("delete from Employee where id = ?", new String[]{id});
                    Toast.makeText(getApplicationContext(),"Delete Success",Toast.LENGTH_SHORT).show();
                }
                catch (Exception e){
                    Toast.makeText(getApplicationContext(),"Delete failed", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}

Retrieve:
package com.example.employee;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class RetrieveActivity extends AppCompatActivity {

    EditText et6;
    TextView tv;
    Button retrieve;

    SQLiteDatabase db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_retrieve);

        et6 = findViewById(R.id.editTextTextPersonName6);
        retrieve = findViewById(R.id.button4);
        tv = findViewById(R.id.textView);


        retrieve.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String id = et6.getText().toString();
                String name;
                Cursor rs;
                try
                {
                    db = openOrCreateDatabase("DB", MODE_PRIVATE, null);
                    rs = db.rawQuery("select * from Employee where id = ?", new String[]{id});
                    while(rs.moveToNext()){
                        name = rs.getString(1);
                        tv.setText(name);
                    }
                    Toast.makeText(getApplicationContext(),"Retrieve success", Toast.LENGTH_SHORT).show();
                }
                catch(Exception e){
                    Toast.makeText(getApplicationContext(),"Retrieve fail", Toast.LENGTH_SHORT).show();
                }

            }
        });
    }
}

Update
package com.example.employee;

import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class UpdateActivity extends AppCompatActivity {

    EditText et3, et4;
    Button update;

    SQLiteDatabase db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_update);

        update = findViewById(R.id.button2);
        et3 = findViewById(R.id.editTextTextPersonName3);
        et4 = findViewById(R.id.editTextTextPersonName4);

        update.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String name = et3.getText().toString();
                String id = et4.getText().toString();

                db = openOrCreateDatabase("DB", MODE_PRIVATE,null);
                try{
                    db.execSQL("update Employee set id=?, name=? where id = ?", new String[]{id,name,id});
                    Toast.makeText(getApplicationContext(),"Update success", Toast.LENGTH_SHORT).show();
                }
                catch(Exception e){
                    Toast.makeText(getApplicationContext(),"Update failed", Toast.LENGTH_SHORT).show();
                }
            }
        });


    }
}

Retrieve All
package com.example.dbagain;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class RetrieveAllActivity extends AppCompatActivity {

    TextView tvDetails;
    SQLiteDatabase db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_retrieve_all);

        tvDetails = findViewById(R.id.textView);

        String details = "";

        db = openOrCreateDatabase("db",MODE_PRIVATE, null);
        Cursor res;
        res = db.rawQuery("select * from Emp", new String[]{});

        while(res.moveToNext()){
            details+=res.getString(0)+"\n"+ res.getString(1)+"\n"+res.getString(2)+"\n"+res.getString(3)+"\n";
            details+="\n";
        }

        tvDetails.setText(details);
    }
}


SMS
package com.example.smsagain;

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

    EditText etNumber, etMessage;
    Button send;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        etNumber = findViewById(R.id.editTextNumber);
        etMessage = findViewById(R.id.editTextMessage);
        send = findViewById(R.id.buttonSend);

        ActivityCompat.requestPermissions(MainActivity.this,new String[]{READ_SMS, SEND_SMS, RECEIVE_SMS, READ_PHONE_STATE},1);

        send.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String number = etNumber.getText().toString();
                String message = etMessage.getText().toString();

                PendingIntent sentPI = PendingIntent.getBroadcast(getApplicationContext(),0,new Intent("Message sent"),0);
                PendingIntent deliveredPI = PendingIntent.getBroadcast(getApplicationContext(),0,new Intent("Message delivered"),0);

                SmsManager sm = SmsManager.getDefault();
                sm.sendTextMessage(number,null,message,sentPI, deliveredPI);
                Toast.makeText(getApplicationContext(), "Message Sent", Toast.LENGTH_SHORT).show();
            }
        });
    }
}

<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.sms">
    <uses-permission android:name="android.permission.READ_SMS"/>
    <uses-permission android:name="android.permission.SEND_SMS"/>
    <uses-permission android:name="android.permission.RECEIVE_SMS"/>
    <uses-permission android:name="android.permission.READ_PHONE_STATE"/>

    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.SMS">
        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>

SD CARD:
package com.example.sdcard;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;

public class MainActivity extends AppCompatActivity {

    EditText name, content;
    Button read, write;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        name = findViewById(R.id.fileName);
        content = findViewById(R.id.fileContent);
        read = findViewById(R.id.readBtn);
        write = findViewById(R.id.writeBtn);

        write.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                File file = new File(getFilesDir(), name.getText().toString());
                try{
                    FileOutputStream fileOutputStream = new FileOutputStream((file));
                    fileOutputStream.write(content.getText().toString().getBytes());
                    fileOutputStream.close();
                    content.setText("");
                    Toast.makeText(getApplicationContext(),"File written",Toast.LENGTH_SHORT).show();
                }
                catch (Exception e){
                    Toast.makeText(getApplicationContext(),"Write failed",Toast.LENGTH_SHORT).show();
                }
            }
        });

        read.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String line, text = "";
                File file = new File(getFilesDir(), name.getText().toString());
                try{
                    BufferedReader bufferedReader = new BufferedReader(new FileReader(file));

                    while((line = bufferedReader.readLine()) != null){
                        text += line;
                    }
                    content.setText(text);
                    Toast.makeText(getApplicationContext(),"File read",Toast.LENGTH_SHORT).show();
                }
                catch(Exception e){
                    Toast.makeText(getApplicationContext(),"Read failed",Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}

<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.sdcard">
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.SDCard">
        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>

MULITHREADING
package com.example.multiagain;
import androidx.appcompat.app.AppCompatActivity;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.util.Random;

public class MainActivity extends AppCompatActivity {

    public Button startButton, resetButton, colorButton;

    public TextView tv;
    public final Handler ha = new Handler();
    int idx = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        tv = findViewById(R.id.textView2);

        startButton = findViewById(R.id.startButton);
        resetButton = findViewById(R.id.resetButton);
        colorButton = findViewById(R.id.leftButton);


        startButton.setOnClickListener(new View.OnClickListener(){
            public void onClick(View v){
                runnable.run();
            }
        });

        resetButton.setOnClickListener(new View.OnClickListener(){
            public void onClick(View v){
                ha.removeCallbacks(runnable);
            }
        });

        colorButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try{
                            tv.setTextColor(getRandomColor());
                            tv.setBackgroundColor(getRandomColor());
                        }
                        catch (Exception e){
                            //toast error
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

    public String getSomeText(){
        String name[] = {"Hi","this","is","a","scrolling","text"};
        String t = name[idx];
        idx = (idx+1)%6;
        return t;
    }

    Runnable runnable = new Runnable() {
        @Override
        public void run() {
            try {
                doTask();
            }catch (Exception e){
                e.printStackTrace();
            } finally {
                ha.postDelayed(runnable, 500);
            }
        }
    };

    public void doTask() {
        tv.setText(getSomeText());
    }
}

LOCATION
package com.example.locationagain;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity implements LocationListener {

    TextView latitude, longitude;
    LocationManager locationManager;
    Button get;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        get = findViewById(R.id.buttonGet);

        get.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                getLocation();
            }
        });
    }

    void getLocation() {
        try {
            locationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
            locationManager.requestLocationUpdates(“gps”, 1000, 5, (LocationListener) this);
        }
        catch(SecurityException e) {
            //error toast
        }
    }

    @Override
    public void onLocationChanged(Location location) {

        latitude = findViewById(R.id.latitude);
        longitude = findViewById(R.id.longitude);

        latitude.setText("Latitude " +location.getLatitude());
        longitude.setText("Longitude "+location.getLongitude());
    }

}


<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

FAKE ALARM
package com.example.alarmclock;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TimePicker;
import android.widget.Toast;

import java.util.Calendar;

public class MainActivity extends AppCompatActivity {

    TimePicker alarm;
    Button set;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        alarm = findViewById(R.id.alarmClock);
        set = findViewById(R.id.buttonSet);

        set.setOnClickListener(new View.OnClickListener() {
            long time;
            @Override
            public void onClick(View v) {

                Calendar calendar = Calendar.getInstance();
                calendar.set(Calendar.HOUR_OF_DAY, alarm.getCurrentHour());
                calendar.set(Calendar.MINUTE, alarm.getCurrentMinute());

                time = (calendar.getTimeInMillis() - System.currentTimeMillis());

                Toast.makeText(getApplicationContext(),"Alarm set",Toast.LENGTH_SHORT).show();
                try {
                    Thread.sleep(time);
                    Toast.makeText(getApplicationContext(),"WAKE UP",Toast.LENGTH_LONG).show();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

            }
        });
    }
}

