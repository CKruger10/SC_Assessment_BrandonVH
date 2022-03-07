<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="@* | node()">
    <xsl:apply-templates select="./Perspective" />
  </xsl:template>

  <xsl:template match="Perspective">
    <div class="jobdescription-perspective">
      <h1 class="title">
        <xsl:value-of select="./@Name" />
      </h1>
      <xsl:if test="./@Description != ''">
        <pre>
          <xsl:value-of disable-output-escaping="yes" select="./@Description" />
        </pre>
      </xsl:if>
      <xsl:apply-templates select="./StrategicGoal" />
    </div>
  </xsl:template>

  <xsl:template match="StrategicGoal">
    <div class="jobdescription-goal">
      <h2>
        <xsl:value-of select="./@Name" />
      </h2>
      <xsl:if test="./@Description != ''">
        <pre>
          <xsl:value-of disable-output-escaping="yes" select="./@Description" />
        </pre>
      </xsl:if>
      <xsl:apply-templates select="./KRA" />
    </div>
  </xsl:template>

  <xsl:template match="KRA">
    <div class="jobdescription-kra">
      <h2>
        <xsl:value-of select="./@Name" />
      </h2>
      <xsl:if test="./@Description != ''">
        <pre>
          <xsl:value-of disable-output-escaping="yes" select="./@Description" />
        </pre>
      </xsl:if>
      <xsl:apply-templates select="./KPI" />
    </div>
  </xsl:template>

  <xsl:template match="KPI">
    <div class="jobdescription-kpi">
      <h2>
        <xsl:value-of select="./@Name" />
      </h2>
      <xsl:if test="./@Objective != ''">
        <label class="detailslabel">Objective</label>
        <pre>
          <xsl:value-of disable-output-escaping="yes" select="./@Objective" />
        </pre>
      </xsl:if>
      <xsl:if test="./@Measure != ''">
        <label class="detailslabel">Measure</label>
        <pre>
          <xsl:value-of disable-output-escaping="yes" select="./@Measure" />
        </pre>
      </xsl:if>
    </div>
  </xsl:template>
</xsl:stylesheet>