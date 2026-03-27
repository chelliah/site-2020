<template>
  <div class="page--epk">
    <h1 class="background-jumbo-text left">chelliah</h1>
    <div class="nav left short">
      <internal-link
        to="/"
        text="Home"
        theme="mid"
        :onHover="hoverHome"
        :clearHover="clearHover"
      />
    </div>

    <div class="image-container right">
        <div class="image-items">
            <img :src="promoPhoto" width="auto" height="400"/>
            <img :src="promoPhoto2" width="auto" height="400"/>
            <img :src="promoPhoto3" width="auto" height="400"/>
        </div>
    </div>
    <div class="text-container left">
      <!-- <h3 class="right short">My work</h3> -->
      <p >
        <em>chelliah</em> is the moniker for Chicago based electronic musician Erin Thomas. She creates techno, electronica, and ambient music that is intricate, textured, and melodic. Influenced by artists like Daphni, Perfume, and Floating Points, and drawing from her background in software engineering, she approaches modular synthesis as a space where technology and artistic expression meet.
      </p>  
      <iframe style="border: 0; width: 400px; height: 120px;" src="https://bandcamp.com/EmbeddedPlayer/album=2167598315/size=large/bgcol=333333/linkcol=fe7eaf/tracklist=false/artwork=small/transparent=true/" seamless><a href="https://chelliah.bandcamp.com/album/an-oceanic-feeling-2">an oceanic feeling by chelliah</a></iframe>

      <div>
        <a class="social-link social-link-instagram" href="https://www.instagram.com/chelliahhh/?hl=en" target="_blank" title="Instagram">
            <svg xmlns="http://www.w3.org/2000/svg" width="38.2" height="38.192" viewBox="0 0 38.2 38.192">
                <path id="Icon_awesome-instagram" data-name="Icon awesome-instagram" d="M19.1,11.542a9.792,9.792,0,1,0,9.792,9.792A9.776,9.776,0,0,0,19.1,11.542Zm0,16.158a6.366,6.366,0,1,1,6.366-6.366A6.378,6.378,0,0,1,19.1,27.7ZM31.576,11.141a2.284,2.284,0,1,1-2.284-2.284A2.279,2.279,0,0,1,31.576,11.141Zm6.485,2.318c-.145-3.059-.844-5.769-3.085-8s-4.943-2.932-8-3.085c-3.153-.179-12.6-.179-15.757,0-3.051.145-5.761.844-8,3.076s-2.932,4.943-3.085,8c-.179,3.153-.179,12.6,0,15.757.145,3.059.844,5.769,3.085,8s4.943,2.932,8,3.085c3.153.179,12.6.179,15.757,0,3.059-.145,5.769-.844,8-3.085s2.932-4.943,3.085-8c.179-3.153.179-12.6,0-15.749ZM33.987,32.591a6.445,6.445,0,0,1-3.63,3.63c-2.514,1-8.48.767-11.258.767s-8.752.222-11.258-.767a6.445,6.445,0,0,1-3.63-3.63c-1-2.514-.767-8.48-.767-11.258s-.222-8.752.767-11.258a6.445,6.445,0,0,1,3.63-3.63c2.514-1,8.48-.767,11.258-.767s8.752-.222,11.258.767a6.445,6.445,0,0,1,3.63,3.63c1,2.514.767,8.48.767,11.258S34.984,30.086,33.987,32.591Z" transform="translate(0.005 -2.238)" fill="#fff"></path>
            </svg>
        </a>
        <a>
                    <svg fill="none" height="38.2" viewBox="250 250 550 550" width="38.2" xmlns="http://www.w3.org/2000/svg"><rect height="760" rx="136.5" stroke="url(#paint0_linear)" stroke-width="27" width="760" x="157.5" y="159.5"/><path d="M667.041 338.5C674.374 337.167 680.874 338.833 686.541 343.5C692.208 348.167 695.041 354.167 695.041 361.5V618C695.041 641.667 688.374 660.167 675.041 673.5C661.708 686.5 643.374 693 620.041 693C604.041 693 590.874 688.833 580.541 680.5C570.208 671.833 565.041 661 565.041 648C565.041 631.667 571.541 618 584.541 607C597.541 596 614.374 590.5 635.041 590.5C642.708 590.5 650.874 591.833 659.541 594.5C659.874 594.5 660.208 594.333 660.541 594C660.874 594 661.041 593.833 661.041 593.5V428.5C661.041 427.5 660.541 426.667 659.541 426C658.541 425 657.541 424.667 656.541 425L469.041 461C466.374 461.667 465.041 463.333 465.041 466V668C465.041 691.667 458.374 710.167 445.041 723.5C431.708 736.5 413.374 743 390.041 743C374.041 743 360.874 738.667 350.541 730C340.208 721.667 335.041 711 335.041 698C335.041 681.667 341.541 668 354.541 657C367.541 646 384.374 640.5 405.041 640.5C412.708 640.5 420.874 641.833 429.541 644.5C429.874 644.5 430.208 644.333 430.541 644C430.874 644 431.041 643.833 431.041 643.5V411.5C431.041 403.167 433.541 395.833 438.541 389.5C443.874 382.833 450.541 378.833 458.541 377.5L667.041 338.5Z" fill="#fff"/></svg>

        </a>
      </div>
      <h4>solo performances</h4>
      <ul>
        <li>04-04-2026 - So Ambient @ Podlasie</li>
        <li>01-15-2026 - Uptown Lounge</li>
        <li>10-19-2025 - Album Release Show @ California Clipper</li>
        <li>10-04-2025 - So Ambient @ Podlasie</li>
        <li>08-28-2025 - Ambient Chess @ Sleeping Village</li>
      </ul>
     <h4>collaborations</h4>
     <ul>
        <li><external-link theme="dark" to="https://www.instagram.com/p/DRm9Hp8D8xc/" text="Threshold" /> - A night of ritual performance and dance on the Winter Solstice, combining drag, visual art, and music.</li>
        <li><external-link theme="dark" to="https://romansusan.org/my-father-s-imagination" text="My Father's Imagination" /> - A collaboration combining time-based, lens-based and choreographic practices with impressionistic sound design. </li>
      </ul>
    </div>
  </div>
