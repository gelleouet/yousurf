<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:fox="http://xmlgraphics.apache.org/fop/extensions" font-family="Ubuntu" color="#172b4d">

<!-- PAGINATION -->
<fo:layout-master-set>
    <fo:simple-page-master master-name="page1" page-height="29.7cm" page-width="21cm" margin-top="0.25cm" margin-bottom="0.5cm" margin-left="1.5cm" margin-right="1.5cm">
        <fo:region-body margin-top="3.5cm" margin-bottom="2cm"/>
        <fo:region-before extent="3cm"/>
        <fo:region-after extent="1.25cm"/>
    </fo:simple-page-master>
</fo:layout-master-set>


<!-- MISE EN PAGE -->
<fo:page-sequence master-reference="page1" initial-page-number="1">


    <!-- EN-TETE -->
    <fo:static-content flow-name="xsl-region-before" text-align="center" font-size="18pt" font-weight="bold">
        <fo:block text-align="center">
            <fo:external-graphic src="url('${report.baseURL}/assets/yousurf-logo.png')" content-width="3.5cm"/>
        </fo:block>

        <g:pageProperty name="page.title"/>
    </fo:static-content>



    <!-- PIED-DE-PAGE -->
    <fo:static-content flow-name="xsl-region-after">
        <fo:table table-layout="fixed" width="100%">
            <fo:table-column column-number="1" column-width="45%"/>
            <fo:table-column column-number="2" column-width="10%"/>
            <fo:table-column column-number="3" column-width="45%"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block font-size="8pt" text-align="center" font-weight="bold">
                            YouSurf SAS -- 1 Galerie Le Belvédère -- 56520 Guidel-Plages
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="center" margin-top="-20pt">
                            <fo:external-graphic src="url('${report.baseURL}/assets/yousurf-logo.png')" content-width="2cm"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block font-size="8pt" text-align="center" font-weight="bold">
                            06 83 16 50 08 -- www.yousurf.fr -- contact@yousurf.fr
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>

        <fo:block font-size="8pt" text-align="center" space-before="2pt" font-weight="bold">
            Page <fo:page-number/> sur <fo:page-number-citation ref-id="end_of_document"/>
        </fo:block>
    </fo:static-content>



    <!-- CORPS PRINCIPAL -->
    <fo:flow flow-name="xsl-region-body" font-size="${ pageProperty(name: 'page.bodyfontsize', default: '12pt') }">
        <g:pageProperty name="page.body"/>

        <!-- ne pas supprimer pour conserver la pagination -->
        <fo:block id="end_of_document"></fo:block>
    </fo:flow>

</fo:page-sequence>

</fo:root>
