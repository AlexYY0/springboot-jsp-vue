// let style;
// let clearWaterMark = () => {
//     if (style) style.remove();
// };
// function createWaterMark(userName) {
//     clearWaterMark();
//     if (!userName) {
//         return;
//     }
//     let width = window.parseInt(document.body.clientWidth);
//     let canvasWidth = width / window.parseInt(width / 320);
//     let fontFamily = window.getComputedStyle(document.body)["font-family"];
//     let canvas = document.createElement("canvas");
//     canvas.width = canvasWidth;
//     canvas.height = 200;
//     let ctx = canvas.getContext("2d");
//     ctx.rotate((-20 * Math.PI) / 180);
//     ctx.font = `18px ${fontFamily}`;
//     ctx.fillStyle = "rgba(8,8,8,.1)";
//     ctx.fillText(userName, 50, 200);
//     let imgSrc = canvas.toDataURL("image/png");
//     style = document.createElement("style");
//     style.innerHTML = `body:before{
//         content: "";
//         width: 100%;
//         height: 100%;
//         display: block;
//         position: absolute;
//         z-index: -1;
//         background-image: url("${imgSrc}");
//     }`;
//     (document.head.append || document.head.appendChild).apply(document.head, [style]);
// }
const domSymbol = Symbol('watermark-dom')

function useWatermark(appendEl) {
    let func = () => {}
    if (!appendEl) {
        console.log(123);
        console.log(appendEl);
        appendEl = document.body;
    }
    const id = domSymbol.toString();
    const clear = () => {
        const domId = document.getElementById(id)
        if (domId) {
            const el = appendEl
            el && el.removeChild(domId)
        }
        window.removeEventListener('resize', func)
    }
    function createWatermark(str) {
        clear()

        const can = document.createElement('canvas')
        can.width = 300
        can.height = 240

        const cans = can.getContext('2d')
        if (cans) {
            cans.rotate((-20 * Math.PI) / 120)
            cans.font = '15px Vedana'
            cans.fillStyle = 'rgba(0, 0, 0, 0.15)'
            cans.textAlign = 'left'
            cans.textBaseline = 'middle'
            cans.fillText(str, can.width / 20, can.height)
        }

        const div = document.createElement('div')
        div.id = id
        div.style.pointerEvents = 'none'
        div.style.top = '0px'
        div.style.left = '0px'
        div.style.position = 'absolute'
        div.style.zIndex = '100000000'
        div.style.width = document.documentElement.clientWidth + 'px'
        div.style.height = document.documentElement.clientHeight + 'px'
        div.style.background = 'url(' + can.toDataURL('image/png') + ') left top repeat'
        const el = appendEl
        el && el.appendChild(div)
        return id
    }

    function setWatermark(str) {
        createWatermark(str)
        func = () => {
            createWatermark(str)
        }
        window.addEventListener('resize', func)
    }

    return { setWatermark, clear }
}
