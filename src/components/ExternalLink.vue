<template>
  <div class="external-link--container" v-on:mouseover="setHover" v-on:mouseleave="clearHover">
    <a :class="className"  :href="to" target="_blank">
      <span v-for="(letter, index) in textArray" :key="index" :data-letter="letter" :style="`--letter-color: ${dataColors[index]};`">{{letter}}</span>
    </a>
  </div>
</template>

<script>
// const colors = ["#ABD387", "#E4C34C"]
const colors = ["#1F5919", "#419330", "#87B97F", "#8ABE8D"]
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
        if(this.dataColorsInterval % 15 == 0) {
            this.dataColors = this.text.split("").map((letter, index) =>  colors[Math.floor((index + this.dataColorsInterval/10)%(colors.length - 1))])
            
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
  font-size: 20px;
  font-weight: 600;
  font-style: italic;
  color: transparent;
  cursor: pointer;
  text-decoration: none;

  &:hover {
     span {
       -webkit-text-stroke-color: transparent;
     }
      span:before {
          opacity: 1;
      }
  }
  // text-shadow: 0px 2px 2px $green-mint;
  span {
    // border: 3px solid #D17F57
    color: $green-light;;
    position: relative;
    // text-shadow: 2px 2px 0px #abd387a8;
    // -webkit-text-stroke-color: $green-mint;

    &:before {
        content: attr(data-letter);
        position: absolute;
        left: -3px;
        text-shadow: none;
        top: -10px;
        color: var(--letter-color);
        // color: $green-light;
        // mix-blend-mode: lighten;
        font-size: 26px;
        opacity: 0;
        z-index: 20;
        // z-index: -1;
    }
  }
}

@supports(-webkit-text-stroke: 2px) {
  .external-link span:before {

    top: -8px;
    -webkit-text-stroke-width: 1px;
    -webkit-text-stroke-color: $green-light;
    font-size: 24px;
  }
}
.external-link.dark {
  color: $brown-dark;
  text-shadow: 0px 0px 0px #934a30, 0px 0px 0px #934a30;
}

.external-link.light {
  color: $cream;
  text-shadow: 0px 0px 0px #934a30, 0px 0px 0px #934a30;
}


</style>
