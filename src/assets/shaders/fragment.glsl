#ifdef GL_ES
precision highp float;
#endif

#define PI 3.14159265359


#define BROWN_1 vec3(.875, .549, .388)
#define BROWN_2 vec3(.82, .498, .341) //82% red, 49.8% green and 34.1% blue
#define BROWN_3 vec3(.576, .29, .188) //57.6% red, 29% green and 18.8% blue
#define BROWN_4 vec3(.753, .51, .388) // 75.3% red, 51% green and 38.8% blue
#define PINK vec3(.992,.624,.482) //99.2% red, 62.4% green and 48.2% blue.
#define COCOA  vec3(.349, .157, .098) //34.9% red, 15.7% green and 9.8% blue
#define PALE_YELLOW vec3(1., .949, .831) // 100% red, 94.9% green and 83.1% blue
#define TAUPE vec3(.878, .639, .525) //87.8% red, 63.9% green and 52.5% blue
#define BROWN_5 vec3(.706, .40, .259) //70.6% red, 40% green and 25.9%
#define OLIVE vec3(.62, .682, .384) //62% red, 68.2% green and 38.4% blue
#define YELLOW vec3(.906, .82, .502) //f 90.6% red, 82% green and 50.2% blue
#define MINT vec3(.671, .827, .529) //67.1% red, 82.7% green and 52.9% blue

uniform vec2 u_resolution;
uniform float u_time;
uniform vec2 u_mouse_pos;
uniform vec2 moon_grid;
uniform vec3 u_scene_index;
uniform vec2 u_hover_main;
uniform vec2 u_hover_about_me;
uniform vec2 u_hover_my_work;

vec2 rotate2D(vec2 _st,float _angle){
    _st-=.5;
    _st=mat2(cos(_angle),-sin(_angle),
    sin(_angle),cos(_angle))*_st;
    _st+=.5;
    return _st;
}

float random(in vec2 st){
    return fract(sin(dot(st.xy,
        vec2(12.9898,78.233)))*
        43758.5453123);
}

// Based on Morgan McGuire @morgan3d
// https://www.shadertoy.com/view/4dS3Wd
float noise(in vec2 st){
    vec2 i=floor(st);
    vec2 f=fract(st);
    
    // Four corners in 2D of a tile
    float a=random(i);
    float b=random(i+vec2(1.,0.));
    float c=random(i+vec2(0.,1.));
    float d=random(i+vec2(1.,1.));
    
    vec2 u=f*f*(3.-2.*f);
    
    return mix(a,b,u.x)+
    (c-a)*u.y*(1.-u.x)+
    (d-b)*u.x*u.y;
}

float circle(in vec2 _st,in float _radius){
    vec2 dist=_st-vec2(.5);
    return 1.-smoothstep(_radius-(_radius*.01),
    _radius+(_radius*.01),
    dot(dist,dist)*4.);
}

float circle_at_pos_noise(in vec2 _st, in float _radius, in float u_time){
    vec2 dist=_st;
    float d = noise(rotate2D(_st, u_time/30. + 123.) * sin( u_time/20. + 932. + u_mouse_pos.x/u_mouse_pos.y/20.)*8. + 9999.4)*1.5;

    float m = noise(rotate2D(_st, u_mouse_pos.x*u_mouse_pos.y/(u_resolution.x*u_resolution.y)/20.*_radius) + cos( u_time/20. - 932.)*8. + 9999.4)*2.5;
    // _radius = d;
    dist *= d;
    dist *= m;
    return 1.-smoothstep(_radius-(_radius*.01),
    _radius+(_radius*.01),
    dot(dist,dist)*(4.));
}

float circle_at_pos(in vec2 _st, in float _radius, in float u_time){
    vec2 dist=_st;
    // float d = noise(rotate2D(_st, u_time/30. + 123.) * sin( u_time/20. + 932. + u_mouse_pos.x/u_mouse_pos.y/2.)*8. + 9999.4)*1.5;

    // float m = noise(rotate2D(_st, u_mouse_pos.x*u_mouse_pos.y/(u_resolution.x*u_resolution.y)/20.*_radius) + cos( u_time/20. - 932.)*8. + 9999.4)*2.5;
    // // _radius = d;
    // dist *= d;
    // dist *= m;
    return 1.-smoothstep(_radius-(_radius*.01),
    _radius+(_radius*.01),
    dot(dist,dist)*(4.));
}

