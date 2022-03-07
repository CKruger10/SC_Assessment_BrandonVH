<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="@* | node()">
    <xsl:apply-templates select="./RequirementCategory" />
  </xsl:template>

  <xsl:template match="RequirementCategory">
    <div class="jobdescription-inputcategory">
      <h1 class="title">
        <xsl:value-of select="./@Name" />
      </h1>
      <xsl:if test="./@Description != ''">
        <pre class="description">
          <xsl:value-of disable-output-escaping="yes" select="./@Description" />
        </pre>
      </xsl:if>
      <xsl:apply-templates select="./RequirementItem" />
    </div>
  </xsl:template>

  <xsl:template match="RequirementItem">
    <div class="jobdescription-inputitem">
      <h2>
        <xsl:value-of select="./@Name" />
      </h2>
      <xsl:if test="./@Criteria != ''">
        <pre class="description">
          <xsl:value-of disable-output-escaping="yes" select="./@Criteria" />
        </pre>
      </xsl:if>
    </div>
  </xsl:template>
</xsl:stylesheet>