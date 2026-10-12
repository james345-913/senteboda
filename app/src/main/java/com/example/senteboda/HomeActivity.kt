package com.example.senteboda

import android.content.Intent
import android.os.Bundle
import android.widget.LinearLayout
import androidx.appcompat.app.AppCompatActivity

class HomeActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_home)

        val navAdd = findViewById<LinearLayout>(R.id.navAdd)
        val navHistory = findViewById<LinearLayout>(R.id.navHistory)
        val navProfile = findViewById<LinearLayout>(R.id.navProfile)

        navAdd.setOnClickListener {
            startActivity(Intent(this, AddEntryActivity::class.java))
        }

        navHistory.setOnClickListener {
            startActivity(Intent(this, HistoryActivity::class.java))
        }

        navProfile.setOnClickListener {
            startActivity(Intent(this, ProfileActivity::class.java))
        }
    }
}
