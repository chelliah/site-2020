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
 font-size: 64px;
margin-top: 20%;
margin-bottom: 8px;
    line-height: 60px;
    transition-delay: 0.3s;
  transition: opacity 0.75s ease-out, transform 0.5s ease-out;
}

#subtitle {
    font-weight: 400;
    font-size: 32px;
    margin: 16px 0 32px;
  transition: opacity 0.6s ease-out, transform 0.4s ease-out;
    transition-delay: .15s;

}

.page--home {
    // background-color: $brown-light;
    // display: inline-block;
    display: block;
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    width: 100%;
    box-sizing: border-box;
    
}

#home-link--about {
  margin-bottom: 20px;
  margin-right: 32px;

  transition: opacity 0.7s ease-out, transform 0.3s ease-out;
    transition-delay: 0.3s;
}

#home-link--my-work {

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

@media only screen and (max-width: 600px) {
  #hi-title {
    line-height: 60px;
    margin-bottom: 8px;
    margin-top: 30%;
  }
  #subtitle {
    font-size: 24px;
  }

  a {
    font-size: 24px !important;
  }
}
</style>
