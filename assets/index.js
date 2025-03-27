import {patternVariable as M,normalizeEvent as E,bracketAccess as J,createElement as G,decodeString as W,translations as T,newVariant as I,useSignal as O,translate as H,navigate as S,fragment as P,program as V,pattern as L,compare as F,variant as A,locale as U,access as N,signal as C,record as B,style as R,match as K,batch as D,or as Q} from "./runtime.js";export const X=A(1,`Maybe.Just`),Y=A(0,`Maybe.Nothing`),Z=A(1,`Result.Err`),AA=A(1,`Result.Ok`),a=B(`Games.Blocks.Record`),b=B(`Games.Blocks.Theme`),c=B(`NamedColor`),d=B(`ShapeColor`),e=B(`Games.LikePreviousShape.State`),f=()=>{return (window.innerWidth)},g=C(0),h=()=>{return (window.innerHeight)},i=C(0),j=()=>{return D(()=>{g.value=f();i.value=h()})},k=C(false),l=(m,n,o)=>{return ((() => {
      const listener = (event) => {
        o(E(event))
      }

      window.addEventListener(m, listener, n);
      return () => window.removeEventListener(m, listener, n);
    })())},p=()=>{return (F(k.value,false)?(()=>{l(`resize`,true,(q)=>{return j()});(()=>{k.value=true})();return j()})():null)},AB=A(0,`Page.Home`),AC=A(0,`Page.Games`),r=C(new AB()),s=(t)=>{p();return (()=>{r.value=t})()},u=C(``),v=(w)=>{return (()=>{u.value=w})()},x=G(`svg`,{dangerouslySetInnerHTML:{__html:`<path d="M502.472,256.833c-6.491-61.075-40.69-110.46-86.082-144.101c-45.887-34.04-103.296-52.724-157.675-52.76   c-56.443,0.009-91.262,7.173-114.312,17.082c-22.776,9.644-33.774,22.98-39.813,30.843c-24.68,4.029-49.262,18.348-68.77,38.697   C15.107,168.343,0.054,197.423,0,229.381c0,34.97,8.112,64.52,24.299,86.498c14.354,19.596,35.288,32.472,60.207,37.148   c1.638,9.456,5.56,20.003,13.672,29.647c8.412,10.06,19.888,17.383,33.454,22.032c13.584,4.675,29.329,6.836,47.234,6.853h75.084   c1.85,4.729,4.108,9.236,7.217,13.213c7.642,9.785,18.649,16.656,31.834,20.96c13.248,4.33,28.859,6.288,46.995,6.296   c8.909,0,17.348-0.407,24.512-0.752h0.026c5.136-0.274,9.555-0.469,12.698-0.469c9.466,0,18.526-2.302,26.318-6.819   c7.793-4.498,14.257-11.166,18.676-19.357c2.232-4.154,3.702-8.51,4.8-12.902c16.727-3.126,30.604-9.236,41.407-17.028   c12.663-9.121,21.367-20.11,27.283-30.09c11.556-19.552,16.267-41.247,16.285-61.384   C511.982,286.064,508.511,270.08,502.472,256.833z M475.862,352.849c-4.649,7.837-11.352,16.241-20.916,23.121   c-9.581,6.872-22.041,12.38-39.06,14.319l-9.519,1.072l-0.7,9.555c-0.292,4.127-1.576,8.767-3.737,12.76   c-2.506,4.578-5.835,7.962-9.918,10.335c-4.1,2.356-9.006,3.71-14.78,3.718c-4.073,0-8.714,0.24-13.858,0.496l1.922-0.088   l-1.914,0.088c-7.145,0.355-15.178,0.736-23.386,0.736c-21.943,0.035-38.299-3.356-48.747-8.864   c-5.251-2.736-9.06-5.906-11.884-9.511c-2.807-3.622-4.711-7.74-5.782-12.884l-1.904-9.218h-92.812   c-16.01,0-29.302-1.992-39.725-5.578c-10.44-3.622-17.94-8.678-23.28-15.054c-6.96-8.306-9.024-17.32-9.289-25.237l-0.31-10.077   l-10.024-1.044C72.72,328.914,55.354,318.97,42.86,302.18c-12.424-16.815-19.791-41.3-19.791-72.798   c-0.054-24.422,11.874-48.474,29.443-66.875c17.463-18.454,40.46-30.674,59.419-32.463l4.348-0.452l2.966-3.206   c1.328-1.452,2.382-2.851,3.294-4.002c5.986-7.474,12.114-15.806,31.002-24.139c18.845-8.156,50.652-15.222,105.174-15.213   c49.076-0.036,102.278,17.232,143.932,48.217c41.726,31.046,71.78,75.153,77.094,129.578l0.203,2.098l0.922,1.887   c4.844,9.776,8.094,23.608,8.066,38.414C488.932,319.776,484.992,337.451,475.862,352.849z"/>
	<path d="M357.042,146.417h24.059c5.172,0,9.378-4.242,9.378-9.573c0-5.215-4.206-9.43-9.378-9.43h-24.059   c-5.331,0-9.555,4.216-9.555,9.43C347.488,142.175,351.711,146.417,357.042,146.417z"/>
	<path d="M244.21,237.307c0,5.287,4.25,9.564,9.501,9.564c5.162,0,9.475-4.276,9.475-9.564v-51.82   c0-2.399,0.709-2.958,0.886-3.179c3.02-2.966,14.274-2.966,22.164-2.966l0.301,0.106h62.226c1.204,0,2.48-0.106,3.906-0.106   c5.012-0.221,11.202-0.434,13.796,2.072c1.647,1.611,2.604,5.19,2.604,9.988v31.809v1.416c-0.204,6.544-0.24,17.56,7.128,25.042   c2.869,2.958,8.2,6.464,16.896,6.464h48.89c5.136,0,9.352-4.233,9.352-9.555c0-5.198-4.216-9.519-9.352-9.519h-48.89l-3.418-0.806   c-1.736-1.797-1.621-8.332-1.621-11.467v-33.385c0-10.307-2.886-18.277-8.394-23.599c-8.484-8.138-20.022-7.801-27.629-7.483   c-1.258,0-2.302,0.045-3.268,0.045h-31.364c0.372-2.622,0.372-5.26,0.274-7.633v-27.602c0-5.189-4.268-9.476-9.448-9.476   c-5.286,0-9.43,4.286-9.43,9.476v27.752c0,2.222,0,5.738-0.47,6.65c0,0-1.301,0.832-6.314,0.832c-1.442,0-2.992,0-4.684,0   c-12.92-0.16-27.778-0.204-36.615,8.474c-2.887,2.922-6.5,8.208-6.5,16.648V237.307z"/>
	<path d="M213.677,159.709c5.304,0,9.555-4.348,9.555-9.528v-13.594h15.93c5.154,0,9.413-4.268,9.413-9.554   c0-5.162-4.259-9.493-9.413-9.493h-15.93v-10.467c0-5.233-4.251-9.528-9.555-9.528c-5.154,0-9.413,4.294-9.413,9.528v43.108   C204.264,155.361,208.523,159.709,213.677,159.709z"/>
	<path d="M110.841,173.682h39.468c6.438-0.229,12.565-0.229,15.452,2.807c2.559,2.498,3.967,8.111,3.967,16.17v37.051   c0,5.242,4.233,9.546,9.581,9.546c5.154,0,9.458-4.303,9.458-9.546v-7.882h14.886c5.251,0,9.44-4.277,9.44-9.51   c0-5.251-4.188-9.599-9.44-9.599h-14.886v-10.06c0-13.672-3.135-23.351-9.626-29.736c-8.421-8.448-19.8-8.368-28.877-8.288h-39.423   c-5.384,0-9.511,4.312-9.511,9.475C101.33,169.387,105.457,173.682,110.841,173.682z"/>
	<path d="M135.892,229.099c0-5.251-4.365-9.555-9.483-9.555H59.791c-5.26,0-9.555,4.304-9.555,9.555   c0,5.233,4.295,9.528,9.555,9.528h24.148v17.339c0,5.286,4.188,9.519,9.386,9.519c5.402,0,9.59-4.233,9.59-9.519v-17.339h23.494   C131.527,238.627,135.892,234.331,135.892,229.099z"/>
	<path d="M194.576,291.412c1.665,0,3.242,0,4.649,0h76.704c17.498,0,30.772-4.64,39.6-13.884   c13.566-14.363,12.619-35.634,11.919-49.687c-0.124-2.683-0.248-5.206-0.248-7.323c0-5.296-4.25-9.51-9.608-9.51   c-5.18,0-9.368,4.215-9.368,9.51c0,2.408,0.124,5.171,0.248,8.111c0.584,12.256,1.24,27.337-6.854,35.873   c-4.941,5.26-13.682,7.89-25.689,7.89h-76.704c-1.337,0-2.7,0-4.348,0c-15.133-0.23-40.584-0.638-56.753,15.319   c-9.068,8.944-13.681,21.545-13.681,37.396c0,5.153,4.17,9.52,9.484,9.52c5.18,0,9.51-4.366,9.51-9.52   c0-10.768,2.594-18.579,8.049-23.918C161.935,290.934,181.612,291.235,194.576,291.412z"/>
	<path d="M323.96,332.616c0-5.162-4.171-9.502-9.475-9.502H194.107c-5.19,0-9.538,4.34-9.538,9.502   c0,5.268,4.348,9.519,9.538,9.519h36.81v18.985c0,5.323,4.225,9.502,9.458,9.502c5.251,0,9.493-4.179,9.493-9.502v-18.985h64.617   C319.788,342.135,323.96,337.884,323.96,332.616z"/>
	<path d="M377.887,370.065h-4.471v-17.693c0-5.384-4.18-9.528-9.475-9.528c-5.26,0-9.502,4.145-9.502,9.528v17.693   h-32.941c-5.242,0-9.502,4.241-9.502,9.528c0,5.224,4.26,9.448,9.502,9.448h56.39c5.208,0,9.484-4.224,9.484-9.448   C387.371,374.305,383.095,370.065,377.887,370.065z"/>
	<path d="M421.579,323.114v-15.523h3.419c5.357,0,9.599-4.17,9.599-9.43c0-5.251-4.242-9.555-9.599-9.555h-66.459   c-5.225,0-9.511,4.304-9.511,9.555c0,5.26,4.286,9.43,9.511,9.43h43.983v15.523c0,5.358,4.313,9.502,9.556,9.502   C417.311,332.616,421.579,328.472,421.579,323.114z"/>
	<path d="M451.333,347.909h-24.042c-5.304,0-9.546,4.18-9.546,9.467c0,5.286,4.241,9.43,9.546,9.43h24.042   c5.33,0,9.616-4.144,9.616-9.43C460.95,352.089,456.663,347.909,451.333,347.909z"/>`},viewBox:`0 0 512 512`,height:`800px`,width:`800px`}),AD=({y,z,aa,ab})=>{return G(`a`,{"href":z,className:`card w-100 text-decoration-none bg-light`},[G(`div`,{className:`card-img-top text-center bg-white`},[G(`img`,{"src":ab,"alt":y,className:`a`})]),G(`div`,{className:`card-body`},[G(`h5`,{className:`card-title`},[y]),G(`p`,{className:`card-text`},[aa])])])},ac=`/foss-spa-brain-games`,AE=({ad=`https://github.com/hamidb80/foss-spa-brain-games`})=>{return G(`div`,{},[G(`div`,{className:`container`},[G(`div`,{className:`my-3`},[G(`div`,{className:`d-flex justify-content-center`},[G(`div`,{className:`d`},[x])]),G(`div`,{className:`text-center mt-2 text-wrap mx-2`},[H(`misson`)]),G(`div`,{className:`text-center mt-2`},[G(`a`,{"href":ad,className:`btn btn-outline-dark`},[G(`i`,{className:`bi bi-github`})])])]),G(`h1`,{className:`text-center mt-5`},[H(`games`),G(`i`,{className:`bi bi-joystick mx-3`})]),G(`h4`,{className:`text-center text-muted`},[G(`i`,{className:`bi bi-hand-index mx-2`}),H(`howtoplay`)])]),G(`div`,{className:`row mx-lg-5 mx-3 my-4`},[G(`div`,{className:`col-12 col-lg-4 gx-4 gy-3`},[G(AD,{z:`${ac}/games/blocks`,y:`Memory Block`,ab:`/foss-spa-brain-games/assets/memory-blocks_9f81260973b039b14934e004ae682ad5.png`,aa:`choose those blocks that you've seen few seconds ago`})]),G(`div`,{className:`col-12 col-lg-4 gx-4 gy-3`},[G(AD,{z:`${ac}/games/shape-color`,y:`Shape Color`,ab:`/foss-spa-brain-games/assets/shape-color_e3ff9bc9a8766197a231a096b8a43be4.png`,aa:`is the color name same as color of the shape?`})]),G(`div`,{className:`col-12 col-lg-4 gx-4 gy-3`},[G(AD,{z:`${ac}/games/like-previous-shape`,y:`Like Previous?`,ab:`/foss-spa-brain-games/assets/like-previous_2ce805d4f5ea016ee61f77e0f26eebce.png`,aa:`is the shape same as previous shape?`})])])])},ae=(af)=>{return ((() => {
      let last = af[af.length - 1];

      if (last !== undefined) {
        return I(X)((last))
      } else {
        return new Y()
      }
    })())},ag=(ah)=>{return (ah.length)},ai=(aj,ak)=>{return J((()=>{const _0=[];const _1=aj;let _i=-1;for(let al of _1){_i++;const am=_i;const _2=F(al,ak);if(!_2){continue};_0.push(am)};return _0})(),0,X,Y)},an=(ao)=>{return (()=>{const _0=[];const _1=ao;let _i=-1;for(let ap of _1){_i++;const aq=_i;const _2=F(ai(ao,ap),I(X)(aq));if(!_2){continue};_0.push(ap)};return _0})()},ar=(as,at)=>{return (()=>{const _0=[];const _1=as;let _i=-1;for(let au of _1){_i++;_0.push(at(au))};return _0})()},av=(aw,ax)=>{return (aw.slice(-ax))},ay=(az,ba)=>{return (Math.max(az, ba))},AF=A(0,`Games.Blocks.Phases.Ready`),AG=A(0,`Games.Blocks.Phases.Initial`),AH=A(0,`Games.Blocks.Phases.Prepare`),AI=A(0,`Games.Blocks.Phases.Select`),AJ=A(0,`Games.Blocks.Phases.Reveal`),bb=(bc,bd)=>{return (Math.min(bc, bd))},be=(bf,bg)=>{return (Array.from({ length: (bg + 1) - bf }).map((v, $0) => $0 + bf))},bh=(bi)=>{return (Math.floor(bi))},bj=(bk,bl)=>{return ((() => {
      for (let item of bk) {
        if (F(bl, item)) {
          return true
        }
      }

      return false
    })())},bm=(bn)=>{return (new Promise((resolve) => {
      setTimeout(() => {
        resolve(null)
      }, bn)
    }))},bo=(bp,bq)=>{return (bp.slice(0, bq))},br=(bs)=>{return ([...Array(bs).keys()]
        .map(value => ({ value, sort: Math.random() }))
        .sort((a, b) => a.sort - b.sort)
        .map(({ value }) => value))},bt=(bu,bv)=>{return ([...bu, bv])},bw=(bx,by,bz)=>{return (bx.reduce(bz, by))},AK=({ca=3,cb=1000,cc=(cd)=>{return cb + 200 * cd},ce=b({inactiveFill:`#EAEAEA`,correctFill:`#81DAE3`,missedFill:`#888888`,wrongFill:`#FF8989`,selectedFill:`#81DAE3`,sampledFill:`#81DAE3`}),cf=(cg)=>{return K(ae(cg),[[L(Y,[]),()=>{return ca}],[L(X,[M]),(ch)=>{return (ch.succeed?ch.level + 1:(()=>{const ci=ag(an(ar(av(cg,3),N(`level`))));return (F(ci,1)?ay(ch.level - 1,ca):ch.level)})())}]])},cj=0.2,ck=0.1,cl=8})=>{const cm=O([]),cn=O([]),co=O([]),cp=O(0),cq=O(new AF()),cr=()=>{return K(cp.value,[[0,()=>{return 1}],[1,()=>{return 3}],[2,()=>{return 4}],[3,()=>{return 4}],[4,()=>{return 4}],[5,()=>{return 5}],[6,()=>{return 5}],[7,()=>{return 5}],[8,()=>{return 5}],[9,()=>{return 6}],[10,()=>{return 6}],[11,()=>{return 6}],[12,()=>{return 6}],[13,()=>{return 7}],[14,()=>{return 7}],[15,()=>{return 7}],[16,()=>{return 7}],[17,()=>{return 7}],[18,()=>{return 8}],[19,()=>{return 8}],[20,()=>{return 8}],[null,()=>{return 8}]])},cs=()=>{const ct=bb(bb(g.value,i.value),500) - 2 * cl;return ct / (cr() * (1 + cj))},cu=()=>{return cs() * cj},cv=()=>{return cs() * ck},cw=()=>{return cr() * cr()},cx=()=>{return cr() * cs() + (cr() - 1) * cu()},cy=()=>{return cr() * cs() + (cr() - 1) * cu()},cz=()=>{return bw(cn.value,true,(da,db)=>{return da && bj(co.value,db)})},dc=async ()=>{D(()=>{co.value=[];cq.value=new AG()});await bm(0.4 * cb);(()=>{cp.value=cf(cm.value)})();await bm(0.6 * cb);D(()=>{cn.value=bo(br(cw()),cp.value);cq.value=new AH()});await bm(cc(cp.value));return (()=>{cq.value=new AI()})()},dd=(de)=>{return (F(cq.value,new AF())?dc():(F(cq.value,new AI())?(!bj(co.value,de)?(()=>{(()=>{co.value=bt(co.value,de)})();return (!bj(cn.value,de) || ag(co.value) >= ag(cn.value)?(async ()=>{(()=>{cq.value=new AJ()})();await bm(cb);D(()=>{cm.value=bt(cm.value,a({level:cp.value,succeed:cz()}));cq.value=new AG()});return dc()})():null)})():null):null))};return G(P,{},[G(`h2`,{className:`container my-4 text-center`},[(F(cq.value,new AF())?H(`ready`):`${H(`level`)}: ${cp.value}`)]),G(`div`,{className:`d-flex justify-content-center`},[G(`svg`,{"width":`${cx()}`,"height":`${cy()}`,"xmlns":`http://www.w3.org/2000/svg`},[(()=>{const _0=[];const _1=be(0,cw() - 1);let _i=-1;for(let df of _1){_i++;_0.push(G(`rect`,{"x":`${(df % cr()) * (cu() + cs())}`,"y":`${bh(df / cr()) * (cu() + cs())}`,"width":`${cs()}`,"height":`${cs()}`,"rx":`${cv()}`,"ry":`${cv()}`,"fill":K(cq.value,[[L(AF,[]),()=>{return ce.inactiveFill}],[L(AG,[]),()=>{return ce.inactiveFill}],[L(AH,[]),()=>{return (bj(cn.value,df)?ce.sampledFill:ce.inactiveFill)}],[L(AI,[]),()=>{return (bj(co.value,df)?ce.selectedFill:ce.inactiveFill)}],[L(AJ,[]),()=>{return K([bj(cn.value,df),bj(co.value,df)],[[[true,true],()=>{return ce.correctFill}],[[true,false],()=>{return ce.missedFill}],[[false,true],()=>{return ce.wrongFill}],[null,()=>{return ce.inactiveFill}]])}]]),"onClick":()=>{return dd(df)},className:`b`}))};return _0})()])])])},dg=[c({name:`red`,code:`#FF2929`}),c({name:`blue`,code:`#387ADF`}),c({name:`brown`,code:`#A66E38`}),c({name:`green`,code:`#77B254`}),c({name:`pink`,code:`#ED3EF7`}),c({name:`yellow`,code:`#FFB22C`}),c({name:`black`,code:`#313131`})],dh=(di)=>{const dj=di * 1.0;const dk=di * 0.5;return `m ${dk} 0 L ${dj} ${dj} L 0.0 ${dj} L ${dk} 0.0`},dl=(dm)=>{const dn=dm;return `m ${dn} 0 L ${dn} ${dn} L 0 ${dn} L 0 0 L ${dn} 0`},dp=(dq)=>{const dr=dq * 1.0;const ds=dq * 0.5;return `
    M   0  ${ds}
    m ${dr}   0
    a ${ds} ${ds} 0 1 0 -${dr},0
    a ${ds} ${ds} 0 1 0  ${dr},0
    `},dt=(du)=>{return `M ${du * 0.50} ${du * 0.00}
    L ${du * 0.95} ${du * 0.30}
    L ${du * 0.80} ${du * 0.95}
    L ${du * 0.19} ${du * 0.95}
    L ${du * 0.05} ${du * 0.30}
    Z`},dv=(dw)=>{return `M ${dw * 0.50} ${dw * 0.00}
    L ${dw * 1.00} ${dw * 0.25}
    L ${dw * 1.00} ${dw * 0.75}
    L ${dw * 0.50} ${dw * 1.00}
    L ${dw * 0.00} ${dw * 0.75}
    L ${dw * 0.00} ${dw * 0.25}
    Z`},dx=[dh,dl,dp,dt,dv],AL=A(0,`Games.ShapeColor.Flow.Stopped`),AM=A(0,`Games.ShapeColor.Flow.Running`),dy=c({name:``,code:``}),dz=(ea,eb)=>{return Q(Y,Z,ea,eb)},ec=(ed)=>{return ((() => {
      if (ed.length) {
        const item = ed[Math.floor(Math.random() * ed.length)]

        return I(X)((item))
      } else {
        return new Y()
      }
    })())},ee=()=>{return (Math.random())},ef=(eg)=>{return ee() >= eg},eh=(ei)=>{return (ei?1:-1)},AN=({ej=dg,ek=dx,el=200})=>{const em=O(new AL()),en=O(0),eo=O(``),ep=O(dy),eq=O(dy),er=O(dy),es=(et)=>{(()=>{en.value=en.value + eh(F(et,(F(ep.value.name,er.value.name))))})();return eu()},ev=()=>{return dz(ec(ej),dy)},ew=(ex)=>{return K(ec(ek),[[L(X,[M]),(ey)=>{return ey(ex)}],[L(Y,[]),()=>{return ``}]])},eu=()=>{const ez=ev();return D(()=>{em.value=new AM();eo.value=ew(el);ep.value=ez;eq.value=ev();er.value=(ef(0.65)?ez:ev())})},fa=()=>{return (F(em.value,new AL())?eu():null)};fa();return G(P,{},[G(`div`,{className:`container my-4`},[G(`h2`,{className:`text-center`},[H(`score`),`: `,en.value])]),G(`div`,{className:`d-flex justify-content-center`},[G(`div`,{className:`card shadow-sm overflow-hidden`},[G(`div`,{className:`card-body`},[G(`h3`,{className:`card-title text-center`,style:R([[[`color`,eq.value.code]]])},[er.value.name])]),G(`div`,{className:`card-img-top text-center px-5 pb-2`},[G(`svg`,{"width":`${el}`,"height":`${el}`},[G(`path`,{"d":eo.value,"fill":ep.value.code})])]),G(`div`,{className:`card-body d-flex justify-content-between bg-light`},[G(`button`,{"onClick":()=>{return es(false)},className:`btn btn-outline-danger`},[G(`i`,{className:`bi bi-x-lg`})]),G(`button`,{"onClick":()=>{return es(true)},className:`btn btn-outline-success`},[G(`i`,{className:`bi bi-check-lg`})])])])])])},AO=A(0,`Games.LikePreviousShape.Phases.Before`),AP=A(0,`Games.LikePreviousShape.Phases.Ready`),AQ=A(0,`Games.LikePreviousShape.Phases.Hide`),AR=A(0,`Games.LikePreviousShape.Phases.Decide`),fb=(fc)=>{return ``},fd=(fe)=>{return (fe?1:0)},AS=({ff=dg,fg=dx,fh=200,fi=8,fj=0.35,fk=600})=>{const fl=O(0),fm=O(new AO()),fn=O([]),fo=()=>{return K(av(fn.value,2),[[[M,M],(fp,fq)=>{return F(fp,fq)}],[null,()=>{return false}]])},fr=()=>{return dz(ec(ff),dy)},fs=()=>{const ft=dz(ec(fg),fb);return ft(fh)},fu=()=>{return e({dpath:fs(),color:d({fg:fr(),bg:fr()})})},fv=async (fw)=>{await (fw?(()=>{(()=>{fm.value=new AQ()})();return bm(fk)})():null);(()=>{fn.value=bt(fn.value,(ef(1 - fj)?K(ae(fn.value),[[L(Y,[]),()=>{return fu()}],[L(X,[M]),(fx)=>{return fx}]]):fu()))})();return (fw?(()=>{fm.value=new AR()})():(()=>{fm.value=new AP()})())},fy=(fz)=>{return (F(fm.value,new AR())?(()=>{(()=>{fl.value=fl.value + eh(F(fz,fo()))})();return fv(true)})():null)};return K(ae(fn.value),[[L(Y,[]),()=>{return (()=>{fv(false);return G(`span`,{},[`wait`])})()}],[L(X,[M]),(ga)=>{return G(P,{},[G(`div`,{className:`container my-4`},[G(`h2`,{className:`text-center`},[H(`score`),`: `,fl.value])]),G(`div`,{className:`d-flex justify-content-center`},[G(`div`,{className:`card shadow-sm overflow-hidden opacity-${fd(!F(fm.value,new AQ())) * 100}` + ` c`},[G(`div`,{className:`card-body`},[G(`h3`,{className:`card-title text-center`},[(F(fm.value,new AP())?H(`ready`):H(`isTheSame`))])]),G(`div`,{className:`card-img-top text-center px-5 py-4`},[G(`svg`,{"width":`${fh}`,"height":`${fh}`},[G(`path`,{"d":ga.dpath,"fill":ga.color.bg.code,"stroke":ga.color.fg.code,"stroke-width":`${fi}px`})])]),G(`div`,{className:`card-body d-flex justify-content-between bg-light`},[(F(fm.value,new AP())?G(`div`,{className:`d-grid gap-2 w-100`},[G(`button`,{"onClick":()=>{return fv(true)},className:`btn btn-outline-primary`},[H(`start`)])]):G(P,{},[G(`button`,{"onClick":()=>{return fy(false)},className:`btn btn-outline-danger`},[G(`i`,{className:`bi bi-x-lg`})]),G(`button`,{"onClick":()=>{return fy(true)},className:`btn btn-outline-success`},[G(`i`,{className:`bi bi-check-lg`})])]))])])])])}]])},AT=()=>{return K(u.value,[[`blocks`,()=>{return G(AK,{})}],[`shape-color`,()=>{return G(AN,{})}],[`like-previous-shape`,()=>{return G(AS,{})}],[null,()=>{return G(`span`,{},[`not found`])}]])},AU=()=>{return K(r.value,[[L(AB,[]),()=>{return G(AE,{})}],[L(AC,[]),()=>{return G(AT,{})}]])},gb=(gc)=>{return (S(
      gc,
      /* dispatch */ true,
      /* triggerJump */ false,
      /* routeInfo */ null
    ))};T.value={en:{'ready':`ready?`,'level':`Level`,'score':`score`,'isTheSame':`is the same?`,'start':`start`,'games':`Games`,'howtoplay':`Click to Play`,'misson':`the misson of this project is to provide free and open-source brain games, in a way that is customizable and easily self-hostable`}};U.value=`en`;export default ()=>{V(AU,{},AA,[{await:false,path:`/foss-spa-brain-games/`,decoders:[],mapping:[],handler:()=>{return s(new AB())}},{await:false,path:`/foss-spa-brain-games/games/:game`,decoders:[W(AA,Z)],mapping:[`game`],handler:(gd)=>{return (()=>{s(new AC());return v(gd)})()}},{await:false,path:`*`,decoders:[],mapping:[],handler:()=>{return gb(ac)}}])};