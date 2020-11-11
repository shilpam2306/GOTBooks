package com.example.gtbookseries

import android.content.Intent
import androidx.fragment.app.FragmentActivity
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.appcompat.app.AppCompatActivity
import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName
import com.squareup.okhttp.OkHttpClient
import com.squareup.okhttp.Request
import com.squareup.okhttp.Response
import retrofit2.Call
import retrofit2.Callback
import java.io.IOException
import java.io.Serializable

class MainActivity : AppCompatActivity() {

    var lv: ListView? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setTitle("Game of Thrones Book List")
        lv = findViewById<ListView>(R.id.books_attractions)
        ApiCallBookList()

    }

    private fun ApiCallBookList() {
        val api = ApiClients.apiClients.create(Api::class.java)
        val call = api.bookList()
        call.enqueue(object : Callback<List<ModelBook>> {
            override fun onResponse(call: Call<List<ModelBook>>, response: retrofit2.Response<List<ModelBook>>) {
                val tModels = response.body()
                tModels!!.size
                val subjectsAdapter = BookAdapter(tModels, this@MainActivity)
                lv!!.adapter = subjectsAdapter
                lv!!.dividerHeight = 3
            }

            override fun onFailure(call: Call<List<ModelBook>>, t: Throwable) {
                Log.d("Khoros", "Failure Category : $t")

            }
        })
    }

}

class BookAdapter(items: List<ModelBook>, ctx: FragmentActivity?) :
    ArrayAdapter<ModelBook>(ctx, R.layout.activity_lists, items) {

    //view holder is used to prevent findViewById calls
    private class SubjectsItemViewHolder {
        internal var title: TextView? = null

    }

    override fun getView(i: Int, view: View?, viewGroup: ViewGroup): View {
        var view = view

        val viewHolder: SubjectsItemViewHolder

        if (view == null) {
            val inflater = LayoutInflater.from(context)
            view = inflater.inflate(R.layout.activity_lists, viewGroup, false)
            viewHolder = SubjectsItemViewHolder()
            viewHolder.title = view.findViewById<View>(R.id.textView) as TextView

        } else {
            //no need to call findViewById, can use existing ones from saved view holder
            viewHolder = view.tag as SubjectsItemViewHolder
        }

        val subjects = getItem(i)
        viewHolder.title!!.text = subjects.getname()



        view!!.setOnClickListener {
                        val intent = Intent (this.context, CharactersListActivity::class.java)
            intent.putExtra("Model",subjects as Serializable)
            this.context.startActivity(intent)
        }

        view!!.tag = viewHolder

        return view
    }
}



class ModelBook() : Serializable  {

    @SerializedName("url")
    @Expose
    private var url: String? = null

    @SerializedName("name")
    @Expose
    private var name: String? = null

    @SerializedName("isbn")
    @Expose
    private var isbn: String? = null

    @SerializedName("authors")
    @Expose
    private var authors: Array<String>? = null

    @SerializedName("numberOfPages")
    @Expose
    private var numberOfPages: Int? = null

    @SerializedName("publisher")
    @Expose
    private var publisher: String? = null

    @SerializedName("country")
    @Expose
    private var country: String? = null

    @SerializedName("mediaType")
    @Expose
    private var mediaType: String? = null


    @SerializedName("released")
    @Expose
    private var released: String? = null


    @SerializedName("characters")
    @Expose
    private var characters: Array<String>? = null

    @SerializedName("povCharacters")
    @Expose
    private var povCharacters: Array<String>? = null

    fun geturl(): String? {
        return url
    }

    fun seturl(url: String?) {
        this.url = url
    }

    fun getname(): String? {
        return name
    }

    fun setname(name: String) {
        this.name = name
    }


    fun getisbn(): String? {
        return isbn
    }

    fun setisbn(isbn: String?) {
        this.isbn = isbn
    }

    fun getauthors(): Array<String>? {
        return authors
    }

    fun setauthors(authors: Array<String>) {
        this.authors = authors
    }

    fun getnumberOfPages(): Int? {
        return numberOfPages
    }

    fun setnumberOfPages(numberOfPages: Int) {
        this.numberOfPages = numberOfPages
    }

    fun getpublisher(): String? {
        return publisher
    }

    fun setpublisher(publisher: String) {
        this.publisher = publisher
    }

    fun getcountry(): String? {
        return country
    }

    fun setcountry(country: String) {
        this.country = country
    }

    fun getmediaType(): String? {
        return mediaType
    }

    fun setmediaType(mediaType: String) {
        this.mediaType = mediaType
    }

    fun getreleased(): String? {
        return released
    }

    fun setreleased(released: String) {
        this.released = released
    }

    fun getcharacters(): Array<String>? {
        return characters
    }

    fun setcharacters(characters: Array<String>) {
        this.characters = characters
    }

    fun getpovCharacters(): Array<String>? {
        return povCharacters
    }

    fun setpovCharacters(povCharacters: Array<String>) {
        this.povCharacters = povCharacters
    }
}


