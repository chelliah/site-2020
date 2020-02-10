<template>
  <div class="page--about">
    <div class="nav left short">
      <internal-link to="/" text="home" theme="mid" :onHover="hoverHome" :clearHover="clearHover" />
      <internal-link
        to="/my-work"
        text="see my work"
        theme="mid"
        :onHover="hoverMyWork"
        :clearHover="clearHover"
      />
    </div>
    <div class="text-container">
      <h3 class="right short">About me</h3>
      <p
        class="left"
      >My name is Erin. I grew up in Massachusetts but as of this year am lucky to be moving to Chicago. I’m trans and brown and a taurus moon. I’ve worked as a developer for about four years.</p>
      <p class="left">In my free time I love to watch movies, sew, bike around and practice yoga.</p>
      <p class="right">
          Check out my <external-link to="https://docs.google.com/document/d/1BJSWUPeHcoZi2GXuHpamZx9e6Ig2uDu9cjZe5xkGh4I/edit?usp=sharing" text="CV"/> or get in contact with me at <external-link to="mailto:erin.c.tho@gmail.com" text="erin.c.tho@gmail.com"/>.
      </p>
    </div>

    <h1 class="background-jumbo-text left">about me</h1>
  </div>
</template>

<script>
import InternalLink from "../components/InternalLink";
import ExternalLink from '../components/ExternalLink';

export default {
  name: "About",
  props: ["setSceneHoverTarget"],
  components: {
    InternalLink,
    ExternalLink
  },
  beforeDestroy() {
      this.clearHover();
  },
  methods: {
    hoverMyWork() {
      this.setSceneHoverTarget("u_hover_about_me", 1, 0);
    },
    clearHover() {
      this.setSceneHoverTarget("u_hover_about_me", 0, 0);
    },
    hoverHome() {
      this.setSceneHoverTarget("u_hover_about_me", 0, 1);
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

.page--aboutk {
  // background-color: $brown-light;
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
  color: #A7C177;
  opacity: 0.5;
}

.text-container {
  width: 100%;
  z-index: 100;
  position: absolute;
  color: $cream;
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

.page--about.toggle-slide-enter-active {
  //   transition-delay: 0.5s;
  .background-jumbo-text,
  .left,
  .right {
    transform: translate(0, 0);
    opacity: 1;
  }
}

.page--about.toggle-slide-enter-active,
.toggle-slide-leave-active {
  //   transition: transform .7s, opacity 0.7s;
}

.page--about.toggle-slide-enter {
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

.page--about.toggle-slide-leave-to /* .toggle-slide-leave-active below version 2.1.8 */ {
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
    -webkit-text-stroke-color: $brown-med;
  }
}
</style>
