<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="tovarna">
    <html>
      <head>
        <title>Továrna</title>
      </head>
      <body>
        <h1>Přehled strojů v továrně</h1>
        <table border="1">
          <tr bgcolor="#2fd4ed">
            <th>Název stroje</th>
            <th>Výrobce</th>
            <th>Cena</th>
            <th>Rozměry</th>
            <th>Barva</th>
            <th>Orientační váha (kg)</th>
            <th>Místo užití</th>
            <th>Počet dílů</th>
          </tr>
          <xsl:for-each select="//tovarna//stroje//stroj">
            <tr>
              <td>
                <xsl:value-of select="*/nazev"/>
              </td>
              <td>
                <xsl:value-of select="*/vyrobce"/>
              </td>
              <td>
                <xsl:value-of select="*/cena"/>
              </td>
              <td>
                <xsl:value-of select="*/sirka"/> *
                <xsl:value-of select="*/vyska"/> *
                <xsl:value-of select="*/hloubka"/><xsl:text> </xsl:text>
                <xsl:value-of select="*/hloubka/@hloubka_jednotka"/>
              </td>
              <td>
                <xsl:value-of select="@barva"/>
              </td>
              <td>
                <xsl:value-of select="*/vaha"/>
              </td>
              <td>
                <xsl:value-of select="*/misto_uziti"/>
              </td>
              <td>
                <xsl:value-of select="*/pocet_dilu"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <h1>Stroje s cenou nad dvacet tisíc</h1>
        <table border="1">
          <tr bgcolor="#ffa500">
            <th>Stroj</th>
            <th>Cena</th>
            <th>Půjčka?</th>
          </tr>
          <xsl:for-each select="//tovarna//stroje//stroj">
            <xsl:if test="*/cena > 20000">
              <tr>
                <td>
                  <xsl:value-of select="*/nazev"/>
                </td>
                <td>
                  <xsl:value-of select="*/cena"/>
                </td>
                <xsl:if test="@pujcka='true'">
                  <td>
                  Ano
                  </td>
                </xsl:if>
                <xsl:value-of select="pujcka"/>
                <xsl:if test="@pujcka='false'">
                  <td>
                  Ne
                  </td>
                </xsl:if>
                <xsl:value-of select="pujcka"/>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </table>
        <h1>Zelené a červené stroje</h1>
        <table border="1">
          <tr>
            <th>Stroj</th>
            <th>Barva</th>
          </tr>
          <xsl:for-each select="//tovarna//stroje//stroj">
            <tr>
              <xsl:choose>
                <xsl:when test="@barva='Zelená'">
                  <td>
                    <xsl:value-of select="*/nazev"/>
                  </td>
                  <td bgcolor="#00ff00">
                    <xsl:value-of select="@barva"/>
                  </td>
                </xsl:when>
                <xsl:when test="@barva='Červená'">
                  <td>
                    <xsl:value-of select="*/nazev"/>
                  </td>
                  <td bgcolor="#FF0000">
                    <xsl:value-of select="@barva"/>
                  </td>
                </xsl:when>
              </xsl:choose>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
