package com.example.senteboda

import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class AddEntryActivity : AppCompatActivity() {

    private var isTripSelected = true

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add_entry)

        val btnTabTrip = findViewById<TextView>(R.id.btnTabTrip)
        val btnTabExpense = findViewById<TextView>(R.id.btnTabExpense)
        val layoutExpenseType = findViewById<LinearLayout>(R.id.layoutExpenseType)
        val tvNoteLabel = findViewById<TextView>(R.id.tvNoteLabel)
        val etNote = findViewById<EditText>(R.id.etNote)
        val btnSave = findViewById<Button>(R.id.btnSave)
        val etAmount = findViewById<EditText>(R.id.etAmount)

        btnTabTrip.setOnClickListener {
            isTripSelected = true
            btnTabTrip.setBackgroundResource(R.drawable.bg_tab_active)
            btnTabTrip.setTextColor(getColor(R.color.text_dark))
            btnTabExpense.setBackgroundResource(R.drawable.bg_tab_inactive)
            btnTabExpense.setTextColor(getColor(R.color.text_gray))
            layoutExpenseType.visibility = View.GONE
            tvNoteLabel.text = getString(R.string.destination_note)
            etNote.hint = "e.g. Ntinda to Kisaasi"
            btnSave.text = getString(R.string.save_trip)
        }

        btnTabExpense.setOnClickListener {
            isTripSelected = false
            btnTabExpense.setBackgroundResource(R.drawable.bg_tab_active)
            btnTabExpense.setTextColor(getColor(R.color.text_dark))
            btnTabTrip.setBackgroundResource(R.drawable.bg_tab_inactive)
            btnTabTrip.setTextColor(getColor(R.color.text_gray))
            layoutExpenseType.visibility = View.VISIBLE
            tvNoteLabel.text = "Note / Description"
            etNote.hint = "e.g. 2 litres fuel"
            btnSave.text = getString(R.string.save_expense)
        }

        btnSave.setOnClickListener {
            val amount = etAmount.text.toString().trim()
            if (amount.isEmpty()) {
                Toast.makeText(this, "Please enter an amount", Toast.LENGTH_SHORT).show()
            } else {
                val type = if (isTripSelected) "Trip" else "Expense"
                Toast.makeText(this, "$type recorded successfully!", Toast.LENGTH_SHORT).show()
                finish()
            }
        }
    }
}
