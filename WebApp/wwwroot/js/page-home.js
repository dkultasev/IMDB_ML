Vue.component('page-home', {
    data: function () {
      return {
        selectedUserId: null,
      }
    },
    methods:{
        onUserSelected(userId){this.selectedUserId = userId}
    },
    template: `
    <v-container>
      <v-layout align-start column>
        <v-flex xs4>
          <user-picker @user-selected="onUserSelected"></user-picker>
        </v-flex>
        <v-flex>
          <user-reviews :user-id="selectedUserId"></user-reviews>
        </v-flex>
      </v-layout>
    </v-container>
    `
  })