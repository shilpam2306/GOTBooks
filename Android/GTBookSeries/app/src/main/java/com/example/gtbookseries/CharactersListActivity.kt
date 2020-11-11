package com.example.gtbookseries


import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.FragmentActivity
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import retrofit2.Call
import retrofit2.Callback
import java.io.Serializable

class CharactersListActivity : AppCompatActivity() {

    var lv: ListView? = null
    var modelObject : ModelBook? = null
    var list: List<ModelCharacter>? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_characters)
        setTitle("Character List")

        modelObject = intent.getSerializableExtra("Model") as ModelBook
        lv = findViewById<ListView>(R.id.books_attractions)
        val c = modelObject!!.getcharacters()

        //coroutine to thread management to be done properly
        GlobalScope.launch  {
          for (i in c!! ) {
              ApiCallCharacterList(i.toString())
          }
        }
    }

    private fun ApiCallCharacterList(url : String) {
        Log.d("EFA", "Failure Category : $url")
        list = ArrayList<ModelCharacter>()
        val api = ApiClients.apiClients.create(Api::class.java)
        val call = api.characterList(url)
        call.enqueue(object : Callback<ModelCharacter> {
            override fun onResponse(call: Call<ModelCharacter>, response: retrofit2.Response<ModelCharacter>) {
                val sModels = response.body()
                    (list as ArrayList<ModelCharacter>)?.add(sModels!!)

                    val subjectsAdapter = CharacterAdapter(list!!, this@CharactersListActivity)
                    lv!!.adapter = subjectsAdapter
                    lv!!.dividerHeight = 3

            }

            override fun onFailure(call: Call<ModelCharacter>, t: Throwable) {
                Log.d("Khoros", "Failure Category : $t")

            }
        })
    }
}

class CharacterAdapter(items: List<ModelCharacter>, ctx: FragmentActivity?) :
    ArrayAdapter<ModelCharacter>(ctx, R.layout.activity_chrlists, items) {

    //view holder is used to prevent findViewById calls
    private class SubjectsItemViewHolder {

        internal var title: TextView? = null
        internal var rs1: TextView? = null
        internal var rs2: TextView? = null
    }

    override fun getView(i: Int, view: View?, viewGroup: ViewGroup): View {
        var view = view

        val viewHolder: SubjectsItemViewHolder

        if (view == null) {
            val inflater = LayoutInflater.from(context)
            view = inflater.inflate(R.layout.activity_chrlists, viewGroup, false)

            viewHolder = SubjectsItemViewHolder()
            viewHolder.title = view!!.findViewById<View>(R.id.title) as TextView
            viewHolder.rs1 = view!!.findViewById<View>(R.id.rs1) as TextView
            viewHolder.rs2 = view!!.findViewById<View>(R.id.rs2) as TextView

        } else {
            //no need to call findViewById, can use existing ones from saved view holder
            viewHolder = view.tag as SubjectsItemViewHolder
        }

        val subjects = getItem(i)
        viewHolder.title!!.text = "Title : " + subjects.getname()
        viewHolder.rs2!!.text = "Gender : " + subjects.getgender()
        viewHolder.rs1!!.text = "Born : " + subjects.getborn()


        view.setOnClickListener {
           Toast.makeText(context, "Clicked on Character " + subjects!!.getname(),
                   Toast.LENGTH_SHORT).show()
        }
        view.tag = viewHolder

        return view
    }
}


class ModelCharacter() : Serializable  {

    @SerializedName("url")
    @Expose
    private var url: String? = null

    @SerializedName("name")
    @Expose
    private var name: String? = null

    @SerializedName("gender")
    @Expose
    private var gender: String? = null

    @SerializedName("culture")
    @Expose
    private var culture: String? = null

    @SerializedName("born")
    @Expose
    private var born: String? = null

    @SerializedName("died")
    @Expose
    private var died: String? = null

    @SerializedName("titles")
    @Expose
    private var titles: Array<String>? = null

    @SerializedName("aliases")
    @Expose
    private var aliases: Array<String>? = null


    @SerializedName("father")
    @Expose
    private var father: String? = null

    @SerializedName("mother")
    @Expose
    private var mother: String? = null

    @SerializedName("spouse")
    @Expose
    private var spouse: String? = null

    @SerializedName("allegiances")
    @Expose
    private var allegiances: Array<String>? = null

    @SerializedName("books")
    @Expose
    private var books: Array<String>? = null

    @SerializedName("povBooks")
    @Expose
    private var povBooks: Array<String>? = null

    @SerializedName("tvSeries")
    @Expose
    private var tvSeries: Array<String>? = null

    @SerializedName("playedBy")
    @Expose
    private var playedBy: Array<String>? = null


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

    fun getgender(): String? {
        return gender
    }

    fun setgender(gender: String?) {
        this.gender = gender
    }

    fun getculture(): String? {
        return culture
    }

    fun setculture(culture: String?) {
        this.culture = culture
    }

    fun getborn(): String? {
        return born
    }

    fun setborn(born: String?) {
        this.born = born
    }

    fun getdied(): String? {
        return died
    }

    fun setdied(died: String) {
        this.died = died
    }

    fun gettitles(): Array<String>?? {
        return titles
    }

    fun settitles(titles: Array<String>?) {
        this.titles = titles
    }

    fun getaliases(): Array<String>?? {
        return aliases
    }

    fun setaliases(aliases: Array<String>?) {
        this.aliases = aliases
    }

    fun getfather(): String? {
        return father
    }

    fun setfather(father: String) {
        this.father = father
    }

    fun getmother(): String? {
        return mother
    }

    fun setmother(mother: String) {
        this.mother = mother
    }

    fun getspouse(): String? {
        return spouse
    }

    fun setspouse(spouse: String?) {
        this.spouse = spouse
    }

    fun getallegiances(): Array<String>? {
        return allegiances
    }

    fun setallegiances(allegiances: Array<String>) {
        this.allegiances = allegiances
    }

    fun getbooks(): Array<String>? {
        return books
    }

    fun setbooks(books: Array<String>) {
        this.books = books
    }

    fun getpovBooks(): Array<String>? {
        return povBooks
    }

    fun setpovBooks(povBooks: Array<String>) {
        this.povBooks = povBooks
    }

    fun gettvSeries(): Array<String>? {
        return tvSeries
    }

    fun settvSeries(tvSeries: Array<String>) {
        this.tvSeries = tvSeries
    }

    fun getplayedBy(): Array<String>? {
        return playedBy
    }

    fun setplayedBy(playedBy: Array<String>) {
        this.playedBy = playedBy
    }
}

