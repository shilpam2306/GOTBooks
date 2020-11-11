package com.example.gtbookseries

import com.google.gson.GsonBuilder
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory


object ApiClients {
    private val BASE_URL = "https://www.anapioficeandfire.com/api/"
    private var retrofit: Retrofit? = null

    internal var gson = GsonBuilder()
        .setLenient()
        .create()
    val apiClients: Retrofit
        get() {
            if (retrofit == null) {
                retrofit = Retrofit.Builder()
                    .baseUrl(BASE_URL)
                    .addConverterFactory(GsonConverterFactory.create(gson))
                    .build()
            }
            return retrofit!!
        }
}