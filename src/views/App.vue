<template>
  <div id="app">
    <transition duration="1000" mode="out-in" name="toggle-slide">
      <router-view
        id="view"
        :setSceneHoverTarget="setSceneHoverTarget"
        :activeSceneId="uniforms.u_scene"
      />
    </transition>
    <canvas id="bg-animation-canvas" />
  </div>
</template>

<script>
import gsap, { Power1 } from "gsap";
import GlslCanvas from "glslCanvas";
import glslify from "glslify";
// import vertexShader from '../assets/shaders/vertex.glsl';
import fragmentShader from "../assets/shaders/fragment.glsl";

export default {
  name: "App",
  watch: {
    $route(to) {
      console.log(to);
      this.setSceneIndex(to);
    }
  },
  data() {
    return {
      sceneIndex: null,
      sandbox: null,
      canvas: null,
      uniforms: {
        moon_rows: 0,
        moon_columns: 0,
        u_scene: 0,
        u_hover_main: {
          x: 0,
          y: 0
        },
        u_hover_about_me: {
          x: 0,
          y: 0
        },
        u_hover_my_work: {
          x: 0,
          y: 0
        },
        u_scene_transition: {
          x: 0,
          y: 0,
          z: 0
        },
        u_mouse: {
          x: 0,
          y: 0
        }
      }
    };
  },
  mounted() {
    this.canvas = document.getElementById("bg-animation-canvas");

    console.log(window.innerWidth, window.innerHeight);
    this.canvas.width = window.innerWidth;
    this.canvas.height = window.innerHeight;
    this.sandbox = new GlslCanvas(this.canvas);
    this.sandbox.load(glslify(fragmentShader));

    this.setUniforms();

    window.addEventListener("resize", () => {
      this.canvas.width = window.innerWidth;
      this.canvas.height = window.innerHeight;
      // this.sandbox.load(glslify(fragmentShader));
      this.setUniforms();
    });

    window.addEventListener("mousemove", e => {
      // console.log(e.clientX, e.clientY);
      this.uniforms.u_mouse.x = e.clientX;

      this.uniforms.u_mouse.y = e.clientY;
    });

    this.setSceneIndex(this.$route);
    // this.sandbox.load(string_frag_code, string_vert_code)
  },
  methods: {
    setUniforms() {
      let moon_size = 30;
      this.uniforms.moon_rows = Math.floor(this.canvas.height / moon_size);
      this.uniforms.moon_columns = Math.floor(this.canvas.width / moon_size);
      this.sandbox.setUniform(
        "moon_grid",
        this.uniforms.moon_columns,
        this.uniforms.moon_rows
      );
      this.sandbox.setUniform(
        "u_hover_main",
        this.uniforms.u_hover_main.x,
        this.uniforms.u_hover_main.y
      );
      this.sandbox.setUniform(
        "u_hover_my_work",
        this.uniforms.u_hover_my_work.x,
        this.uniforms.u_hover_my_work.y
      );
      this.sandbox.setUniform(
        "u_hover_about_me",
        this.uniforms.u_hover_about_me.x,
        this.uniforms.u_hover_about_me.y
      );
      this.sandbox.setUniform("u_scene", this.uniforms.u_scene);
      this.sandbox.setUniform(
        "u_scene_transition",
        this.uniforms.u_scene_transition.x,
        this.uniforms.u_scene_transition.y,
        this.uniforms.u_scene_transition.z
      );
      this.sandbox.setUniform(
        "u_mouse_pos",
        this.uniforms.u_mouse.x,
        this.uniforms.u_mouse.y
      );
      // console.log(this.sandbox.uniforms.u_mouse_pos && this.sandbox.uniforms.u_mouse_pos.value);
      //
      // console.log(this.sandbox.uniforms.u_mouse && this.sandbox.uniforms.u_mouse.value);
      this.sandbox.setUniform(
        "u_resolution",
        this.canvas.width,
        this.canvas.height
      );
      // console.log(this.sandbox.uniforms.u_scene)
      requestAnimationFrame(this.setUniforms);
    },
    setSceneIndex(route) {
      let page = route.name;
      // console.log(page)
      const SCENE_TRANSITION_TIME = 1.8;

      if (page.indexOf("about") >= 0) {
        gsap.to(
          this.$data.uniforms.u_scene_transition,
          SCENE_TRANSITION_TIME,
          {
            ease: Power1.easeIn,
            x: 0,
            y: 0,
            z: 1
          },
          0.2
        );

        gsap.delayedCall(SCENE_TRANSITION_TIME, () => {
          console.log("setting!");
          this.uniforms.u_scene = 1;
        });
        return 1;
      } else if (page.indexOf("my-work") >= 0) {
        gsap.to(
          this.$data.uniforms.u_scene_transition,
          SCENE_TRANSITION_TIME,
          {
            ease: Power1.easeIn,
            x: 0,
            y: 1,
            z: 0
          },
          0.2
        );

        gsap.delayedCall(SCENE_TRANSITION_TIME, () => {
          console.log("setting!");
          this.uniforms.u_scene = 2;
        });
        return 2;
      } else {
        gsap.to(
          this.$data.uniforms.u_scene_transition,
          SCENE_TRANSITION_TIME,
          {
            ease: Power1.easeIn,
            x: 1,
            y: 0,
            z: 0
          },
          0.2
        );

        gsap.delayedCall(SCENE_TRANSITION_TIME, () => {
          console.log("setting!");
          this.uniforms.u_scene = 0;
        });
        return 0;
      }
    },
    setSceneHoverTarget(hover_page, x, y) {
      let ease = (x == 0 && y == 0) ? Power1.easeOut : Power1.easeIn;
      gsap.to(
        this.$data.uniforms[hover_page],
        0.5,
        {
          ease,
          x,
          y
        },
        0.2
      );
    }
  }
};
</script>

<style lang="scss">
body {
  margin: 0;
}

#bg-animation-canvas {
  position: fixed;
  width: 100vw;
  height: 100vh;
  top: 0;
  left: 0;
  z-index: -1;
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
