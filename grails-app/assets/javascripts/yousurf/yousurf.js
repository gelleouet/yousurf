if (typeof jQuery !== 'undefined') {
    (function($) {
        appOnLoad()
    })(jQuery);
}


var _contextSignature
var _canvasSignatureMousePressed = false
var _canvasSignatureLastX
var _canvasSignatureLastY


/**
 * Chargement global d'une page
 *
 */
function appOnLoad() {
    // message de confirmation sur les boutons sensibles
    $(document).on('click', 'button.confirm-button, a.confirm-button', function(event) {
        if (!confirm('Voulez-vous continuer ?')) {
            event.preventDefault()
            return false
        }

        return true
    })
}


/**
*/
function onDefaultLoad(action) {
    if (window['onLoad_' + action]) {
      window['onLoad_' + action]()
    }
}


/**
 * Init le composant canvas signature
*/
function initCanvasSignature() {
    var canvas = document.getElementById('canvas-signature')

    if (canvas) {
        _contextSignature = canvas.getContext('2d')
    }

    $('#undo-signature-button').on('click', function(event) {
        _contextSignature.clearRect(0, 0, _contextSignature.canvas.width, _contextSignature.canvas.height)
        event.preventDefault()
    })

    $('#canvas-signature').on('mousedown touchstart', function(event) {
        var offset = $(this).offset()
        _canvasSignatureMousePressed = true
        drawSignature(event, offset, false)
        event.preventDefault()
    })

    $('#canvas-signature').on('mousemove touchmove', function (event) {
        if (_canvasSignatureMousePressed) {
            var offset = $(this).offset()
            drawSignature(event, offset, true)
        }
        event.preventDefault()
    });

    $('#canvas-signature').on('mouseup touchend', function (event) {
        _canvasSignatureMousePressed = false;
        event.preventDefault()
    })

    $('#canvas-signature').on('mouseleave', function (event) {
        _canvasSignatureMousePressed = false;
        event.preventDefault()
    })
}


/**
 * Dessin de la signature
 */
function drawSignature(event, offset, isMouseDown) {
    var x=-1, y=-1

    if (event.type.indexOf("touch") != -1) {
        x = event.originalEvent.touches[0].pageX - offset.left
        y = event.originalEvent.touches[0].pageY - offset.top
    } else {
        x = event.pageX - offset.left
        y = event.pageY - offset.top
    }

    if (x != -1 && y != -1) {
        if (isMouseDown) {
            _contextSignature.beginPath();
            _contextSignature.lineWidth = 2
            _contextSignature.lineJoin = "round";
            _contextSignature.moveTo(_canvasSignatureLastX, _canvasSignatureLastY);
            _contextSignature.lineTo(x, y);
            _contextSignature.closePath();
            _contextSignature.stroke();
        }
        _canvasSignatureLastX = x
        _canvasSignatureLastY = y
    }
}


/**
 * Vérifie si la signature est présente dans le canvas
 */
function checkEmptySignature(event) {
    var canvas = document.getElementById('canvas-signature')
    var lastSignatureData = $('#signatureData').val()

    if (canvas) {
        var emptyCanvas = document.getElementById('canvas-empty-signature')
        signatureData = canvas.toDataURL()

        if (emptyCanvas.toDataURL() == signatureData) {
            if (!lastSignatureData) {
                AJS.messages.error({
                    body: "La signature est obligatoire !"
                })
                event.preventDefault()
            }
        } else if (signatureData) {
            $('#signatureData').val(signatureData)
        }
    }

}