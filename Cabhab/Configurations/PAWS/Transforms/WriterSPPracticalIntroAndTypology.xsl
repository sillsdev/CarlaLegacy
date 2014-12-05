<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="intro">
    <section1 id="sIntro">
        <secTitle>Introducción</secTitle>
       <p contentType="ctPracticalIntro">
<xsl:text>Esta gramática</xsl:text>
<endnote id="nPAWS">
             <p>
<xsl:text>La primera versión de esta gramática fue producida por el programa de PAWS </xsl:text>
<citation paren="initial" ref="rPAWS" author="yes" />
<xsl:text>, </xsl:text>
<citation author="no" paren="final" ref="rGrammaticography" />
<xsl:text>.</xsl:text>
</p>
          </endnote>
<xsl:text> es una descripción de cómo se forman las palabras, frases y oraciones en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>. Pretende ser una gramática práctica que sea útil para los miembros de la comunidad hablante, los maestros bilingües, los lingüistas y cualquiera que desee saber más acerca de esta lengua.</xsl:text>
</p>
       <p contentType="ctComparativeIntro">
<xsl:text>Esta gramática</xsl:text>
<endnote id="nPAWSci">
             <p>
<xsl:text>La primera versión de esta gramática fue producida por el programa de PAWS </xsl:text>
<citation paren="initial" ref="rPAWS" author="yes" />
<xsl:text>, </xsl:text>
<citation author="no" paren="final" ref="rGrammaticography" />
<xsl:text>.</xsl:text>
</p>
          </endnote>
<xsl:text> es una descripción del sintaxis y un parte del morfología del </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Proporciona comparaciones al inglés y a veces a otras lenguas así como sirve para documentar la mayor parte de la lengua. Pretende ser una gramática práctica que sea útil para los miembros de la comunidad hablante, los maestros bilingües, los lingüistas y cualquiera que desee saber más acerca de esta lengua.</xsl:text>
</p>
       <p contentType="ctPracticalIntro">
<object type="tComment"> Una vez termine de ingresar los datos necesarios en el programa de PAWS, este archivo puede servir como borrador para preparar una gramática más completa. Esta una versión de ‘Gramática práctica’ que solamente tiene  una introducción básica en cada sección y luego información sobre su lengua.  Le sugerimos que utilice esta versión para agregar glosas en las tablas, completar los ejemplos interlineales y revisar la información sobre su lengua.  Preste especial atención a las líneas que tienen ___ 	, ya que son las partes en que dijo que su lengua hace algo diferente a una de las opciones sugeridas en PAWS, y la prosa puede necesitar revisión. </object>
<object type="tComment">Usted puede también ver o imprimir una versión comparativa de la gramática guardando otra copia del archivo con otro nombre y luego cambiar el campo “contentControlChoice” al final del archivo.</object>
</p>
       <p contentType="ctComparativeIntro">
<object type="tComment"> Una vez que se termina de ingresar los datos al programa de PAWS, este archivo puede servir como borrador para preparar una gramática más completa.  Puesto que está leyendo esta versión, debe haber ya cambiado el contentControlChoice de la gramática comparativa. Para su versión final, puede cambiar la información en español e inglés en cada sección para relacionar a la lengua nacional en su área, si usted quiere.</object>
</p>
       <p>
<object type="tComment">Si usted exporta lo que ha hecho en PAWS sin terminar de ingresar los datos en todas las páginas, parte de la información provista puede ser inexacta porque se basa solamente en respuestas predeterminadas. Las respuestas predeterminadas que se refieren a la posición de elementos en la lengua mostrarán un espacio en blanco:   ___	hasta que usted haya terminado de ingresar los datos en la página correspondiente en el programa de PAWS. Además, faltará más información ya que aún no ha elegido las respuestas apropiadas a las preguntas en PAWS.</object>
</p>
       <p>
<object type="tComment"> NO HAGA CAMBIOS EN ESTE ARCHIVO HASTA HABER TERMINADO DE INGRESAR TODOS LOS DATOS DE SU LENGUA EN EL PROGRAMA DE PAWS, porque el programa eliminará esos cambios.  Se pueden ingresar los datos en PAWS por partes, pero este documento exportado solo se debe revisar y editar una vez se haya terminado de usar PAWS. Después de terminar de contestar todas las preguntas en PAWS, y haya exportado los datos, le sugerimos que guarde este archivo con otro nombre antes de corregirlo.</object>
<object type="tComment">También recomendamos el programa XMLMind MXL Editor que  hace la revisión y la impresión de una versión en PDF mucho más fácil; ya que ofrece aplicaciones complementarias que ayudan a manejar las funciones adicionales del programa XLingPaper usadas para elaborar esta gramática. Puede encontrar más información en http://www.xlingpaper.org/.</object>
</p>
       <p>
<object type="tComment">Los comentarios en rojo en la gramática dan instrucciones específicas que hay que considerar cuando se trabaja. Por favor elimine cada comentario una vez que haya completado esa sección, para que no se incluya en el documento final. Deliberadamente los teníamos que mostrar en la salida como recordatorios para usted y un consultor de lo que todavía necesite hacerse.</object>
</p>
       <p>
<xsl:text>La lengua </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se habla en LOCALIDADES. Hay aproximadamente NÚMERO hablantes. El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es miembro de la familia de lenguas NOMBRE_DE_FAMILIA.</xsl:text>
</p>
        <section2 id="sOrtho">
            <secTitle>Ortografía</secTitle>
            <p>
<xsl:text>Las grafías que se usan para escribir el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> abarcan no solamente las letras que se usan en las palabras de la lengua, sino también otras que se usan en las palabras tomadas del español. En el cuadro </xsl:text>
<exampleRef num="xAlphabet" equal="no" letterOnly="no" />
<xsl:text> se presentan estas grafías en orden alfabético:</xsl:text>
</p>
            <example num="xAlphabet">
<table>
                    <tr>
                        <th>Grafía</th>
                        <th>Ejemplo</th>
                        <th>Glosa</th>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
                        </td>
                        <td align="left">
                            <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
                        </td>
                    </tr>
                </table>
</example>
            <p>
<xsl:text>Véanse,  en el apéndice </xsl:text>
<appendixRef app="aAppdx" />
<xsl:text>, los cuadros de las consonantes y las vocales que comparan la ortografía práctica con el alfabeto fonético.</xsl:text>
</p>
            <p>
