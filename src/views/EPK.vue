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
      <p>
        Her debut album, <em>an oceanic feeling</em>, presents eight tracks of bright and glitchy techno, fluttering between musical styles and stacking layers of modular sequences into a rich electronic tapestry. 
      </p>
      <iframe style="border: 0; width: 400px; height: 120px; margin: 0 calc(50% - 200px);" src="https://bandcamp.com/EmbeddedPlayer/album=2167598315/size=large/bgcol=333333/linkcol=fe7eaf/tracklist=false/artwork=small/transparent=true/" seamless><a href="https://chelliah.bandcamp.com/album/an-oceanic-feeling-2">an oceanic feeling by chelliah</a></iframe>
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
      <h4>links</h4>
     <ul>
        <li><external-link theme="dark" to="https://www.instagram.com/p/DRm9Hp8D8xc/" text="Instagram" /></li>
        <li><external-link theme="dark" to="https://music.apple.com/us/artist/chelliah/1616195634" text="Apple Music" /></li>
        <li><external-link theme="dark" to="https://chelliah.bandcamp.com" text="Bandcamp" /></li>
        <li><external-link theme="dark" to="https://soundcloud.com/chelliah" text="Soundcloud" /></li>
        <li><external-link theme="dark" to="mailto:chelliahsmusic@gmail.com" text="Email" /></li>
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
