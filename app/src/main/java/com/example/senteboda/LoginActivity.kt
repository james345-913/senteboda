package com.example.senteboda

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class LoginActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        val etPhone = findViewById<EditText>(R.id.etLoginPhone)
        val etPassword = findViewById<EditText>(R.id.etLoginPassword)
        val btnLogin = findViewById<Button>(R.id.btnLogin)
        val tvRegisterLink = findViewById<TextView>(R.id.tvRegisterLink)

        btnLogin.setOnClickListener {
            val phone = etPhone.text.toString().trim()
            val pass = etPassword.text.toString().trim()

            if (phone.isEmpty() || pass.isEmpty()) {
                Toast.makeText(this, "Please enter phone and password", Toast.LENGTH_SHORT).show()
            } else {
                Toast.makeText(this, "Welcome back!", Toast.LENGTH_SHORT).show()
                startActivity(Intent(this, HomeActivity::class.java))
                finish()
            }
        }

        tvRegisterLink.setOnClickListener {
            startActivity(Intent(this, RegisterActivity::class.java))
        }
    }
}
