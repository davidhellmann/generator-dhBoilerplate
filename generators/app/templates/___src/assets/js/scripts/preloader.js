const cfg = {
    body: document.getElementsByTagName("body")[0],
    states: {
        loading: 'app_loading',
        interact: 'app_interactive',
        complete: 'app_complete'
    },
}

const stateLoading = () => {
    cfg.body.classList.add(cfg.states.loading)
    // console.log('Loading')
}

const stateInteractive = () => {
    cfg.body.classList.remove(cfg.states.loading)
    cfg.body.classList.add(cfg.states.interact)
    // console.log('Interact')
}

const stateComplete = () => {
    setTimeout(() => {
        cfg.body.classList.remove(cfg.states.interact)
        cfg.body.classList.add(cfg.states.complete)
        // console.log('Complete')
    }, 500)
}

const progressLoader = () => {
    stateLoading()
    stateInteractive()

    document.onreadystatechange = function() {
        if(document.readyState == 'complete') {
            stateComplete()
        }
        //"complete" === document.readyState && stateComplete()
    }
}

progressLoader()
