<template>
  <div id="app" >

    <transition
      duration=1000
      mode="out-in"
      name="toggle-slide">
      <router-view id="view" :setUniformTarget="setUniformTarget"/>
    </transition>
    <canvas id="bg-animation-canvas"/>
  </div>

</template>

<script>
import gsap, {Power1} from 'gsap';
import GlslCanvas from 'glslCanvas'
import glslify from 'glslify';
// import vertexShader from '../assets/shaders/vertex.glsl';
import fragmentShader from '../assets/shaders/fragment.glsl';

export default {
  name: "App",
  watch: {
    $route(to) {
      console.log(to)
      this.bgColor = this.getSceneIndex(to)
    }
  },
  data() {
    return {
      sceneIndex: this.getSceneIndex(this.$route),
      sandbox: null,
      canvas: null,
      uniforms: {
        moon_rows: 0,
        moon_columns: 0,
        u_hover_main_about_me: 0,
        u_hover_main_my_work: 0,
        u_mouse: {
          x: 0,
          y: 0
        }
      }
    }
  },
  mounted() {
    this.canvas = document.getElementById("bg-animation-canvas")

    console.log(window.innerWidth, window.innerHeight)
    this.canvas.width =  window.innerWidth;
    this.canvas.height = window.innerHeight;
    this.sandbox = new GlslCanvas(this.canvas);
    this.sandbox.load(glslify(fragmentShader));

    this.setUniforms();

    window.addEventListener('resize', () => {

      this.canvas.width =  window.innerWidth;
      this.canvas.height = window.innerHeight;
          // this.sandbox.load(glslify(fragmentShader));
      this.setUniforms();

    })

    window.addEventListener('mousemove', (e) => {
      // console.log(e.clientX, e.clientY);
      this.uniforms.u_mouse.x = e.clientX;
      
      this.uniforms.u_mouse.y = e.clientY; 
    })
  // this.sandbox.load(string_frag_code, string_vert_code)
  },
  methods: {
    setUniforms() {
      let moon_size = 30;
      this.uniforms.moon_rows = Math.floor(this.canvas.height/moon_size);
      this.uniforms.moon_columns = Math.floor(this.canvas.width/moon_size);
      this.sandbox.setUniform("moon_grid",this.uniforms.moon_columns, this.uniforms.moon_rows); 
      this.sandbox.setUniform("u_scene_number", this.sceneIndex);
      this.sandbox.setUniform("u_mouse_pos", this.uniforms.u_mouse.x, this.uniforms.u_mouse.y);
      // console.log(this.sandbox.uniforms.u_mouse_pos && this.sandbox.uniforms.u_mouse_pos.value);
// 
      // console.log(this.sandbox.uniforms.u_mouse && this.sandbox.uniforms.u_mouse.value);
      this.sandbox.setUniform("u_resolution", this.canvas.width, this.canvas.height);
      this.sandbox.setUniform("u_hover_main_about_me", this.uniforms.u_hover_main_about_me)
      this.sandbox.setUniform("u_hover_main_my_work", this.uniforms.u_hover_main_my_work)
      requestAnimationFrame(this.setUniforms)
    },
    getSceneIndex(route) {
      let page = route.name;
      console.log(page)

      if(page.indexOf('about') >= 0) {
        return 1;
      } else if (page.indexOf('my-work') >= 0) {
        return 2;
      } else {
        return 0;
      }
    },
    setUniformTarget(target_uniform, target) {
      console.log('hiiii', this.$data.uniforms, target_uniform, target)
      gsap.to(this.$data.uniforms, .5, {
        ease:Power1.easeOut, 
        [target_uniform]: target
      }, 0.2)
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
