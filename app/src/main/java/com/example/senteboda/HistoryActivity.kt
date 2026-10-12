package com.example.senteboda

import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class HistoryActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_history)

        val btnAll = findViewById<TextView>(R.id.btnFilterAll)
        val btnTrips = findViewById<TextView>(R.id.btnFilterTrips)
        val btnExpenses = findViewById<TextView>(R.id.btnFilterExpenses)

        btnAll.setOnClickListener {
            btnAll.setBackgroundResource(R.drawable.bg_tab_active)
            btnAll.setTextColor(getColor(R.color.text_dark))
            btnTrips.setBackgroundResource(R.drawable.bg_tab_inactive)
            btnTrips.setTextColor(getColor(R.color.text_gray))
            btnExpenses.setBackgroundResource(R.drawable.bg_tab_inactive)
            btnExpenses.setTextColor(getColor(R.color.text_gray))
        }

        btnTrips.setOnClickListener {
            btnTrips.setBackgroundResource(R.drawable.bg_tab_active)
            btnTrips.setTextColor(getColor(R.color.text_dark))
            btnAll.setBackgroundResource(R.drawable.bg_tab_inactive)
            btnAll.setTextColor(getColor(R.color.text_gray))
            btnExpenses.setBackgroundResource(R.drawable.bg_tab_inactive)
            btnExpenses.setTextColor(getColor(R.color.text_gray))
        }

        btnExpenses.setOnClickListener {
            btnExpenses.setBackgroundResource(R.drawable.bg_tab_active)
            btnExpenses.setTextColor(getColor(R.color.text_dark))
            btnAll.setBackgroundResource(R.drawable.bg_tab_inactive)
            btnAll.setTextColor(getColor(R.color.text_gray))
            btnTrips.setBackgroundResource(R.drawable.bg_tab_inactive)
            btnTrips.setTextColor(getColor(R.color.text_gray))
        }
    }
}
