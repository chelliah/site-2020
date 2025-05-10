<template>
  <div class="page--my-work">
    <h1 class="background-jumbo-text left">see my work</h1>
    <div class="nav left short">
      <internal-link
        to="/"
        text="Home"
        theme="mid"
        :onHover="hoverHome"
        :clearHover="clearHover"
      />
      <internal-link
        to="/about"
        text="About me"
        theme="mid"
        :onHover="hoverAbout"
        :clearHover="clearHover"
      />
    </div>
    <div class="text-container">
      <!-- <h3 class="right short">My work</h3> -->
      <p class="left">
        My data visualization work has been featured across the web.
        <external-link
          to="https://www.dataforprogress.org/accountable-allies"
          text="Accountable Allies"
        /> is a series of projects at I completed at Data for Progress that highlighted the ways progressive institutions are beholden to conservative corporate interests.
        <external-link
          to="https://knightfoundation.org/features/community-ties/"
          text="Community Ties"
        /> is a project I completed at Fathom Information Design in partnership with the Knight Foundation. The project explored the factors that build affinity between individuals and the cities they live in. 
      </p>  

      
      <p class="left">
        Additionally, I've built a couple projects to explore web animation techniques.
        <external-link
          to="https://blumhouse.erincthomas.com"
          text="Blumhouse"
        /> is a site i built to practice SVG animations.
        <external-link
          to="https://shaders.erincthomas.com"
          text="Shader sketchbook"
        /> is a vue app I build to easily write and tweak glsl programs.
      </p>
      <!-- <p class="right">
        One client project i’m especially proud of is the
        <external-link to text="Community ties survey" /> for Knight Foundation. At Fathom Information Design, I served as the lead developer on this project.
      </p> -->
      <p class="left">
        In my free time, I like to make electronic music. You can check out my music on
        <external-link to="https://github.com/chelliah" text="bandcamp" />.
        <!-- <external-link to text="embroidery" /> for friends -->
      </p>
      <p class="left">
        Feel free to check out my
        <external-link to="https://github.com/chelliah" text="github" /> or
        <external-link to="https://codepen.io/chelliah/" text="codepen" /> if you want to see more.
      </p>
    </div>
  </div>
</template>

<script>
import ExternalLink from "../components/ExternalLink";
import InternalLink from "../components/InternalLink";

export default {
  name: "MyWork",
  props: ["setSceneHoverTarget"],
  components: {
    ExternalLink,
    InternalLink
  },
  beforeDestroy() {
    this.clearHover();
  },
  methods: {
    hoverAbout() {
      this.setSceneHoverTarget("u_hover_my_work", 1, 0);
    },
    clearHover() {
      this.setSceneHoverTarget("u_hover_my_work", 0, 0);
    },
    hoverHome() {
      this.setSceneHoverTarget("u_hover_my_work", 0, 1);
    }
  }
};
</script>

<style lang="scss" scoped>
.nav {
  position: fixed;
  right: 24px;
  top: 24px;

  :first-child {
    margin-right: 16px;
  }
  z-index: 120;
}

.page--my-work {
  // background-color: $green-mint;
  display: block;
  overflow: visible;
  /* max-height: 1000px; */
  max-width: 1280px;
  position: relative;
  margin: auto;
}

.background-jumbo-text {
  @include agrandir-wide;
  font-style: italic;
  font-size: 90px;
  color: $green-light;;

  text-transform: uppercase;
  line-height: 90px;

  position: absolute;
  bottom: 60px;
  right: 60px;
  text-align: right;

  //   left: 24px;
  margin: 0;
  width: 400px;
  z-index: 2;
}

.text-container {
  width: 100%;
  z-index: 100;
  position: absolute;
  color: #426149;
  // height: 100%;
  //   overflow: scroll;
  //   padding: 100px 20px 0px 100px;
  // //   padding-top: 150px;
  //   width: calc(100% - 200px);
  //   height: 100vh;
  box-sizing: border-box;
  max-width: 500px;

  left: 32px;
  top: 50%;
  transform: translateY(-50%);

  * {
    max-width: 560px;
  }

  h3 {
    @include agrandir-grand;
    font-style: italic;
    font-size: 84px;
    font-weight: 300;
  }

  p {
    font-size: 20px;
    width: 100%;
  }
}

.nav {
  transition-delay: 0.1s;
}
.text-container {
  .right {
    transition-delay: 0.3s;
  }
  .left {
    transition-delay: 0.2s;
  }
}
.left,
.right {
  transition: transform 0.5s ease-out, opacity 0.5s ease-out;
}

.page--my-work.toggle-slide-enter-active {
  //   transition-delay: 0.5s;
  .background-jumbo-text,
  .left,
  .right {
    transform: translate(0, 0);
    opacity: 1;
  }
}

.page--my-work.toggle-slide-enter-active,
.toggle-slide-leave-active {
  //   transition: transform .7s, opacity 0.7s;
}

.page--my-work.toggle-slide-enter {
  .background-jumbo-text,
  .left,
  .right {
    opacity: 0;
  }
  .left {
    transform: translate(60px, 0);

    &.short {
      transform: translate(30px, 0);
    }
  }
  .right {
    transform: translate(-60px, 0);
    &.short {
      transform: translate(-30px, 0);
    }
  }
}

// .toggle-slide-enter-active {
//   opacity: 1;
// }

.page--my-work.toggle-slide-leave-to /* .toggle-slide-leave-active below version 2.1.8 */ {
  .background-jumbo-text,
  .left,
  .right {
    opacity: 0;
  }
  .left {
    transform: translate(-60px, 0);
    &.short {
      transform: translate(-30px, 0);
    }
  }
  .right {
    transform: translate(60px, 0);
    &.short {
      transform: translate(30px, 0);
    }
  }
}

// @supports ( -webkit-text-stroke-width: 4px) {
//   .background-jumbo-text {
//       color: transparent;
//       opacity: 1;
//     -webkit-text-stroke-width: 4px;
//     -webkit-text-stroke-color: #d4ffde;
//   }
// }

@media only screen and (max-width: 1000px) {
  .page--my-work {
    max-width: 600px;
    padding: 20px;
    display: flex;
    position: relative;
    flex-direction: column;

    box-sizing: border-box;
  }

  .background-jumbo-text {
    bottom: unset;
    // top: 300px;
    // right: 30px;
    left: unset;
    font-size: 64px;
    width: 300px;
    position: relative;
    align-self: flex-end;

    right: unset;
    margin-top: 240px;;
    right: 0;
  }

  .text-container {
    position: relative;
    transform: none;
    top: unset;
    left: unset;
    margin-top: 32px;
  }

  .nav {
    position: absolute;
    display: flex;

    flex-direction: column;
    align-items: flex-end;

    :first-child {
      margin-right: 0;
    }
  }

  //    #me-img
}
</style>