</template>

<script>
import ExternalLink from "../components/ExternalLink";
import InternalLink from "../components/InternalLink";
import promoPhoto from "../assets/epk-photo-1.jpeg"
import promoPhoto2 from "../assets/epk-photo-2.jpg"
import promoPhoto3 from "../assets/epk-photo-3.jpeg"


export default {
  name: "MyWork",
  props: ["setSceneHoverTarget"],
  data() {
    return {
        promoPhoto: promoPhoto,
        promoPhoto2:promoPhoto2,
        promoPhoto3:promoPhoto3
    }
  },
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

.page--epk {
  // background-color: $green-mint;
  display: block;
  overflow: visible;
  /* max-height: 1000px; */
  max-width: 1000px;
  position: relative;
  margin: auto;

  align-items: center; 

    padding: 20px;
    display: flex;
    position: relative;
    flex-direction: column;

    box-sizing: border-box;
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

.image-container {
    display: flex;
    max-width: 100%;
    min-height: 400px;
    overflow-x: visible;
    overflow-y: hidden;

    .image-items {
        display: flex;
        width: auto;
        overflow-x: visible;
        white-space: nowrap;
    }

    img {
        margin: 1rem;

    }

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
  max-width: 560px;

  left: 32px;
  top: 50%;
  transform: translateY(-50%);
  padding: 1rem;

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

.page--epk.toggle-slide-enter-active {
  //   transition-delay: 0.5s;
  .background-jumbo-text,
  .left,
  .right {
    transform: translate(0, 0);
    opacity: 1;
  }
}

.page--epk.toggle-slide-enter-active,
.toggle-slide-leave-active {
  //   transition: transform .7s, opacity 0.7s;
}

.page--epk.toggle-slide-enter {
  .background-jumbo-text,
  .text-container,
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

.page--epk.toggle-slide-leave-to /* .toggle-slide-leave-active below version 2.1.8 */ {
  .background-jumbo-text,
  .text-container,
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

// @media only screen and (max-width: 1000px) {
  .page--epk {
  }

  .background-jumbo-text {
    bottom: unset;
    // top: 300px;
    // right: 30px;
    left: unset;
    font-size: 64px;
    // width: 300px;
    position: relative;
    right: unset;
    margin-top: 120px;;
  }

  .text-container {
    position: relative;
    transform: none;
    top: unset;
    left: unset;
    margin-top: 32px;
    background-color: rgba(255, 255, 255, 0.3);
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

  img {
    width: auto !important;
  }

  //    #me-img
// }
</style>
