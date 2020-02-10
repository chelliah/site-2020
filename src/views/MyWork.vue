<template>
  <div class="page--my-work">
    <div class="nav left short">
      <internal-link 
        to="/" 
        text="Home" 
        theme="light" 
        :onHover="hoverHome" 
        :clearHover="clearHover"/>
      <internal-link 
        to="/about" 
        text="About me" 
        theme="light" 
        :onHover="hoverAbout" 
        :clearHover="clearHover"/>
    </div>
    <div class="text-container">
      <h3 class="right short">My work</h3>
      <p class="left">
        There are a couple hobby projects I’m especially proud of.
        <external-link to="https://s3-us-west-2.amazonaws.com/blumhouse-project/index.html" text="Blumhouse" /> is a site i built to practice SVG animations.
        <external-link to="https://s3.us-east-2.amazonaws.com/shaders-website/index.html#/" text="Shader sketchbook" /> is a vue app I build to easily write and tweak glsl programs.
      </p>
      <p class="right">
        One client project i’m especially proud of is the
        <external-link to text="Community ties survey" /> for Knight Foundation. At Fathom Information Design, I served as the lead developer on this project.
      </p>
      <p class="left">
        In my free time, I like to practice fabric arts. Mostly, this involves making
        <external-link to text="clothes" /> and
        <external-link to text="embroidery" /> for friends
      </p>
      <p class="left">
          Feel free to check out my <external-link to="https://github.com/chelliah" text="github"/> or <external-link to ="https://codepen.io/chelliah/" text="codepen"/> if you want to see more.
      </p>
    </div>

    <h1 class="background-jumbo-text left">see my work</h1>
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
      this.clearHover()
  },
  methods: {
    hoverAbout() {
        this.setSceneHoverTarget('u_hover_my_work', 1, 0)
    },
    clearHover() {
        this.setSceneHoverTarget('u_hover_my_work', 0, 0)
    },
    hoverHome() {
        this.setSceneHoverTarget('u_hover_my_work', 0, 1)
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
  display: inline-block;
  overflow: scroll;
}

.background-jumbo-text {
  @include agrandir-wide;
  font-style: italic;
  font-size: 25vw;
  position: fixed;
  bottom: 24px;
  left: 24px;
  margin: 0;
  width: 2400px;
  z-index: 0;
  color: #d4ffde;
  opacity: 0.7;
}

.text-container {
  width: 100%;
  z-index: 100;
  position: absolute;
  color: $brown-dark;
  // height: 100%;
  overflow: scroll;
  padding-left: 100px;
  padding-top: 190px;
  height: 100vh;
  box-sizing: border-box;

  * {
    max-width: 824px;
  }

  h3 {
    @include agrandir-grand;
    font-style: italic;
    font-size: 84px;
    font-weight: 300;
  }

  p {
    font-size: 36px;
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

@supports ( -webkit-text-stroke-width: 4px) {
  .background-jumbo-text {
      color: transparent;
      opacity: 1;
    -webkit-text-stroke-width: 4px;
    -webkit-text-stroke-color: #d4ffde;
  }
}
</style>