float translated_circle(in vec2 _st,in float displacement,in float _radius){
    return circle(_st-displacement,_radius);
}

float circle_dist(in vec2 _st, in float _radius) {
  vec2 dist = _st - vec2(0.5);
  return smoothstep(_radius/5.,
                          _radius + (_radius * 0.01),
                          dot(dist, dist)*4.0);
}



vec3 draw_checkerboard(in vec2 st) {
      st *= 8.;
//   st.x += 14.4124;
  st *= 2.;
  //st.y += 16.;
  
  
  float dist1 = distance(st.y, 0.);
  float dist2 = distance(st.y, 4.);
  float dist3 = distance(st.y, 8.);


  float dist4 = distance(st.y, 12.);
  float dist5 = distance(st.y, 16.);

  float dist_all = max(min(min(min(min(dist1, dist2), dist3), dist4), dist5), 0.2);
;
//   st.y += sin(st.x) * abs(dist_all);

  float distX1 = distance(st.x, 4.);
  float distX2 = distance(st.x, 8.);
  float dist_x_all = sqrt(min(distX1, distX2));
  
  float amplitude = 1.8;
  float frequency = 1.;
  float x = st.x / 8. * 2. * PI;
  float t = u_time/3.;
  //st = mod(st, 16.);
//st -= 1.;
  //st +=8.*sin(u_time/20.) + 8.* sin(u_time/12.);
  
  st.y += step(st.y, 4.) * sin(x + PI/9. + t + 35234.1235123) * (dist_all) /4. ;

   st.y -= (1. - step(st.y, 4.)) * sin(x + t * 1.532 + 9734.3456453) * (dist_all) /4. ;

   st.y += step(st.y, 4.) * sin(x + PI/9. + t/20. + 99487.5432) * (dist_all) /4. ;

   st.y -= (1. - step(st.y, 4.)) * sin(x + t/20. + 394267.23452) * (dist_all) /4. ;
  //st.y += sin(st.x*frequency*0.768 + t)/8.0 * dist_x_all;
//   st.y += sin(st.x*frequency*2.221 + t)/5.0 * dist_all;
//   st.y += sin(st.x*frequency*3.1122+ t)/2.5 * dist_all;
  st *=  st /5.;
  st += 10. ;

  float cd = circle_dist(st - 16., 200.);
  

  st += cd;

  float fm = circle_dist(st - 16., 500.);

  st += fm;



  float xPos = 32. - 16.*(noise(vec2(u_time/14.)));
  float yPos = 32. + 16.*cos(u_time/15. + 12441.);



  float circ = circle(st + st/20.* noise(st) - vec2(xPos, yPos), 1012.);
 if(circ > 0.) {
//st *= circ * circ * circ - .2*circ;
}

vec3 OLIVE_2 = mix(MINT, vec3(1.), 0.3);

  vec3 color = MINT;
  float check = abs(mod(floor(st.x), 2.) - mod(floor(st.y),2.));
  if (check == 0. && circ < 1.) {
    color = OLIVE_2;
  } else if ( check == 1. && circ < 1.) {

      color = MINT;
  } else if (check == 1. && circ == 1.) {
      color = OLIVE_2;
  }

  return color;

}

