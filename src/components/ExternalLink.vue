<template>
  <div class="external-link--container" v-on:mouseover="setHover" v-on:mouseleave="clearHover">
    <a :class="className"  :href="to" target="_blank">
      <span v-for="(letter, index) in textArray" :key="index" :data-letter="letter" :style="`--letter-color: ${dataColors[index]};`">{{letter}}</span>
    </a>
  </div>
</template>

<script>
const colors = ['#E4C34C', '#739E5D', '#FFF2D4', '#592819', '#D5EB9E', '#FFAE86']
// import gsap, {Power3} from 'gsap';
export default {
  name: "ExternalLink",
  props: ["to", "text", "theme"],
  methods: {
    setHover() {
      this.isHovering = true;

      if(!this.dataColorsInterval) {
          this.dataColorsInterval = 0;
          requestAnimationFrame(this.setDataColors);
      }
    },
    clearHover() {
        this.clearDataColors()
    },
    setDataColors() {
        if(this.dataColorsInterval == null) return;
        if(this.dataColorsInterval % 40 == 0) {
            this.dataColors = this.text.split("").map(() =>  colors[Math.floor(Math.random()*colors.length)])
            
        }
        this.dataColorsInterval += 1;
        requestAnimationFrame(this.setDataColors);
    },
    clearDataColors () {
      this.dataColorsInterval = null;
      this.dataColors = this.text.split("").map(() =>  "transparent")
    }
  },
  data() {
    return {
      isHovering: false,
      //   texShadowOffset: 0,
      className: `external-link`,
      textArray: this.text.split(""),
      dataColorsInterval: null,
      dataColors: this.text.split("").map(() => "transparent")
    };
  }
};
</script>

<style lang="scss">
.external-link--container {
  display: inline-block;
  cursor: pointer;
}
.external-link {
  @include agrandir-wide;
  font-size: 36px;
  font-weight: 600;
  font-style: italic;
  color: transparent;
  cursor: pointer;
  text-decoration: none;

  &:hover {
      span:before {
          opacity: 1;
      }
  }
  // text-shadow: 0px 2px 2px $green-mint;
  span {
    // border: 3px solid #D17F57;
    position: relative;
    // text-shadow: 2px 2px 0px #abd387a8;
    -webkit-text-stroke-width: 2px;
    -webkit-text-stroke-color: #d17f57;

    &:before {
        content: attr(data-letter);
        position: absolute;
        left: 0px;
        text-shadow: none;
        top: -5px;
        -webkit-text-stroke-color: #d17f57;
        color: var(--letter-color);
        mix-blend-mode: lighten;
        font-size: 36px;
        opacity: 0;
        // z-index: -1;
    }
  }
}

.dark {
  color: $brown-dark;
  text-shadow: 0px 0px 0px #934a30, 0px 0px 0px #934a30;
}

.light {
  color: $cream;
  text-shadow: 0px 0px 0px #934a30, 0px 0px 0px #934a30;
}
</style>