<object type="tComment">Agregue las especificaciones para cualquier signo diacrítico u otros símbolos que se usan para marcar tonos.</object>
</p>
        </section2>
        <section2 id="sExamples">
            <secTitle>Estructura usada en los ejemplos</secTitle>
            <p>
<xsl:text>Esta gramática contiene muchas frases y oraciones ilustrativas. La mayor parte de ellas se presentan en un formato interlinearizado que consiste en tres o cuatro líneas, como se muestra en </xsl:text>
<exampleRef num="xEx" equal="no" letterOnly="no" />
<xsl:text>:</xsl:text>
</p>
            <example num="xEx">
<table>
                    <tr>
                        <td align="left">
                            <xsl:text>[palabras vernáculas]</xsl:text>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>palabra</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>palabra</langData>
                        </td>
                        <td align="left">
                            <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>palabra</langData>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <xsl:text>[glosa literal de palabras]</xsl:text>
                        </td>
                        <td align="left">
                            <xsl:text>glosa</xsl:text>
                        </td>
                        <td align="left">
                            <xsl:text>glosa</xsl:text>
                        </td>
                        <td align="left">
                            <xsl:text>glosa</xsl:text>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <xsl:text>[glosa por morfemas]</xsl:text>
                        </td>
                        <td align="left">
                            <xsl:text>PRE-raíz-SUF</xsl:text>
                        </td>
                        <td align="left">
                            <xsl:text>PRE-raíz-SUF</xsl:text>
                        </td>
                        <td align="left">
                            <xsl:text>PRE-raíz-SUF</xsl:text>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <xsl:text>[traducción libre]</xsl:text>
                        </td>
                        <td align="left" colspan="3">
                            <xsl:text>traducción libre de frase u oración</xsl:text>
                        </td>
                    </tr>
                </table>
</example>
            <p>
<xsl:text>Las palabras en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> aparecen en la primera línea. En la segunda línea se presenta una traducción literal palabra por palabra en español, con el significado más cercano a la palabra en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>. Si es necesario usar más de una palabra en español para expresar el significado en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, estas se separan con un punto. Siempre que alguna de las palabras en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tenga más de una parte con significado (morfema), la tercera línea indicará la glosa para cada una de las partes de la palabra, con los prefijos, la raíz, y los sufijos separados por un guión. Esta línea puede ser la más útil para los lingüistas. En la línea final se proporciona la traducción libre del ejemplo completo.</xsl:text>
</p>
            <p>
<object type="tComment">Mencione aquí cualquier diferencia que haya entre su lengua y el español. Por ejemplo, si su lengua no distingue entre el número y/o el género en los sustantivos, como lo hace el español, deberá usar el singular y la forma en masculino para las glosas de las palabras.</object>
</p>
            <p>
<xsl:text>Después de proveer la información sobre la tipología sintáctica de la lengua, la gramática comienza a describir las categorías gramaticales y las frases en las secciones </xsl:text>
<sectionRef sec="sN" />
<xsl:text>-</xsl:text>
<sectionRef sec="sExcl" />
<xsl:text>. Las oraciones básicas se analizan en la sección </xsl:text>
<sectionRef sec="sIP" />
<xsl:text>.  Las construcciones que implican cambios en el orden de las palabras se explican en las secciones </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text>-</xsl:text>
<sectionRef sec="sNeg" />
<xsl:text>. Las construcciones coordinadas se analizan en la sección </xsl:text>
<sectionRef sec="sCoord" />
<xsl:text>, seguidas finalmente de los varios tipos de cláusulas subordinadas en las secciones </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>-</xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>. Al final se incluyen algunos textos para mostrar cómo se forman las construcciones más grandes como párrafos, conversaciones e historias.</xsl:text>
</p>
        </section2>
    </section1>
    <section1 id="sTypology">
        <secTitle>La tipología</secTitle>
        <p>
<xsl:text>El orden básico de palabras en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, en oraciones transitivas, es </xsl:text>
<xsl:choose>
                <xsl:when test="//typology/@wordOrder='SVO'">Sujeto-Verbo-Objeto</xsl:when>
                <xsl:when test="//typology/@wordOrder='SOV'">Sujeto-Objeto-Verbo</xsl:when>
                <xsl:when test="//typology/@wordOrder='VSO'">Verbo-Sujeto-Objeto</xsl:when>
                <xsl:when test="//typology/@wordOrder='VOS'">Verbo-Objeto-Sujeto</xsl:when>
                <xsl:when test="//typology/@wordOrder='OVS'">Objeto-Verbo-Sujeto</xsl:when>
                <xsl:when test="//typology/@wordOrder='OSV'">Objeto-Sujeto-Verbo</xsl:when>
            </xsl:choose>
<xsl:text>, como se muestra en los siguientes ejemplos:</xsl:text>
</p>
        <example num="xTypology.6">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTypology.6</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTypology.6.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
       <xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='unknown'">