vec3 draw_tie_dye(in vec2 st){
    st*=vec2(200.,300.);
    vec2 flr=floor(st);
    vec2 ipos=fract(st);
    st=ipos;
    
    float modX=mod(flr.x,2.);// 0 or 1;
    
    float modY=mod(flr.y,2.);// 0 or 1;
    
    if(modX==0.&&modY==0.){
        
        st=rotate2D(st,PI/4.*7.);
    }else if(modX==1.&&modY==0.){
        st=rotate2D(st,PI/4.*3.);
    }else if(modX==0.&&modY==1.){
        st=rotate2D(st,PI/4.*5.);
    }else if(modX==1.&&modY==1.){
        st=rotate2D(st,PI/4.);
    }
    
    //   //  integer value 0 to 10
    // vec2 ipos = floor(st);
    // // fractional value 0.0 to 1.0
    // vec2 fpos = fract(st);
    // // vec2 fpos = floo
    // // st -= vec2(.5);
    
    float circ_1=circle(st,.5);
    float circ_2=circle(vec2(st.x-.15*sin(PI/4.*7.),st.y),.28);
    
    vec3 color=BROWN_1;
    
    // float nz = noise((ipos * u_time/20. + flr)/5. + u_time/20.);
    float nz=noise(rotate2D(ipos+flr,PI/1.421*(u_time+9345.435)/-50.+20.)/32./5.+u_time/60.)+noise(rotate2D(ipos+flr,PI/1.421*(u_time+12323.412)/150.+12123.12)/32.+u_time/18.)+noise(rotate2D(ipos+flr,PI/1.421+(sin(u_time/300.)+u_time/600.+12323.412)/-80.+12123.12)/32.+u_time/18.)
    ;
    
    //    float pct = smoothstep(1.09, 1.1, nz);
    //    float pct2 = smoothstep(1.49, 1.5, nz);
    //    float pct3 = smoothstep(1.99, 2.0, nz);
    //    color = mix(BROWN_1, PINK, pct);
    //    color = mix(BROWN_1, BROWN_2, pct) * mix(PINK, BROWN_2, pct2);
    
    //    if(nz < 1.1) {
        //        color = mix(COCOA, BROWN_2, pct);
    //    } else if (nz < 1.5 ) {
        //        color = mix(BROWN_2, BROWN_3, pct2);
    //    } else {
        //        color = mix(BROWN_3, BROWN_4, pct3);
    //    }
    
    float pct=smoothstep(.0,1.5,nz);
    float pct2=smoothstep(1.3,1.9,nz);
    float pct3=smoothstep(2.,3.,nz);
    //    color = mix(BROWN_1, PINK, pct);
    //    color = mix(BROWN_1, BROWN_2, pct) * mix(PINK, BROWN_2, pct2);
    
    if(nz<1.){
        color=mix(OLIVE,BROWN_2,pct);
    }else if(nz<2.){
        color=mix(BROWN_2,BROWN_3,pct);
    }else{
        color=mix(BROWN_3,OLIVE,pct);
    }
    
    color=mix(mix(BROWN_5,BROWN_4,pct3/pct),mix(BROWN_3,OLIVE,(pct+pct3)),pct2);
    return color;
    
}

vec3 draw_moons(in vec2 st){
    st*=moon_grid.xy;
    vec2 flr=floor(st);
    vec2 ipos=fract(st);
    st=ipos;
    
    float modX=mod(flr.x,2.);// 0 or 1;
    
    float modY=mod(flr.y,2.);// 0 or 1;
    
    if(modX==0.&&modY==0.){
        
        st=rotate2D(st,PI/4.*7.);
    }else if(modX==1.&&modY==0.){
        st=rotate2D(st,PI/4.*3.);
    }else if(modX==0.&&modY==1.){
        st=rotate2D(st,PI/4.*5.);
    }else if(modX==1.&&modY==1.){
        st=rotate2D(st,PI/4.);
    }
    
    //   //  integer value 0 to 10
    // vec2 ipos = floor(st);
    // // fractional value 0.0 to 1.0
    // vec2 fpos = fract(st);
    // // vec2 fpos = floo
    // // st -= vec2(.5);
    
    float circ_1=circle(st,.5);
    float circ_2=circle(vec2(st.x-.15*sin(PI/4.*7.),st.y),.28);
    
    // vec2 mouse_point = u_mouse_pos/u_resolution;
    
    // float displacement = distance(flr + ipos, mouse_point * 15.);
    // float circ_3 = translated_circle(st, -1. * displacement, 0.5);
    // float circ_4 = translated_circle(vec2(st.x - .15 * sin(PI/4. * 7.), st.y), -1. * displacement,  0.28);
    
    vec3 color=BROWN_1;
    
    // float nz = noise((ipos * u_time/20. + flr)/5. + u_time/20.);
    float nz=noise((ipos+flr)/5.+u_time/20.)+noise((ipos+flr)/32.+u_time/18.);
    
    // if (circ_3 > 0. && circ_4 == 0.) {
        //   color = PINK;
    // }
    if(circ_1>0.&&circ_2==0.){
        // if(nz > 1. && nz < 1.3) {
            //   float prg = smoothstep(1.3, 1., nz);
            //   float rnd = noise(vec2((flr + ipos)*200. +u_time/20.));
            
            //   if(rnd > prg) {
                //     color = mix(PINK, BROWN_2, 0.3);
            //   } else {
                //     color = BROWN_2;
            //   }
        // } else if(nz >= 1.3) {
            //     color = mix(PINK, BROWN_2, 0.3);
        // } else {
            //   color = BROWN_2;
        // }
        color=BROWN_2;
        
        //   float d = distance( gl_FragCoord.xy/u_resolution, u_mouse_pos/u_resolution);
        //   if(d < .1) {
            //       color = vec3(1.);
        //   }
        //   color = mix(vec3(1.), BROWN_2, min(d*d*d + 0.7, 1.));
    }
    return color;
}

