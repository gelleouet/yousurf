<%@ page contentType="application/xml" %>
<%@ page defaultCodec="xml" %>

<g:set var="labelColor" value="#6b778c"></g:set>
<g:set var="defaultBorder" value="1px solid lightgrey"></g:set>


<g:applyLayout name="fop/page-paysage">
    <content tag="title">
        <fo:block>
           FORMULAIRE D'INSCRIPTION
        </fo:block>
    </content>

    <content tag="bodyfontsize">10pt</content>

    <content tag="body">
        <fo:block text-align="center" font-size="11pt">
            Du <fo:inline color="${ labelColor }"><g:formatDate date="${ inscription.dateDebut }" format="dd/MM/yyyy"/></fo:inline>
            au <fo:inline color="${ labelColor }"><g:formatDate date="${ inscription.dateFin }" format="dd/MM/yyyy"/></fo:inline>
        </fo:block>


        <fo:block space-before="10pt" font-weight="bold" text-transform="uppercase">
            Coordonnées de l'élève
        </fo:block>

        <fo:table space-before="5pt">
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                         <fo:block>
                             Email : <fo:inline color="${ labelColor }">${ inscription.eleve?.email }</fo:inline>
                         </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            Niveau : <fo:inline color="${ labelColor }">${ inscription.niveau?.libelle }</fo:inline>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                         <fo:block>
                             Nom : <fo:inline color="${ labelColor }">${ inscription.eleve?.nom }</fo:inline>
                         </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                         <fo:block>
                             Prénom : <fo:inline color="${ labelColor }">${ inscription.eleve?.prenom }</fo:inline>
                         </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell number-columns-spanned="2">
                         <fo:block>
                             Adresse : <fo:inline color="${ labelColor }">${ inscription.eleve?.adresse }</fo:inline>
                         </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>
                            Code postal : <fo:inline color="${ labelColor }">${ inscription.eleve?.codePostal }</fo:inline>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            Ville : <fo:inline color="${ labelColor }">${ inscription.eleve?.ville }</fo:inline>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>
                            Date naissance : <fo:inline color="${ labelColor }"><g:formatDate date="${ inscription.eleve?.dateNaissance }" format="dd/MM/yyyy"/></fo:inline>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            Téléphone : <fo:inline color="${ labelColor }">${ inscription.eleve?.telephone }</fo:inline>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>

        <fo:block space-before="10pt" font-weight="bold" text-transform="uppercase">
            Personne à prévenir en cas d'accident
        </fo:block>

        <fo:table space-before="5pt">
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>
                            Nom : <fo:inline color="${ labelColor }">${ inscription.contact?.nom }</fo:inline>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            Prénom : <fo:inline color="${ labelColor }">${ inscription.contact?.prenom }</fo:inline>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>
                            Téléphone : <fo:inline color="${ labelColor }">${ inscription.contact?.telephone }</fo:inline>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            Portable : <fo:inline color="${ labelColor }">${ inscription.contact?.portable }</fo:inline>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>


        <fo:block space-before="10pt" font-weight="bold" text-transform="uppercase">
            Problèmes médicaux à signaler <fo:inline text-transform="none" font-weight="normal">(ex : allergies, traitements, etc.)</fo:inline>
        </fo:block>

        <g:if test="${ inscription.medicaux }">
            <fo:block space-before="5pt" color="${ labelColor }">
                ${ inscription.medicaux[0].libelle }
            </fo:block>
        </g:if>

        <fo:block space-before="10pt" font-weight="bold" text-transform="uppercase">
            Prestation choisie
        </fo:block>

        <fo:block space-before="5pt" border="${ defaultBorder }" fox:border-radius="4pt">
            <fo:table text-align="center">
                <fo:table-body>
                    <fo:table-row font-weight="bold" border-bottom="${ defaultBorder }">
                        <g:each var="formule" in="${ formules }" status="status">
                            <fo:table-cell padding="4pt" border-right="${ status < formules.size()-1 ? defaultBorder : '' }"
                                    background-color="${ inscription.formule?.id == formule.id ? 'lightgrey' : 'transparent' }">
                                <fo:block>
                                    ${ formule.libelle }
                                </fo:block>
                            </fo:table-cell>
                        </g:each>
                    </fo:table-row>
                    <fo:table-row font-size="9pt" border-bottom="${ defaultBorder }">
                        <g:each var="formule" in="${ formules }" status="status">
                            <fo:table-cell padding="4pt" border-right="${ status < formules.size()-1 ? defaultBorder : '' }"
                                           background-color="${ inscription.formule?.id == formule.id ? 'lightgrey' : 'transparent' }">
                                <fo:block>
                                    ${ formule.commentaire }
                                </fo:block>
                            </fo:table-cell>
                        </g:each>
                    </fo:table-row>
                    <fo:table-row font-weight="bold" border-bottom="${ defaultBorder }">
                        <g:each var="formule" in="${ formules }" status="status">
                            <fo:table-cell padding="4pt" border-right="${ status < formules.size()-1 ? defaultBorder : '' }"
                                           background-color="${ inscription.formule?.id == formule.id ? 'lightgrey' : 'transparent' }">
                                <fo:block>
                                    ${ formule.prix as Integer }€
                                </fo:block>
                            </fo:table-cell>
                        </g:each>
                    </fo:table-row>
                    <fo:table-row font-size="9pt" font-weight="bold" color="${ labelColor }">
                        <g:each var="formule" in="${ formules }" status="status">
                            <fo:table-cell padding="4pt" border-right="${ status < formules.size()-1 ? defaultBorder : '' }"
                                           background-color="${ inscription.formule?.id == formule.id ? 'lightgrey' : 'transparent' }">
                                <g:if test="${ formule.arrhe }">
                                    <fo:block>
                                        Arrhes ${ formule.arrhe as Integer }€
                                    </fo:block>
                                </g:if>
                                <g:else>
                                    <fo:block>
                                        -
                                    </fo:block>
                                </g:else>
                            </fo:table-cell>
                        </g:each>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>

        <fo:block font-size="8pt" color="${ labelColor }" space-before="4pt" space-after="4pt">
            Prise en charge collective de 2h, séance d'encadrement d'1h30, équipement fourni en Surf et/ou Stand Up Paddle Balade.
        </fo:block>

        <g:set var="creneauxIds" value="${ inscription.creneaux*.creneau.id }"/>

        <fo:block space-before="5pt" border="${ defaultBorder }" fox:border-radius="4pt">
            <fo:table text-align="center">
                <fo:table-body>
                    <fo:table-row>
                        <g:each var="creneau" in="${ creneaux }" status="status">
                            <fo:table-cell padding="4pt" border-right="${ status < creneaux.size()-1 ? defaultBorder : '' }"
                                           background-color="${ creneau.id in creneauxIds ? 'lightgrey' : 'transparent' }">
                                <fo:block color="${ labelColor }" font-weight="bold">
                                    ${ creneau.libelle }
                                </fo:block>
                            </fo:table-cell>
                        </g:each>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>

        <fo:block space-before="10pt" font-weight="bold" text-transform="uppercase">
            Capacité à nager
        </fo:block>

        <fo:block space-before="5pt">
            Nager au moins 25m et mettre la tête sous l'eau : <fo:inline color="${ labelColor }">${ inscription.brevet25m ? 'oui' : 'non' }</fo:inline>
        </fo:block>


        <fo:block space-before="10pt" font-weight="bold" text-transform="uppercase">
            Autorisation parentale <fo:inline text-transform="none" font-weight="normal">(pour les mineurs uniquement)</fo:inline>
        </fo:block>

        <fo:block space-before="5pt" text-align="justify">
            Je soussigné Mr, Mme <fo:inline color="${ labelColor }">${ inscription.parentaux ? inscription.parentaux[0].libelle : ''  }</fo:inline>
        </fo:block>
        <fo:block text-align="justify">
            Autorise mon enfant à suivre les cours d’enseignement SURF-Stand Up Paddle organisés par YouSurf. <br/>Les parents ou
            tuteurs légaux des enfants inscrits dans la structure déclarent que ces derniers ne présentent aucune
            contre indication à la pratique du Surf et de ses dérivés et n'ont pas d'antécédents médicaux
            susceptibles de créer une incapacité de pratique ; Et d'avoir pris connaissance des conditions et
            règlement ci-jointes et de les accepter.
        </fo:block>


        <fo:block space-before="10pt" font-weight="bold" text-transform="uppercase">
            Attestation
        </fo:block>

        <fo:block space-before="5pt" text-align="justify">
            J’atteste être en possession d'un certificat médical de non contre indication à la pratique du Surf et
            de n'avoir aucun antécédents médicaux susceptibles de créer une incapacité de pratique.
        </fo:block>
        <fo:block text-align="justify">
            Je reconnais avoir pris connaissance des conditions d'assurance et notamment de la possibilité de
            souscrire une assurance complémentaire de personne.
        </fo:block>


        <fo:table table-layout="fixed" width="100%" space-before="10pt">
            <fo:table-column column-number="1" column-width="25%"/>
            <fo:table-column column-number="2" column-width="25%"/>
            <fo:table-column column-number="3" column-width="50%"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>
                            Fait à : <fo:inline color="${ labelColor }">${ inscription.lieuSignature }</fo:inline>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            Le : <fo:inline color="${ labelColor }"><g:formatDate date="${ inscription.dateCreated }" format="dd/MM/yyyy"/></fo:inline>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                            <fo:block>
                                Signature :
                            </fo:block>
                            <fo:block-container absolute-position="absolute" left="2cm">
                                <fo:block border="${ defaultBorder }" fox:border-radius="4pt">
                                    <g:if test="${ inscription.signatures }">
                                        <fo:external-graphic content-height="50px" src="url('${ new String(inscription.signatures[0].data) }')"/>
                                    </g:if>
                                </fo:block>
                            </fo:block-container>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>

    </content>
</g:applyLayout>