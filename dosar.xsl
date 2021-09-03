<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:src="portalquery.just.ro" exclude-result-prefixes="src">
<xsl:output method="xml" indent="true"/>

<xsl:template match="/">
<Dosare>
    <xsl:for-each select="//src:Dosar">
    <Dosar>
        <institutie><xsl:value-of select="src:institutie"/></institutie>
        <numar><xsl:value-of select="src:numar"/></numar>
        <data><xsl:value-of select="src:data"/></data>
        <obiect><xsl:value-of select="src:obiect"/></obiect>
        <stadiu><xsl:value-of select="src:stadiuProcesualNume"/></stadiu>
        
        <parte1><xsl:value-of select="src:parti/src:DosarParte[1]/src:nume"/> - <xsl:value-of select="src:parti/src:DosarParte[1]/src:calitateParte"/></parte1>
        <parte2><xsl:value-of select="src:parti/src:DosarParte[2]/src:nume"/> - <xsl:value-of select="src:parti/src:DosarParte[2]/src:calitateParte"/></parte2>
        <parte3><xsl:value-of select="src:parti/src:DosarParte[3]/src:nume"/> - <xsl:value-of select="src:parti/src:DosarParte[3]/src:calitateParte"/></parte3>
        
        <xsl:for-each select="src:sedinte/src:DosarSedinta[
            contains(src:solutieSumar, 'domiciliu') or 
            contains(src:solutieSumar, 'program') or
            contains(src:solutieSumar, 'locuin') or
            contains(src:solutieSumar, 'resedint')]">
        <!-- <solutie><xsl:value-of select="src:solutie"/></solutie> -->
        <sumar><xsl:value-of select="src:solutieSumar"/></sumar>
        </xsl:for-each>
    </Dosar>
    </xsl:for-each>
</Dosare>
</xsl:template>

</xsl:stylesheet>