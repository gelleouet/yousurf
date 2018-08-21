/*if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}*/

var _contextSignature
var _canvasSignatureMousePressed = false
var _canvasSignatureLastX
var _canvasSignatureLastY


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
        drawSignature(event.pageX - offset.left, event.pageY - offset.top, false)
    })

    $('#canvas-signature').on('mousemove touchmove', function (event) {
        if (_canvasSignatureMousePressed) {
            var offset = $(this).offset()
            drawSignature(event.pageX - offset.left, event.pageY - offset.top, true)
            $('#log-info').html("X:" + event.pageX + " Y:" + event.pageY + ' left:' + offset.left + ' top:' + offset.top)
        }
    });

    $('#canvas-signature').on('mouseup touchend', function (event) {
        _canvasSignatureMousePressed = false;
    })

    $('#canvas-signature').on('mouseleave', function (event) {
        _canvasSignatureMousePressed = false;
    })
}


/**
 * Dessin de la signature
 */
function drawSignature(x, y, isMouseDown) {
    if (isMouseDown) {
        _contextSignature.beginPath();
        //_contextSignature.strokeStyle = $('#selColor').val();
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