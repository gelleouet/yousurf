/**
*/
function onLoadInscriptionCreate() {
    $(document).on('blur', '#inscription-form #contact\\.telephone', function(event) {
        var $portable = $('#inscription-form #contact\\.portable')
        var $this = $(this)

        if ($this.val() && !$portable.val()) {
            $portable.val($this.val())
        }
    });

    $(document).on('blur', '#inscription-form #contact\\.portable', function(event) {
        var $telephone = $('#inscription-form #contact\\.telephone')
        var $this = $(this)

        if ($this.val() && !$telephone.val()) {
            $telephone.val($this.val())
        }
    });
}