<template>
  <div
    class="internal-link--container"
    v-on:mouseover="setHover"
    v-on:mouseleave="endHover">
      <router-link 
        :class="className" 
        :style="textShadow"
        :to="to">
        {{text}}
    </router-link>
  </div>
</template>

<script>
import gsap, {Power3} from 'gsap';
export default {
  name: "InternalLink",
  props: ["to", "text", "theme", "onHover", "clearHover"],
  methods: {
      setHover() {
          this.isHovering = true;
          if(this.onHover) {
              this.onHover();
          }
      },
      endHover() {
          console.log('bi')
          this.isHovering = false;
          if(this.clearHover) {
              this.clearHover();
          }
      }

  },
  watch: {
    isHovering(isHovering) {
        gsap.to(this.$data, .25, {
            ease:Power3.easeOut, 
            texShadowOffset: isHovering ? '6' : '2'
            // onUpdate:function() {
            //     element5.innerHTML = obj5.value.toFixed(1);
            // }
        });
    }
  },
  computed: {
      textShadow() {
          let color = this.theme == 'light' ? '#639E5D' : '#934A30'

          switch(this.theme) {
              case 'light':
                color = '#ABD387';
                break;
            case 'dark':
                color = '#DF8C63';
                break;
            case 'mid':
                color = '#FFF2D4';
                break;
          }

          return `text-shadow: ${this.texShadowOffset/2}px ${this.texShadowOffset/2}px 0px  ${color}, ${this.texShadowOffset}px ${this.texShadowOffset}px 0px ${color};`
      }
  },
  data() {
      return {
          isHovering: false,
          texShadowOffset: 1,
          className: `agrandir--grand internal-link${this.theme ? ` ${this.theme}` : ''}${this.class ? ` ${this.class}`: ''}`
      }
  }
};
</script>

<style lang="scss">
.internal-link--container {
    display: inline-block;
    cursor: pointer;
}
.internal-link {
    @include agrandir-grand;
    font-size: 32px;
    font-weight: 600;
    font-style: italic;
    cursor: pointer;
    text-decoration: none;
}

.dark {
    color: $brown-dark;
    text-shadow: 1px 1px 0px $green-mint, 2px 2px 0px $green-mint;
}

.light {
    color: $cream;
    text-shadow: 1px 1px 0px #934A30, 2px 2px 0px #934A30;
}

.mid {
    color: #C08263;
    text-shadow: 1px 1px 0px #934A30, 2px 2px 0px #934A30;
}
</style>
