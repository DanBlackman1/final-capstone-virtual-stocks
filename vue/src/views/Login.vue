<template>
<body class="loginBody">
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal">Login to view your Games</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <div class="htmlUserName">
        <label for="username" class="sr-only">Username</label>
      </div>

      <div class="username">
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

      <div class="htmlPassword">
        <label for="password" class="sr-only">Password</label>
      </div>
      <div class="inputPass">
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      </div>
        <div class="submitButton">
          <button id="submitButton" type="submit">Sign in</button>
        </div>
        <div class="register"> Not a member? &nbsp; 
          &nbsp;<router-link id="register" :to="{ name: 'register' }"> Register</router-link>
      </div>
    </form>
  </div>
</body>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style>
.form-signin{
  grid-area: form;
}
.inputPass{
  display: flex;
  justify-content: center;
}
#login{
  grid-area: login;
}
.h3{
  grid-area: signIn;
  
}
.alert{
  grid-area: alertPopUp;
  background-color: rgb(240, 240, 240);
  color: red;
}
.htmlUsername{
grid-area: username;
  display:flex;
  margin-bottom: 10px;
  align-self: center;
}
.username{
  grid-area: textUsername;
}
#password{
  grid-area: password;
  display:flex;
  margin-bottom: 10px
}
#htmlPassword{
  grid-area: passwordText;
  display:flex;
    justify-content: center;
}
.register{
  grid-area: clickCreateNewAccount;
    display:flex;
    justify-content: center;
    margin-top: 10px
}
.submitButton{
  grid-area: button;
  display:flex;
    justify-content: center;

}
.form-signin{
  border: black;
  border-style: solid;
  padding: 5px;
  width: 500px;
  height: 400px;
  background-color: rgb(233, 233, 233);
  
}

#login{
  display: grid;
  display: flex;
  grid-template-columns: 1fr;
  /* grid-template-areas: 
  "login"
  "signIn",
  "alertPopUp",
  "username",
  "textUsername",
  "password",
  "passwordText"
  "clickCreateNewAccount"
  "button"; */
justify-content: center;
text-align: center;
/* padding-top: 8%; */
}

</style>
