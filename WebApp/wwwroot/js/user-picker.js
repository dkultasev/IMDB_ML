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
                this.selectedReviewer = this.allReviewers[0];
            });
    },
    template: `

    <v-select
          :items="allReviewers"
          v-model="selectedReviewer"
          item-text="name"
          item-value="id"
          placeholder="Select Reviewer"
          solo
        ></v-select>
    `
  })