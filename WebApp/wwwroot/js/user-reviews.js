Vue.component('user-reviews', {
    props: {
        userId: Number
      },
    data: function () {
      return {
        allMovies: [],
        headers: [
            { text: 'Movie', value: 'title' },
            { text: 'Year', value: 'movieYear' },
            { text: 'Public Rating', value: 'avgRating' },
            { text: 'Your Rating', value: 'userRating' }
          ]
      }
    },
    computed:{
        
    },
    methods:{
        getUserReviews : function(){
            let gettingForUserId = this.userId;
            axios
                .get(`/api/Movies/Reviewer/${gettingForUserId}`)
                .then( response => {
                    //make sure that that the same user is still selected
                    if(gettingForUserId == this.userId) 
                    {
                        this.allMovies = response.data
                    }} );
        },
        updateMovieRating(movie, newRating){
            movie.userRating = newRating;
            axios.post(`/api/MovieReviews?userId=${this.userId}&titleId=${movie.titleId}&rating=${newRating}`);
        }
    },
    watch: {
        userId: function (newValue, oldValue) {
            this.getUserReviews();
        }
      },
    template: `
    <v-data-table
    :headers="headers"
    :items="allMovies"
    hide-actions
    class="elevation-1"
  >
    <template slot="items" slot-scope="props">
      <td><a target="_blank" :href="'https://www.imdb.com/title/' + props.item.titleId ">{{ props.item.title }}</a></td>
      <td class="text-xs-right">{{ props.item.movieYear }}</td>
      <td class="text-xs-right">{{ props.item.avgRating }}</td>
      <td class="text-xs-right">
            <v-rating 
                :value="props.item.userRating"
                @input="updateMovieRating(props.item, $event)"
                :length="10"
                dense
                hover
                >
            </v-rating>
        </td>
    </template>
  </v-data-table>
    `
  })