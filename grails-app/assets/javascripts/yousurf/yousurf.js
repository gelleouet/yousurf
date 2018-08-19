/**
*/
function onDefaultLoad(action) {
    if (window['onLoad_' + action]) {
      window['onLoad_' + action]()
    }
}