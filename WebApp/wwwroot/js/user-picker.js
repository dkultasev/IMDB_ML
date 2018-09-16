Vue.component('user-picker', {
    data: function () {
      return {
        allReviewers: [],
        selectedReviewer: {}
      }
    },
    mounted() { 
        axios
            .get("/api/Reviewers")
            .then(response => {
                this.allReviewers = response.data;
                this.selectedReviewer = this.allReviewers[0].id;
                this.userSelected(this.allReviewers[0].id);
            });
    },
    methods:{
        userSelected(value){this.$emit("user-selected", value);}
    },
    template: `
    <v-select
          :items="allReviewers"
          v-model="selectedReviewer"
          @input="userSelected"
          item-text="name"
          item-value="id"
          solo
        ></v-select>
    `
  })