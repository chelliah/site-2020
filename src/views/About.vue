<template>
  <div class="page--about">
    <h1 class="background-jumbo-text left">about me</h1>
    <canvas id="me-img-canvas" class="right" />
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
      <!-- <h3 class="right short">About me</h3> -->
      <p
        class="left"
      >My name is Erin, my pronouns are she/her. I grew up in Massachusetts but as of this year am lucky to be moving to Chicago. I’m trans and brown and a taurus moon. I’ve worked as a developer for about four years.</p>
      <p class="left">In my free time I love to watch movies, sew, bike around and practice yoga.</p>
      <p class="right">
        Check out my
        <external-link
          to="https://docs.google.com/document/d/1BJSWUPeHcoZi2GXuHpamZx9e6Ig2uDu9cjZe5xkGh4I/edit?usp=sharing"
          text="CV"
        />or get in contact with me at
        <external-link to="mailto:erin.c.tho@gmail.com" text="erin.c.tho@gmail.com" />.
      </p>
    </div>
    <!-- <img :src="me" alt="A black and white photo of Erin Thomas, who is wearing a plaid zip up and smiling."/> -->
  </div>
</template>

<script>
// import gsap, { Power1, Power3 } from "gsap";
import GlslCanvas from "glslCanvas";
import glslify from "glslify";

import InternalLink from "../components/InternalLink";
import ExternalLink from "../components/ExternalLink";
import fragmentShader from "../assets/shaders/me_photo.frag.glsl";

// import vertShader from '../assets/shaders/me_photo.vert.glsl';
import me from "../assets/me.jpg";
export default {
  name: "About",
  props: ["setSceneHoverTarget", "hoverAboutMe"],
  data() {
    return {
      me: me,
      timer: 0,
      u_mouse: {
        x: 0,
        y: 0
      },
      u_canvas_pos: {
        x: 0,
        y: 0
      }
    };
  },
  components: {
    InternalLink,
    ExternalLink
  },
  beforeDestroy() {
    this.clearHover();
    window.removeEventListener("mousemove", this.setMouseMove.bind(this));
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
    },
    setMouseMove(e) {
      let { left, top } = this.canvas.getBoundingClientRect();
      // console.log(e.clientX, e.clientY);
      this.u_mouse.x = e.clientX;

      this.u_mouse.y = e.clientY;
      this.u_canvas_pos.x = left;
      this.u_canvas_pos.y = top;
    },
    setUniforms() {
      this.timer += 1/40;
      // if(this.timer == 0) {
      //   console.log('hmmm');
      // }
      this.sandbox.setUniform(
        'uTime',
        Math.abs((this.timer % (60 * 2)) - 60)
      )
      this.sandbox.setUniform(
        "u_mouse_pos",
        this.u_mouse.x - this.u_canvas_pos.x,
        this.u_mouse.y - this.u_canvas_pos.y
      );
      this.sandbox.setUniform(
        "u_mouse_pos_global",
        this.u_mouse.x,
        this.u_mouse.y
      );
      this.sandbox.setUniform(
        "u_full_res",
        window.innerWidth,
        window.innerHeight
      );
      this.sandbox.setUniform(
        "u_hover_about_me",
        this.hoverAboutMe.x,
        this.hoverAboutMe.y
      );

      this.sandbox.setUniform(
        "u_resolution",
        this.canvas.width,
        this.canvas.height
      );
      this.sandbox.setUniform("u_texture", this.me);
      requestAnimationFrame(this.setUniforms);
    }
  },
  mounted() {
    this.canvas = document.getElementById("me-img-canvas");
    this.canvas.width = 400;
    this.canvas.height = 400;

    window.addEventListener("mousemove", this.setMouseMove.bind(this));
    this.sandbox = new GlslCanvas(this.canvas);
    this.sandbox.load(glslify(fragmentShader));

    this.setUniforms();
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

.page--about {
  // background-color: $brown-light;
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
  color: $brown-med;

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
  //   color: #a7c177;
  //   opacity: 0.9;
}

.text-container {
  width: 100%;
  z-index: 100;
  position: absolute;
  color: $cream;
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

#me-img-canvas {
  position: absolute;
  width: 400px;
  height: 400px;
  right: 100px;
  top: 100px;
  z-index: 0;
  //   display: none;
}

@media only screen and (max-width: 1000px) {
  .page--about {
    max-width: 600px;
    padding: 20px;
    display: flex;
    position: relative;
    flex-direction: column;

    box-sizing: border-box;
  }

  #me-img-canvas {
    width: 280px;
    height: 280px;
    left: -10px;
    position: relative;
    right: unset;
    top: unset;
    left: unset;
    bottom: unset;
    margin-top: 140px;
  }

  .background-jumbo-text {
    bottom: unset;
    top: 300px;
    right: 30px;
    left: unset;
    font-size: 64px;
    width: 300px;
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
// @supports (-webkit-text-stroke-width: 4px) {
//   .background-jumbo-text {
//     color: transparent;
//     opacity: 1;
//     -webkit-text-stroke-width: 4px;
//     -webkit-text-stroke-color: $brown-med;
//   }
// }
</style>