vec3 render_about_me_scene(in vec2 st) {
  vec2 u_mouse = vec2(u_mouse_pos.x, u_resolution.y - u_mouse_pos.y);

    vec2 dist = u_mouse/u_resolution - st.xy;
    dist *= u_resolution.x/u_resolution.y;

    float mouse_pct = length(dist);
    float c1 = circle_at_pos_noise(dist, 0.1 * u_hover_about_me.y + u_scene_index.x*30., u_time);
    float c2 = circle_at_pos_noise(dist, 0.1 * u_hover_about_me.x+ u_scene_index.y*30., u_time);
    vec3 color=draw_tie_dye(st);

    if(c1 > 0.) {
        color = draw_moons(st);
    }

    if(c2 > 0.) {
        color = draw_checkerboard(st);
    }

    return color;
}


vec3 render_my_work_scene(in vec2 st) {
  vec2 u_mouse = vec2(u_mouse_pos.x, u_resolution.y - u_mouse_pos.y);

    vec2 dist = u_mouse/u_resolution - st.xy;
    dist *= u_resolution.x/u_resolution.y;

    float mouse_pct = length(dist);
    float c1 = circle_at_pos_noise(dist, 0.1 * u_hover_my_work.y + u_scene_index.x*30., u_time);
    float c2 = circle_at_pos_noise(dist, 0.1 * u_hover_my_work.x+ u_scene_index.z*30., u_time);
    vec3 color=draw_checkerboard(st);

    if(c1 > 0.) {
        color = draw_moons(st);
    }

    if(c2 > 0.) {
        color = draw_tie_dye(st);
    }

    return color;
}

vec3 render_scene_main(in vec2 st) {
    vec2 u_mouse = vec2(u_mouse_pos.x, u_resolution.y - u_mouse_pos.y);

    vec2 dist = u_mouse/u_resolution - st.xy;
    dist *= u_resolution.x/u_resolution.y;

    float mouse_pct = length(dist);
    float c1 = circle_at_pos_noise(dist, 0.1 * u_hover_main.x + u_scene_index.z*30., u_time);
    float c2 = circle_at_pos_noise(dist, 0.1 * u_hover_main.y + u_scene_index.y*30., u_time);
    vec3 color=draw_moons(st);

    if(c1 > 0.) {
        color = draw_tie_dye(st);
    }

    if(c2 > 0.) {
        color = draw_checkerboard(st);
    }

    return color;
}

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.);

    vec3 scene1 = render_scene_main(st) * u_scene_index.x;

    vec3 scene2 = render_about_me_scene(st) * u_scene_index.z;

    vec3 scene3 = render_my_work_scene(st) * u_scene_index.y;

    // if(u_scene_index.z > .0) {
    //     color += mix(render_scene_main(st), render_about_me_scene(st), u_scene_index.z);
    // } else if (u_scene_index.y > 0.) {
    //     color += mix(render_scene_main(st), render_my_work_scene(st), u_scene_index.y);
    // } else {
    //  color += render_scene_main(st);
    // }
    color = scene1 + scene2 + scene3;


  
    
    gl_FragColor=vec4(color,1.);
}