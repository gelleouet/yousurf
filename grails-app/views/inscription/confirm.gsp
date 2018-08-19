<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>YouSurf Inscription</title>
</head>
<body pagelayout="aui-page-focused aui-page-size-large">
    <asset:image src="surf-guidel.jpg" class="header-banniere-img"/>

    <div style="text-align:center;">
        <h1 class="header-banniere-text">Inscription</h1>
    </div>

    <p class="text-justify">
        Félicitations ${ inscription.eleve.prenom } !
        <br/>
        <br/>
        Vous vous êtes inscrits pour la formule <strong>${ inscription.formule.libelle } (${ inscription.formule.commentaire })</strong>
        du <strong><g:formatDate date="${ inscription.dateDebut }" type="date"/></strong>
        au <strong><g:formatDate date="${ inscription.dateFin }" type="date"/></strong>.
        <br/>
        Cette prestation est facturée <strong>${ inscription.formule.prix as Integer }€</strong> <g:if test="${ inscription.formule.arrhe }"> , dont ${ inscription.formule.arrhe as Integer }€ d'arrhes.</g:if>
        <br/>
        <br/>
        Vous allez recevoir un mail de confirmation avec la fiche d'inscription en pièce jointe.
        <br/>
        <br/>
        Merci et à bientôt !
        <br/>
        <br/>
        YouSurf
    </p>
</body>
</html>
