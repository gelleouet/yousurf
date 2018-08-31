<g:set var="inscription" value="${ yousurf.Inscription.read(inscriptionId) }"/>

<g:applyLayout name="email/default">
    <asset:image src="surf-guidel.jpg" absolute="true" style="width: 100%; height: 150px; margin: 15px 0px"/>

    <h1 style="text-align:center;">Inscription</h1>

    <br/>

    <p>
        Félicitations ${ inscription.eleve.prenom } !
        <br/>
        <br/>
        Vous vous êtes inscrits pour la formule <strong>${ inscription.formule.libelle } (${ inscription.formule.commentaire })</strong>
        du <strong><g:formatDate date="${ inscription.dateDebut }" type="date"/></strong>
        au <strong><g:formatDate date="${ inscription.dateFin }" type="date"/></strong>.
        <br/>
        Cette prestation est facturée <strong>${ inscription.formule.prix as Integer }&euro;</strong>
        <g:if test="${ inscription.formule.arrhe }"> , dont ${ inscription.formule.arrhe as Integer }&euro; d'arrhes.</g:if>
        <br/>
        <br/>
        Veuillez trouver en pièce jointe votre fiche d'inscription complétée et signée.
        <br/>
        <br/>
        Merci et à bientôt !
        <br/>
        <br/>
        Yousurf
    </p>
</g:applyLayout>