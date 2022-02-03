<template>
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>


      <!-- DO NOT NEED THE LABEL: EMAIL USERNAME, ETC.  Sam took them out for now  -->
      <!-- "Home" is in the app.vue -->

      
      <label for="email" class="sr-only" id="email"></label>
      Please enter a valid Email Address that may not include !:
      <input
        type="email" 
        pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
        id="email"
        class="form-control"
        placeholder="Email"
        v-model="user.email"
        required
        autofocus
      />
      <div id="username">
        <label for="username" class="sr-only" ></label>
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus
        />
      </div>
      <div id="password">
        <label for="password" class="sr-only"></label>
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required
          />
        <input
          type="password"
          id="confirmPassword"
          class="form-control"
          placeholder="Confirm Password"
          v-model="user.confirmPassword"
          required
          />
      </div>
      <div class="account">
        <router-link :to="{ name: 'login' }">Already have an account? </router-link>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">
        Create Account
      </button>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  // ADDED BACKGROUND COLOR HERE
  beforeCreate () {
    document.querySelector('body').setAttribute('style', 'background:rgb(0, 255, 255)')
  },
  beforeDestroy () {
    document.querySelector('body').setAttribute('style', '')
  },
  // ABOVE
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
.h3{
  grid-area: create;
  
  color: #2c3e50;
  margin-top: 15px;
}

.alert{
  grid-area: alert;
  
}

#email{
  grid-area: email;
  width: 95%;
}
/* WE WOULD NEED TO ADDRESS MIN WIDTH IF THEY ARE ON VERY SMALL SCREEN */
#password{
  grid-area: password;
  min-width: 40%;
  margin-right: 10px;
  margin-top: 5px
}
#username{
  grid-area: username;
  width: 97.5%;
  margin-top: 5px
  
}
.account{
  grid-area: account;
  margin-top: 5px
}
.btn{
  grid-area: button;
  margin-top: 20px
}
#register{
  grid-area: register;
}
#register{
  display: grid;
  display: flex;
    grid-template-columns:  1fr;
    text-align: left;
    grid-template-areas: 
        "register"
        "create "
        "alert "
        "email "
        "username "
        "password "
        "account "
        "button ";
        justify-content: center;
      
}


</style>
