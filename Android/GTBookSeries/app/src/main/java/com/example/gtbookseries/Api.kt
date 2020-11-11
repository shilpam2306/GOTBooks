package com.example.gtbookseries

import com.google.gson.GsonBuilder
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory


import retrofit2.Call
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.Url



interface Api {

    @GET("books/")
    fun bookList(): Call<List<ModelBook>>

    @GET
    fun characterList(@Url url: String): Call<ModelCharacter>

}
