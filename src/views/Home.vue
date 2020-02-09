<template>
  <div class="page--home">
      <h1 id="hi-title" class="agrandir--grand">hi. im erin.</h1>
      <h3 id="subtitle" class="agrandir--grand">I like to make things, <br/> mostly with code</h3>
      <div id="home--links-container">
          <internal-link 
            to='/about' 
            text="About me" 
            theme="dark" 
            :onHover="hoverAbout" 
            :clearHover="clearHover"
            id='home-link--about'/>
          <internal-link 
            to='/my-work' 
            text="See my work" 
            theme="dark" 
            :onHover="hoverMyWork"
            :clearHover="clearHover"
            id='home-link--my-work'/>

      </div>
  </div>
</template>

<script>
import InternalLink from '../components/InternalLink';
export default {
  name: "Home",
  props: ["setSceneHoverTarget"],
  components: {
      InternalLink
  },
  beforeDestroy() {
      this.clearHover();
  },
  methods: {
    hoverAbout() {
        this.setSceneHoverTarget('u_hover_main', 1, 0)
    },
    clearHover() {
        this.setSceneHoverTarget('u_hover_main', 0, 0)
    },
    hoverMyWork() {
        this.setSceneHoverTarget('u_hover_main', 0, 1)
    }
  }
};
</script>

<style lang="scss">
#hi-title {
 font-weight: 300;
 font-size: 120px;
     position: absolute;
    top: 15vh;
    left: 20%;
    transition-delay: 0.3s;
  transition: opacity 0.75s ease-out, transform 0.5s ease-out;
}

#subtitle {
    font-weight: 400;
    font-size: 32px;
    position: absolute;
    top: 200px;
    /* font-weight: 300; */
    /* font-size: 120px; */
    position: absolute;
    top: 40vh;
    left: 20%;

  transition: opacity 0.6s ease-out, transform 0.4s ease-out;
    transition-delay: .15s;

}

.page--home {
    // background-color: $brown-light;
    display: inline-block;
    
}

#home-link--about {
    position: absolute;
    top: 60vh;
    left: 20%;

  transition: opacity 0.7s ease-out, transform 0.3s ease-out;
    transition-delay: 0.3s;
}

#home-link--my-work {
    position: absolute;
    left: 60%;
    top: 60vh;
  transition: opacity 0.6s ease-out, transform 0.4s ease-out;
    transition-delay: 0.2s;

}

.page--home.toggle-slide-enter-active {
//   transition-delay: 0.5s;
  #home-link--my-work, #home-link--about, #hi-title, #subtitle {
      transform: translate(0, 0);
        opacity: 1;
  }
}

.page--home.toggle-slide-enter-active, .toggle-slide-leave-active {
//   transition: transform .7s, opacity 0.7s;
}

.page--home.toggle-slide-enter {
  #home-link--my-work, #home-link--about, #hi-title, #subtitle {
     
     opacity: 0;
  }
   #home-link--about, #hi-title {
       transform: translate(60px, 0);
  }
  #home-link--my-work, #subtitle {
      transform: translate(-30px, 0);
  }
}

// .toggle-slide-enter-active {
//   opacity: 1;
// }

.page--home.toggle-slide-leave-to /* .toggle-slide-leave-active below version 2.1.8 */ {
    #home-link--about {
        transition-delay: 0.15s;
    }
  #home-link--my-work, #home-link--about, #hi-title, #subtitle {
     
     opacity: 0;
  }
  #home-link--about, #hi-title {
       transform: translate(-60px, 0);
  }
  #home-link--my-work, #subtitle {
      transform: translate(30px, 0);
  }

}
</style>