<p>
<xsl:text>De acuerdo con la tipología núcleo inicial, el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene preposiciones (véase la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='after'">
<p>
<xsl:text>Al contrario de la tipología núcleo inicial, el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene posposiciones (véase la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//pp/@pPos)='both'">
<p>
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene tanto preposiciones como posposiciones (véase la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='unknown'">
<p>
<xsl:text>De acuerdo con la tipología núcleo final, el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene posposiciones (véase la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='before'">
<p>
<xsl:text>Al contrario de la tipología núcleo final, el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene preposiciones (véase la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
       <p>
<xsl:if test="normalize-space(//np/@possNP)='yes' or normalize-space(//np/@possNP)='yesOnly'">
             <xsl:text>Los posesivos pronominales y los que son frases nominales se presentan </xsl:text>
             <xsl:choose>
                <xsl:when test="//np/@possNounPos='before'">antes</xsl:when>
                <xsl:when test="//np/@possNounPos='after'">después</xsl:when>
                <xsl:when test="//np/@possNounPos='either'">de cualquier lado</xsl:when>
                <xsl:when test="//np/@possNounPos='unknown'">_______</xsl:when>
             </xsl:choose>
             <xsl:text> del sustantivo poseído (véase la sección </xsl:text>
             <sectionRef sec="sNPPoss" />
             <xsl:text>). </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possNP)='no'">
             <xsl:text>Los posesivos pronominales se presentan </xsl:text>
             <xsl:choose>
                <xsl:when test="//np/@possNounPos='before'">antes</xsl:when>
                <xsl:when test="//np/@possNounPos='after'">después</xsl:when>
                <xsl:when test="//np/@possNounPos='either'">de cualquier lado</xsl:when>
                <xsl:when test="//np/@possNounPos='unknown'">_______</xsl:when>
             </xsl:choose>
             <xsl:text> del sustantivo poseído, pero los posesivos que son frases nominales solamente se presentan en </xsl:text>
             <xsl:choose>
                <xsl:when test="//pp/@pPos='before'">una frase preposicional</xsl:when>
                <xsl:when test="//pp/@pPos='after'">una frase posposicional</xsl:when>
                <xsl:when test="//pp/@pPos='both'">una frase adposicional</xsl:when>
             </xsl:choose>
             <xsl:text> que se presenta </xsl:text>
             <xsl:choose>
                <xsl:when test="//np/@possPPPos='before'">antes</xsl:when>
                <xsl:when test="//np/@possPPPos='after'">después</xsl:when>
                <xsl:when test="//np/@possPPPos='either'">de cualquier lado</xsl:when>
                <xsl:when test="//np/@possPPPos='unknown'">_______</xsl:when>
             </xsl:choose>
             <xsl:text> del sustantivo poseído (véase la sección </xsl:text>
             <sectionRef sec="sNPPoss" />
             <xsl:text>). </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possNP)='none'">
             <xsl:text>Los posesivos pronominales y los que son frases nominales solamente se presentan en </xsl:text>
             <xsl:choose>
                <xsl:when test="//pp/@pPos='before'">una frase preposicional</xsl:when>
                <xsl:when test="//pp/@pPos='after'">una frase posposicional</xsl:when>
                <xsl:when test="//pp/@pPos='both'">una frase adposicional</xsl:when>
             </xsl:choose>
             <xsl:text> que se presenta </xsl:text>
             <xsl:choose>
                <xsl:when test="//np/@possPPPos='before'">antes</xsl:when>
                <xsl:when test="//np/@possPPPos='after'">después</xsl:when>
                <xsl:when test="//np/@possPPPos='either'">de cualquier lado</xsl:when>
                <xsl:when test="//np/@possPPPos='unknown'">_______</xsl:when>
             </xsl:choose>
             <xsl:text> del sustantivo poseído (véase la sección </xsl:text>
             <sectionRef sec="sNPPoss" />
             <xsl:text>). </xsl:text>
</xsl:if>
</p>
       <xsl:if test="normalize-space(//np/adjPosOther/@checked)='no'">
<p>
<xsl:text>Las frases adjetivales se presentan </xsl:text>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='no'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='no'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:text> del sustantivo al que modifican (véase la sección </xsl:text>
<sectionRef sec="sNPAdjP" />
<xsl:text>).   </xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no' and normalize-space(//np/adjPosOther/@checked)='yes'">
<p>
<xsl:text>Las frases adjetivales se presentan ___</xsl:text>
<xsl:value-of select="//np/adjPosOther" />
<xsl:text> (véase la sección </xsl:text>
<sectionRef sec="sNPAdjP" />
<xsl:text>).   </xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//np/adjPosOther/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='yes' or normalize-space(//np/adjPosOther/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='yes' or normalize-space(//np/adjPosOther/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes'">
<p>
<xsl:text>Las frases adjetivales se presentan </xsl:text>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='no'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='no'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:text> del sustantivo al que modifican, y también pueden presentarse ___</xsl:text>
<xsl:value-of select="//np/adjPosOther" />
<xsl:text> (véase la sección </xsl:text>
<sectionRef sec="sNPAdjP" />
<xsl:text>).   </xsl:text>
</p>
</xsl:if>   
        <p>
<xsl:if test="normalize-space(//relcl/@exist)='no'">
                <xsl:text>El </xsl:text>
                <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
                <xsl:text> no tiene ningún tipo de cláusula relativa.</xsl:text>
            </xsl:if>
<xsl:if test="normalize-space(//relcl/@exist)='yes'">
                <xsl:text> Las cláusulas relativas aparecen </xsl:text>
                <xsl:choose>
                    <xsl:when test="//relcl/@clausePos='before'">antes</xsl:when>
                    <xsl:when test="//relcl/@clausePos='after'">después</xsl:when>
                    <xsl:when test="//relcl/@clausePos='either'">de cualquier lado</xsl:when>
                    <xsl:when test="//relcl/@clausePos='unknown'">_______</xsl:when>
                </xsl:choose>
               <xsl:text> del sustantivo principal que funciona como el núcleo de una frase nominal (véase la sección </xsl:text>
                <sectionRef sec="sRelCl" />
                <xsl:text>).</xsl:text>
            </xsl:if>
</p>
       <p>
<xsl:text>En el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
<xsl:text>se permite un sujeto tácito en cualquier tipo de oración.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes'">
<xsl:text>parece que el sujeto no se presenta porque solo se ven pronombres dependientes (clíticos pronominales) que se ligan al verbo, pero no es una lengua que en realidad permita la ausencia del sujeto</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropOther/@checked)='no' and normalize-space(//ip/proDropNone/@checked)='no'">
<xsl:text>no se permite la ausencia del sujeto. Siempre debe ser expresado, excepto en enunciados imperativos</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropNone/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropOther/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>no se permite un sujeto tácito. Siempre debe ser expresado aun en enunciados imperativos</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropNone/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>se permite un sujeto tácito  ___</xsl:text>
<xsl:value-of select="//ip/proDropOther" />
<xsl:text> .</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text>aunque se permite un sujeto tácito  ___</xsl:text>
<xsl:value-of select="//ip/proDropOther" />
<xsl:text> y también en enunciados imperativos</xsl:text>
</xsl:if>
<xsl:text> (véase la sección </xsl:text>
<sectionRef sec="sIPProDrop" />
<xsl:text>).</xsl:text>
<xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
             <xsl:text></xsl:text>
             <xsl:choose>
                <xsl:when test="//ip/@proDropObject='no'"> No</xsl:when>
                <xsl:when test="//ip/@proDropObject='yes'"> También</xsl:when>
             </xsl:choose>
             <xsl:text> se permite un objeto tácito.</xsl:text>
          </xsl:if>
</p>
       
        <xsl:if test="normalize-space(//ip/@aux)='no'">
<p>
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene ningún auxiliar verbal que se escriba como palabra independiente (véase la sección </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//ip/@aux)='yes'">
<p>
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene algunos auxiliares verbales que se escriben como palabras independientes. Estos se presentan </xsl:text>
<xsl:choose>
                <xsl:when test="//typology/@wordOrder='SVO'">antes</xsl:when>
                <xsl:when test="//typology/@wordOrder='SOV'">después</xsl:when>
                <xsl:when test="//typology/@wordOrder='VSO'">antes</xsl:when>
                <xsl:when test="//typology/@wordOrder='VOS'">antes</xsl:when>
                <xsl:when test="//typology/@wordOrder='OVS'">después</xsl:when>
                <xsl:when test="//typology/@wordOrder='OSV'">después</xsl:when>
            </xsl:choose>
<xsl:text> del verbo principal (véase la sección </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
       <p>
<xsl:if test="normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/mainYNWordOther/@checked)='no' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNWordOther/@checked)='no'">
             <xsl:text>En preguntas de respuesta sí/no, hay un indicador o un complementador de la pregunta y se presenta </xsl:text>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
<xsl:text>de cualquier lado </xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
             <xsl:text> del resto de la pregunta (véase la sección </xsl:text>
             <sectionRef sec="sQuesYN" />
             <xsl:text>).  </xsl:text>
          </xsl:if>
<xsl:if test="normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='no' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
             <xsl:text>En preguntas de respuesta sí/no, hay un indicador o un complementador de la pregunta y se presenta ___</xsl:text>
             <xsl:value-of select="//q/mainYNWordOther" />
<xsl:text> (véase la sección </xsl:text>
             <sectionRef sec="sQuesYN" />
             <xsl:text>).  </xsl:text>
          </xsl:if>
<xsl:if test="normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordBefore/@checked)='yes' or normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' or normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordBefore/@checked)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
             <xsl:text>En preguntas de respuesta sí/no, hay un indicador o un complementador de la pregunta y se presenta </xsl:text>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
<xsl:text>de cualquier lado </xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
             <xsl:text> del resto de la pregunta, o en lugar uno puede presentarse ___</xsl:text>
<xsl:value-of select="//q/mainYNWordOther" />
<xsl:text> (véase la sección </xsl:text>
             <sectionRef sec="sQuesYN" />
             <xsl:text>).   </xsl:text>
          </xsl:if>
<xsl:text>  En preguntas de respuesta abierta, una frase interrogativa </xsl:text>
<xsl:choose>
             <xsl:when test="//q/@contFront='no'">no se desplaza al principio de la cláusula; simplemente permanece en su lugar</xsl:when>
             <xsl:when test="//q/@contFront='after'">puede permanecer en su lugar o puede desplazarse a la posición inmediatamente antes que el verbo</xsl:when>
             <xsl:when test="//q/@contFront='before'">se desplaza al principio de la cláusula</xsl:when>
             <xsl:when test="//q/@contFront='unknown'">_______</xsl:when>
          </xsl:choose>
<xsl:text> (véase la sección </xsl:text>
<sectionRef sec="sQuesContent" />
<xsl:text>).</xsl:text>
</p>
       

          <p>
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
                <xsl:when test="//typology/@case='none'"> no tiene ningún sistema de caso. El mismo sistema de pronombres se puede utilizar en cualquier posición de la oración y no hay un indicador en los sustantivos o en ningún modificador del sustantivo basado en su posición de la oración</xsl:when>
                <xsl:when test="//typology/@case='nominative'"> tiene un sistema de caso del nominativo-acusativo. Los sujetos de los verbos intransitivos y transitivos se indican de la misma manera y utilizan el mismo sistema de pronombres, pero los objetos de los verbos transitivos se indican de una manera diferente</xsl:when>
                <xsl:when test="//typology/@case='ergative'"> tiene un sistema de caso ergativo-absolutivo. Los sujetos de los verbos intransitivos y los objetos de los verbos transitivos se indican de la misma manera y utilizan el mismo sistema de pronombres, pero los sujetos de los verbos transitivos se indican de una manera diferente</xsl:when>
                <xsl:when test="//typology/@case='split'"> tiene un sistema de caso de ergatividad escindida. La lengua sigue normalmente el sistema de caso del nominativo-acusativo, pero el sistema ergativo-absolutivo se utiliza bajo ciertas condiciones gramaticales</xsl:when>
             </xsl:choose>
<xsl:text> (véase la sección </xsl:text>
<sectionRef sec="sNPCase" />
<xsl:text>).</xsl:text>
<xsl:if test="normalize-space(//typology/@case)!='none'">
<xsl:text></xsl:text>
<xsl:choose>
                <xsl:when test="//np/@caseN='yes'"> En los sustantivos y posiblemente sus modificadores se indica el caso así como los pronombres</xsl:when>
                <xsl:when test="//np/@caseN='no'"> En los sustantivos no se indica el caso.  Solamente los pronombres lo hacen</xsl:when>
             </xsl:choose>
</xsl:if>
<xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseDefault)='nominative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseDefault)='nominative'">
                <xsl:text>  El caso nominativo es un caso predeterminado (no indicado).</xsl:text>
             </xsl:if>
</p>
       <p>
<xsl:text>En el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
          <xsl:when test="//typology/@classifier='no'"> no hay ningún sistema de clases de sustantivos ni clasificadores.</xsl:when>
          <xsl:when test="//typology/@classifier='yesAgr'"> hay un sistema de clases de sustantivos, como se explica en detalle en la siguiente sección.</xsl:when>
          <xsl:when test="//typology/@classifier='yesSpecific'"> hay un sistema de clasificadores para sustantivos, como se exlica en detalle en la  siguiente sección.</xsl:when>
          <xsl:when test="//typology/@classifier='yesType'"> hay un sistema de clasificadores para sustantivos, como se exlica en detalle en la  siguiente sección.</xsl:when>
       </xsl:choose>
</p>
    </section1>
   <xsl:if test="normalize-space(//typology/@classifier)!='no'">
<section1 id="sClassifiers">
      <secTitle>Clases de sustantivo y clasificadores</secTitle>
      <p contentType="ctPracticalIntro">
<xsl:text>Las clases de sustantivo y clasificadores marcan los sustantivos por su forma, posición u otras características. En un sistema de clases de sustantivo, los indicadores de clase pueden convertirse en un sistema de acuerdo que requiere concordancia en la frase nominal e incluso con el verbo. En cambio, unas lenguas pueden tener un sistema de clasificadores, a veces llamado palabras de contador o palabras de medida.  Estos clasificadores son palabras o morfemas que acompañan a los sustantivos cuando el sustantivo es contado o especificado y sirven para clasificar el sustantivo dependiendo del tipo de su referente. El clasificador se relaciona con el sustantivo contado o especificado, pero no hay otra concordancia dentro de la frase nominal u oración. En un sistema simple de clasificadores, se presentan afijos clasificadores en sustantivos de ciertas características particulares que pueden agruparlos en clases, por ejemplo, como animales, insectos o líquidos. En este sistema más sencillo, los clasificadores no concuerdan en la frase nominal, solamente acompañan a los sustantivos; los pronombres de tercera persona para estas clases de sustantivos pueden presentar distinciones similares a las de los clasificadores.
</xsl:text>
</p>
      <p contentType="ctComparativeIntro">
<xsl:text>Algunas lenguas tiene un sistema de clases de sustantivo que indican su forma, posición u otras características.  En muchos de estas lenguas, el indicador de clase es un tipo de concordancia que es requerido entre todos los modificadores en la frase nominal y también con el verbo.  Por eso, los quantificadores, artículos, demostrativs, adjetivos y verbos posiblemente necesitan ser marcado con un indicador de clase appropriado.</xsl:text>
</p> 
      <p contentType="ctComparativeIntro">
<xsl:text>Las lenguas Bantu que se habla en Africa tienen el sistema de clases de sustantivo más conocido en el mundo.  Estas lenguas tienen hasta 22 clases distintas, que son representadas por números.  Aproximadamente la mitad está para los sustantivos singulares solamente y un número igual para los nombres en plural solamente. Otros están para los sustantivos totales o abstractos o para los lugares.</xsl:text>
</p>     
      <p contentType="ctComparativeIntro">
<xsl:text>En cambio, unas lenguas pueden tener un sistema de clasificadores, a veces llamado palabras de contador o palabras de medida.  Estos clasificadores son palabras o morfemas que acompañan a los sustantivos cuando el sustantivo es contado o especificado y sirven para clasificar el sustantivo dependiendo del tipo de su referente. Algunas lenguas tienen varios cientos clasificadores. El clasificador se relaciona con el sustantivo contado o especificado, pero no hay otra concordancia dentro de la frase nominal u oración.  Los clasificadores son una característica importante de muchas lenguas del este asiático.</xsl:text>
</p>
      <p contentType="ctComparativeIntro">
<xsl:text>Hay también un sistema de clasificadores más simple en que hay clasificador afijos que son derivados de un sustantivo genérico o de un pronombre y estos deben aparecer con muchos de los sustantivos que refiere a animales, insectos, líquidos, árboles, objetos de madera o objetos que están básicamente redondos. En este sistema más sencillo, los clasificadores no concuerdan en la frase nominal, solamente acompañan a los sustantivos.  Este tipo de sistema típicamente utiliza nombres en vez de números para identificar los clasificadores.</xsl:text>
</p>     
 
      <xsl:if test="normalize-space(//typology/@classifier)='yesSpecific'">
<p>
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene un sistema de clasificadores en que las clases de sustantivos son distinguidas.  Estos clasificadores se presentan con los sustantivos cuando el sustantivo es contado o especificado, pero no hay más concordancia en la frase nominal o la oración.</xsl:text>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//typology/@classifier)='yesType'">
<p>
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene un sistema de clasificadores simple en que las clases de sustantivos son distinguidas, pero no hay concordancia en la frase nominal o la oración.</xsl:text>
</p>
</xsl:if> 
      <xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene un sistema de clasificadores que refleja concordancia entre todas las partes en la frase nominal y también entre la frase nominal sujeto u objeto y el verbo .  Los clasificadores se identifican por </xsl:text>
<xsl:choose>
         <xsl:when test="//typology/@classifierNum='number'">números de clase. </xsl:when>
         <xsl:when test="//typology/@classifierNum='type'">nombres de clases.  <xsl:choose>
            <xsl:when test="//typology/@classifierTypeNumAgr='no'">Las clases no se distinguen entre singular y plural por lo que hay solamente una clase para cada tipo de sustantivo.</xsl:when>
            <xsl:when test="//typology/@classifierTypeNumAgr='yes'">Las clases se distinguen entre singular y plural para cada tipo de sustantivo.</xsl:when>
         </xsl:choose>
</xsl:when>
      </xsl:choose>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//typology/@classifier)='yesType' or normalize-space(//typology/@classifier)='yesSpecific'">
<p>
<xsl:text>Los clasificadores en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran en el siguiente cuadro:</xsl:text>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//typology/@classifier)='yesSpecific'">
<example num="xClassifiers.22">
<table border="1">
            <caption>
               <xsl:text>Clasificadores para sustantivos por clase</xsl:text>
            </caption>
            <tr>
               <th>
                  Clase
               </th>
               <th>Clasificador</th>
            </tr>
            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//typology/classifierHumanExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.1" select="string-length(normalize-space($sExampleValue0.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.1 != 0 and $sExampleValue0.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>humanos</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>humanos</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//typology/classifierAnimalExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.1" select="string-length(normalize-space($sExampleValue1.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.1 != 0 and $sExampleValue1.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>animales</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>animales</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//typology/classifierBirdExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>aves</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>aves</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//typology/classifierBoatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.1" select="string-length(normalize-space($sExampleValue3.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.1 != 0 and $sExampleValue3.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>barcos</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>barcos</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue4.1">
<xsl:value-of select="translate(string(//typology/classifierClothingExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.1" select="string-length(normalize-space($sExampleValue4.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.1 != 0 and $sExampleValue4.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>ropa</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>ropa</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue5.1">
<xsl:value-of select="translate(string(//typology/classifierTreeExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.1" select="string-length(normalize-space($sExampleValue5.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.1 != 0 and $sExampleValue5.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>árboles</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>árboles</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue6.1">
<xsl:value-of select="translate(string(//typology/classifierLongThinExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.1" select="string-length(normalize-space($sExampleValue6.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.1 != 0 and $sExampleValue6.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>artículos largos y delgados</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>artículos largos y delgados</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue7.1">
<xsl:value-of select="translate(string(//typology/classifierLongWavyExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.1" select="string-length(normalize-space($sExampleValue7.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.1 != 0 and $sExampleValue7.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>artículos largos y ondulados</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>artículos largos y ondulados</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue8.1">
<xsl:value-of select="translate(string(//typology/classifierFlatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.1" select="string-length(normalize-space($sExampleValue8.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.1 != 0 and $sExampleValue8.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>artículos planos</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>artículos planos</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue9.1">
<xsl:value-of select="translate(string(//typology/classifierCylindricalExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.1" select="string-length(normalize-space($sExampleValue9.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.1 != 0 and $sExampleValue9.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>artículos cilíndricos</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>artículos cilíndricos</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue10.1">
<xsl:value-of select="translate(string(//typology/classifierMechanicalExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.1" select="string-length(normalize-space($sExampleValue10.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.1 != 0 and $sExampleValue10.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>artículos mecánicos</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>artículos mecánicos</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue11.1">
<xsl:value-of select="translate(string(//typology/classifierGenericExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.1" select="string-length(normalize-space($sExampleValue11.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.1 != 0 and $sExampleValue11.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>genérico</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>genérico</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue12.1">
<xsl:value-of select="translate(string(//typology/classifierOtherExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12.1" select="string-length(normalize-space($sExampleValue12.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength12.1 != 0 and $sExampleValue12.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>ESCRIBA LA GLOSA</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>ESCRIBA LA GLOSA</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
         </table>
</example>
</xsl:if>
      
      <xsl:if test="normalize-space(//typology/@classifier)='yesType'">
<example num="xClassifiers.24">
<table border="1">
            <caption>
               <xsl:text>Clasificadores para sustantivos por clase</xsl:text>
            </caption>
            <tr>
               <th>
                  Clase
               </th>
               <th>Clasificador</th>
            </tr>
            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//typology/classAnimalExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.1" select="string-length(normalize-space($sExampleValue0.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.1 != 0 and $sExampleValue0.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>animal</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>animal</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//typology/classInsectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.1" select="string-length(normalize-space($sExampleValue1.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.1 != 0 and $sExampleValue1.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>insecto</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>insecto</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//typology/classLiquidExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>líquido</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>líquido</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//typology/classRoundExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.1" select="string-length(normalize-space($sExampleValue3.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.1 != 0 and $sExampleValue3.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>redondo</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>redondo</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue4.1">
<xsl:value-of select="translate(string(//typology/classCylinderExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.1" select="string-length(normalize-space($sExampleValue4.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.1 != 0 and $sExampleValue4.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>cilíndrico</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>cilíndrico</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue5.1">
<xsl:value-of select="translate(string(//typology/classSphereExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.1" select="string-length(normalize-space($sExampleValue5.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.1 != 0 and $sExampleValue5.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>esférico</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>esférico</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue6.1">
<xsl:value-of select="translate(string(//typology/classTreeExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.1" select="string-length(normalize-space($sExampleValue6.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.1 != 0 and $sExampleValue6.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>árbol</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>árbol</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue7.1">
<xsl:value-of select="translate(string(//typology/classWoodExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.1" select="string-length(normalize-space($sExampleValue7.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.1 != 0 and $sExampleValue7.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>madera</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>madera</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue8.1">
<xsl:value-of select="translate(string(//typology/classOtherExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.1" select="string-length(normalize-space($sExampleValue8.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.1 != 0 and $sExampleValue8.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>ESCRIBA LA GLOSA</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>ESCRIBA LA GLOSA</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
         </table>
</example>
</xsl:if>
      
      
      <xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Los indicadores de clase de sustantivo en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran en el siguiente cuadro:</xsl:text>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//typology/@classifierNum)='type' and normalize-space(//typology/@classifierTypeNumAgr)='no'">
<example num="xClassifiers.28">
<table border="1">
            <caption>
               <xsl:text>Inidcadores de clase de sustantivos por nombre de clase</xsl:text>
            </caption>
            <tr>
               <th>
                  Nombre
               </th>
               <th>Indicador de clase</th>
            </tr>
            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//typology/classAnimalExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.1" select="string-length(normalize-space($sExampleValue0.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.1 != 0 and $sExampleValue0.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>animal</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>animal</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//typology/classInsectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.1" select="string-length(normalize-space($sExampleValue1.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.1 != 0 and $sExampleValue1.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>insecto</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>insecto</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>    
            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//typology/classLiquidExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>líquido</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>líquido</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>  
            <xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//typology/classRoundExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.1" select="string-length(normalize-space($sExampleValue3.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.1 != 0 and $sExampleValue3.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>redondo</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>redondo</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue4.1">
<xsl:value-of select="translate(string(//typology/classCylinderExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.1" select="string-length(normalize-space($sExampleValue4.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.1 != 0 and $sExampleValue4.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>cilíndrico</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>cilíndrico</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue5.1">
<xsl:value-of select="translate(string(//typology/classSphereExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.1" select="string-length(normalize-space($sExampleValue5.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.1 != 0 and $sExampleValue5.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>esférico</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>esférico</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue6.1">
<xsl:value-of select="translate(string(//typology/classTreeExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.1" select="string-length(normalize-space($sExampleValue6.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.1 != 0 and $sExampleValue6.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>árbol</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>árbol</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue7.1">
<xsl:value-of select="translate(string(//typology/classWoodExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.1" select="string-length(normalize-space($sExampleValue7.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.1 != 0 and $sExampleValue7.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>madera</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>madera</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue8.1">
<xsl:value-of select="translate(string(//typology/classOtherExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.1" select="string-length(normalize-space($sExampleValue8.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.1 != 0 and $sExampleValue8.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>general</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>general</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
         </table>
</example>
</xsl:if>
      <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//typology/@classifierNum)='type' and normalize-space(//typology/@classifierTypeNumAgr)='yes'">
<example num="xClassifiers.30">
<table border="1">
            <caption>
               <xsl:text>Indicadores de clase de sustantivo por nombre de clase</xsl:text>
            </caption>
            <tr>
               <th>Nombre</th>
               <th>Concordancia de número</th>
               <th>Indicador</th>
            </tr>
            <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//typology/classAnimalSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>animal</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>animal</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//typology/classAnimalPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>animal</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>animal</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//typology/classInsectSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>insecto</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>insecto</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//typology/classInsectPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>insecto</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>insecto</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>    
            <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//typology/classLiquidSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>líquido</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>líquido</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//typology/classLiquidPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>líquido</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>líquido</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>  
            <xsl:variable name="sExampleValue6.2">
<xsl:value-of select="translate(string(//typology/classRoundSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.2" select="string-length(normalize-space($sExampleValue6.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.2 != 0 and $sExampleValue6.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>redondo</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>redondo</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue7.2">
<xsl:value-of select="translate(string(//typology/classRoundPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.2" select="string-length(normalize-space($sExampleValue7.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.2 != 0 and $sExampleValue7.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>redondo</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>redondo</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue8.2">
<xsl:value-of select="translate(string(//typology/classCylinderSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.2" select="string-length(normalize-space($sExampleValue8.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.2 != 0 and $sExampleValue8.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>cilíndrico</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>cilíndrico</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue9.2">
<xsl:value-of select="translate(string(//typology/classCylinderPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.2" select="string-length(normalize-space($sExampleValue9.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.2 != 0 and $sExampleValue9.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>cilíndrico</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>cilíndrico</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue10.2">
<xsl:value-of select="translate(string(//typology/classSphereSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.2" select="string-length(normalize-space($sExampleValue10.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.2 != 0 and $sExampleValue10.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>esférico</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>esférico</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue11.2">
<xsl:value-of select="translate(string(//typology/classSpherePlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.2" select="string-length(normalize-space($sExampleValue11.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.2 != 0 and $sExampleValue11.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>esférico</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>esférico</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue12.2">
<xsl:value-of select="translate(string(//typology/classTreeSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12.2" select="string-length(normalize-space($sExampleValue12.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength12.2 != 0 and $sExampleValue12.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>árbol</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>árbol</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue13.2">
<xsl:value-of select="translate(string(//typology/classTreePlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13.2" select="string-length(normalize-space($sExampleValue13.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength13.2 != 0 and $sExampleValue13.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>árbol</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>árbol</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue14.2">
<xsl:value-of select="translate(string(//typology/classWoodSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14.2" select="string-length(normalize-space($sExampleValue14.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength14.2 != 0 and $sExampleValue14.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>madera</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>madera</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue15.2">
<xsl:value-of select="translate(string(//typology/classWoodPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength15.2" select="string-length(normalize-space($sExampleValue15.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength15.2 != 0 and $sExampleValue15.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength15.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>madera</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>madera</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue16.2">
<xsl:value-of select="translate(string(//typology/classOtherSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength16.2" select="string-length(normalize-space($sExampleValue16.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength16.2 != 0 and $sExampleValue16.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength16.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>ESCRIBA LA GLOSA</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>ESCRIBA LA GLOSA</xsl:text>
               </td>
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue17.2">
<xsl:value-of select="translate(string(//typology/classOtherPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength17.2" select="string-length(normalize-space($sExampleValue17.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength17.2 != 0 and $sExampleValue17.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength17.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>ESCRIBA LA GLOSA</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>ESCRIBA LA GLOSA</xsl:text>
               </td>
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
         </table>
</example>
</xsl:if>
      <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//typology/@classifierNum)='number'">
<example num="xClassifiers.32">
<table border="1">
            <caption>
               <xsl:text>Indicadores de clase de sustantivo por número</xsl:text>
            </caption>
            <tr>
               <th>
                  Número de clase
               </th>
               <th>Indiicador</th>
               <th>Concordancia de número</th>
            </tr>
            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//typology/class1Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.1" select="string-length(normalize-space($sExampleValue0.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.1 != 0 and $sExampleValue0.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>1</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class1agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class1agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class1agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>1</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class1agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class1agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class1agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//typology/class2Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.1" select="string-length(normalize-space($sExampleValue1.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.1 != 0 and $sExampleValue1.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>2</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class2agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class2agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class2agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
                  </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>2</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class2agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class2agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class2agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
                  </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//typology/class3Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>3</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class3agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class3agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class3agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>3</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class3agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class3agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class3agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//typology/class4Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.1" select="string-length(normalize-space($sExampleValue3.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.1 != 0 and $sExampleValue3.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>4</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class4agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class4agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class4agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>4</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class4agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class4agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class4agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue4.1">
<xsl:value-of select="translate(string(//typology/class5Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.1" select="string-length(normalize-space($sExampleValue4.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.1 != 0 and $sExampleValue4.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>5</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class5agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class5agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class5agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>5</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class5agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class5agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class5agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue5.1">
<xsl:value-of select="translate(string(//typology/class6Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.1" select="string-length(normalize-space($sExampleValue5.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.1 != 0 and $sExampleValue5.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>6</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class6agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class6agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class6agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>6</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class6agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class6agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class6agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue6.1">
<xsl:value-of select="translate(string(//typology/class7Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.1" select="string-length(normalize-space($sExampleValue6.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.1 != 0 and $sExampleValue6.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>7</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class7agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class7agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class7agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>7</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class7agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class7agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class7agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue7.1">
<xsl:value-of select="translate(string(//typology/class8Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.1" select="string-length(normalize-space($sExampleValue7.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.1 != 0 and $sExampleValue7.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>8</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class8agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class8agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class8agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>8</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class8agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class8agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class8agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue8.1">
<xsl:value-of select="translate(string(//typology/class9Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.1" select="string-length(normalize-space($sExampleValue8.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.1 != 0 and $sExampleValue8.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>9</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class9agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class9agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class9agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>9</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class9agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class9agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class9agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue9.1">
<xsl:value-of select="translate(string(//typology/class10Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.1" select="string-length(normalize-space($sExampleValue9.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.1 != 0 and $sExampleValue9.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>10</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class10agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class10agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class10agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>10</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class10agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class10agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class10agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue10.1">
<xsl:value-of select="translate(string(//typology/class11Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.1" select="string-length(normalize-space($sExampleValue10.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.1 != 0 and $sExampleValue10.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>11</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class11agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class11agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class11agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>11</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class11agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class11agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class11agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue11.1">
<xsl:value-of select="translate(string(//typology/class12Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.1" select="string-length(normalize-space($sExampleValue11.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.1 != 0 and $sExampleValue11.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>12</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class12agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class12agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class12agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>12</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class12agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class12agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class12agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue12.1">
<xsl:value-of select="translate(string(//typology/class13Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12.1" select="string-length(normalize-space($sExampleValue12.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength12.1 != 0 and $sExampleValue12.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>13</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class13agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class13agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class13agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>13</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class13agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class13agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class13agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue13.1">
<xsl:value-of select="translate(string(//typology/class14Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13.1" select="string-length(normalize-space($sExampleValue13.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength13.1 != 0 and $sExampleValue13.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>14</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class14agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class14agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class14agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>14</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class14agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class14agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class14agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue14.1">
<xsl:value-of select="translate(string(//typology/class15Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14.1" select="string-length(normalize-space($sExampleValue14.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength14.1 != 0 and $sExampleValue14.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>15</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class15agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class15agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class15agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>15</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class15agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class15agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class15agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue15.1">
<xsl:value-of select="translate(string(//typology/class16Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength15.1" select="string-length(normalize-space($sExampleValue15.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength15.1 != 0 and $sExampleValue15.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength15.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>16</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class16agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class16agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class16agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>16</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class16agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class16agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class16agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue16.1">
<xsl:value-of select="translate(string(//typology/class17Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength16.1" select="string-length(normalize-space($sExampleValue16.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength16.1 != 0 and $sExampleValue16.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength16.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>17</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class17agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class17agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class17agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>17</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class17agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class17agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class17agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue17.1">
<xsl:value-of select="translate(string(//typology/class18Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength17.1" select="string-length(normalize-space($sExampleValue17.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength17.1 != 0 and $sExampleValue17.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength17.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>18</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class18agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class18agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class18agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>18</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class18agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class18agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class18agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue18.1">
<xsl:value-of select="translate(string(//typology/class19Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength18.1" select="string-length(normalize-space($sExampleValue18.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength18.1 != 0 and $sExampleValue18.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength18.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>19</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class19agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class19agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class19agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>19</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class19agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class19agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class19agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue19.1">
<xsl:value-of select="translate(string(//typology/class20Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength19.1" select="string-length(normalize-space($sExampleValue19.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength19.1 != 0 and $sExampleValue19.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength19.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>20</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class20agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class20agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class20agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>20</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class20agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class20agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class20agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue20.1">
<xsl:value-of select="translate(string(//typology/class21Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength20.1" select="string-length(normalize-space($sExampleValue20.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength20.1 != 0 and $sExampleValue20.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength20.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>21</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class21agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class21agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class21agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>21</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class21agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class21agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class21agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue21.1">
<xsl:value-of select="translate(string(//typology/class22Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength21.1" select="string-length(normalize-space($sExampleValue21.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength21.1 != 0 and $sExampleValue21.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength21.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>22</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class22agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class22agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class22agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>22</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class22agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class22agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class22agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue22.1">
<xsl:value-of select="translate(string(//typology/class23Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength22.1" select="string-length(normalize-space($sExampleValue22.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength22.1 != 0 and $sExampleValue22.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength22.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>23</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class23agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class23agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class23agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>23</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class23agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class23agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class23agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue23.1">
<xsl:value-of select="translate(string(//typology/class24Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength23.1" select="string-length(normalize-space($sExampleValue23.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength23.1 != 0 and $sExampleValue23.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength23.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>24</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class24agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class24agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class24agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>24</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class24agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class24agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class24agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
            <xsl:variable name="sExampleValue24.1">
<xsl:value-of select="translate(string(//typology/class25Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength24.1" select="string-length(normalize-space($sExampleValue24.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength24.1 != 0 and $sExampleValue24.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength24.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
                  <xsl:text>25</xsl:text>
               </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class25agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class25agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class25agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
                  <xsl:text>25</xsl:text>
               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
                  <xsl:choose>
                     <xsl:when test="//typology/@class25agr='sg'">singular</xsl:when>
                     <xsl:when test="//typology/@class25agr='pl'">plural</xsl:when>
                     <xsl:when test="//typology/@class25agr='irrelevant'">no aplica</xsl:when>
                  </xsl:choose>
               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
         </table>
</example>
</xsl:if>
      
 <xsl:if test="normalize-space(//typology/@classifier)='yesType'">
<p>
<xsl:text>Algunos ejemplos de sustantivos con sus clasificadores son:</xsl:text>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//typology/@classifier)='yesType'">
<example num="xClassifiers.36">
<table border="1">
            <tr>
               <th>Sustantivo</th>
               <th>Glosa</th>
            </tr>
            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//typology/classifierTypeExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
         </table>
</example>
</xsl:if>
      <xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Algunos ejemplos de oraciones que muestran la concordancia de clasificador en la frase nominal y entre esta y el verbo son:</xsl:text>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
<example num="xClassifiers.40">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/classifierAgrExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/classifierAgrExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/classifierAgrExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/classifierAgrExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xClassifiers.40</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xClassifiers.40.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
      <xsl:if test="normalize-space(//typology/@classifier)='yesSpecific'">
<p>
<xsl:text>Algunos ejemplos de frases nominales que muestran los clasificadores diversos que se presentan con números o demostrativos y sustantivos son:</xsl:text>
</p>
</xsl:if>
   	<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific'">
<example num="xClassifiers.44">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/classifierSpecificExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/classifierSpecificExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/classifierSpecificExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/classifierSpecificExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xClassifiers.44</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xClassifiers.44.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
   </section1>
</xsl:if>

   
   
   

   
      
      
   
      
   
   
      
      
        
      
        
   
   
        
      
        
      
        
   
   
        
 
        
      
        
   
   
        
      
        
      
        
   
   
        
      
        
      
        
   
   
        
      
        
      
        
   
   
        
      
        
      
        
   
   
      
   
   
        
      
        
      
        
      
        
   
   
        
      
        
      
        
      
        
        
        
      
        
      
 
    
 
   
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
   
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
		
		
	
	
		
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
   
		
      
      
	   
	   
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      

      
      
      
      
      
      
      
      
      
      
      
  
      
      
      
      
      
   
      
      
      
      
      
   
   
      
      
      
      
      
      
   
      
      
      
      
      
      
   
      
      
      
      
      
      
   
      
      
      
      
      
      
   
      
      
      
      
      
      
   
      
      
      
      
      
      
   
      
      
      
      
      
      
   
   
   
	  
	  
	  
   
   
	  
   
   
	  
	  
	  
	  
	  
	  
	  
   
   
	  
   
   
	  
   
	
		
	
	
	  
   
	
		
		
		
	
	
	  
	  
	  
   
   
	  
	  
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
   
	
		
		
		
		
		
	
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
	  
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   

</xsl:template>
</xsl:stylesheet>
