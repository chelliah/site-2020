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

         this.dataColorsInterval = setInterval(this.setDataColors, 300)
      }
    },
    clearHover() {
        this.clearDataColors()
    },
    setDataColors() {
      this.dataColors = this.text.split("").map(() =>  colors[Math.floor(Math.random()*colors.length)])
    },
    clearDataColors () {
      clearInterval(this.dataColorsInterval);
      this.dataColorsInterval = null;
      this.dataColors = this.text.split("").map(() =>  "transparent")
    }
  },
  watch: {
    // isHovering(isHovering) {
    //     gsap.to(this.$data, .25, {
    //         ease:Power3.easeOut,
    //         texShadowOffset: isHovering ? '2' : '0'
    //         // onUpdate:function() {
    //         //     element5.innerHTML = obj5.value.toFixed(1);
    //         // }
    //     });
    // }
  },
  //   computed: {
  //       textShadow() {
  //           let color = this.theme == 'light' ? '#639E5D' : '#934A30'

  //           return `text-shadow: ${this.texShadowOffset/2}px ${this.texShadowOffset/2}px 0px  ${color}, ${this.texShadowOffset}px ${this.texShadowOffset}px 0px ${color};`
  //       }
  //   },
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
  font-size: 48px;
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
        top: -7px;
        -webkit-text-stroke-color: #d17f57;
        color: var(--letter-color);
        mix-blend-mode: lighten;
        font-size: 48px;
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
