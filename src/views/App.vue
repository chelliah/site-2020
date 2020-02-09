<template>
  <div id="app" :style="`background-color: ${bgColor};`">

    <transition
      duration=1000
      mode="out-in"
      name="toggle-slide">
      <router-view id="view" />
    </transition>
  </div>

</template>

<script>
// import gsap from 'gsap';
export default {
  name: "App",
  watch: {
    $route(to) {
      console.log(to)
      this.bgColor = this.getColor(to)
    }
  },
  data() {
    return {
      bgColor: this.getColor(this.$route)
    }
  },
  methods: {
    getColor(route) {
      let page = route.name;
      console.log(page)

      if(page.indexOf('about') >= 0) {
        return 'green';
      } else if (page.indexOf('my-work') >= 0) {
        return 'blue';
      } else {
        return 'red';
      }
    }
  }
};
</script>

<style lang="scss">

body {
  margin: 0;
}

#app {
  @include agrandir-wide;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: left;
  color: $cream;
  /* padding-top: 60px; */
  // position: fixed;
  position: relative;
  height: 100vh;
  width: 100vw;
  left: 0;
  top: 0;
}

#view {
  width: 100%;
  height: 100%;

  
}



</style>
