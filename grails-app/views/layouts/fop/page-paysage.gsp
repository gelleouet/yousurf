<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:fox="http://xmlgraphics.apache.org/fop/extensions" font-family="Courrier">

<!-- PAGINATION -->
<fo:layout-master-set>
    <fo:simple-page-master master-name="page1" page-height="29.7cm" page-width="21cm" margin-top="0.5cm" margin-bottom="0.5cm" margin-left="1cm" margin-right="1cm">
        <fo:region-body margin-top="3cm" margin-bottom="2cm"/>
        <fo:region-before extent="3cm"/>
        <fo:region-after extent="2cm"/>
    </fo:simple-page-master>
</fo:layout-master-set>


<!-- MISE EN PAGE -->
<fo:page-sequence master-reference="page1" initial-page-number="1">


    <!-- EN-TETE -->
    <fo:static-content flow-name="xsl-region-before">
        <fo:block text-align="center">
            <fo:external-graphic src="url('${ assetPath(src: 'yousurf-logo.png') }')" content-width="3cm"/>
        </fo:block>

        <g:pageProperty name="page.title"/>
    </fo:static-content>



    <!-- PIED-DE-PAGE -->
    <fo:static-content flow-name="xsl-region-after">
        <fo:block font-size="6pt" text-align="center">
            YouSurf SAS -- 1 Galerie Le Belvédère 56520 Guidel-Plages -- 06 83 16 50 08 -- www.yousurf.fr -- contact@yousurf.fr
        </fo:block>
        <fo:block text-align="center">
            <fo:external-graphic src="url('${ assetPath(src: 'yousurf-logo.png') }')" content-width="3cm"/>
        </fo:block>
        <fo:block font-size="6pt" text-align="center" space-before="4pt">
            Page <fo:page-number/> sur <fo:page-number-citation ref-id="end_of_document"/>
        </fo:block>
    </fo:static-content>



    <!-- CORPS PRINCIPAL -->
    <fo:flow flow-name="xsl-region-body">
        <g:pageProperty name="page.body"/>

        <!-- ne pas supprimer pour conserver la pagination -->
        <fo:block id="end_of_document"></fo:block>
    </fo:flow>

</fo:page-sequence>

</fo:root>
