<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:foaf="http://xmlns.com/foaf/0.1/" 
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
                version="1.0">
  
  <!-- Output format -->
  <xsl:output method="html" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
              doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />
  
  <!-- Root template for transformation -->
  <xsl:template match="/rdf:RDF">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>FOAF Profile</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      </head>
      <body>
        <h1>FOAF Profile of <xsl:value-of select="foaf:Person/foaf:name"/></h1>
        
        <p><strong>Name:</strong> <xsl:value-of select="foaf:Person/foaf:name"/></p>
        <p><strong>Nickname:</strong> <xsl:value-of select="foaf:Person/foaf:nick"/></p>
        <p><strong>Email:</strong> 
          <a href="{foaf:Person/foaf:mbox/@rdf:resource}">
            <xsl:value-of select="foaf:Person/foaf:mbox/@rdf:resource"/>
          </a>
        </p>
        <p><strong>Homepage:</strong> 
          <a href="{foaf:Person/foaf:homepage/@rdf:resource}">
            <xsl:value-of select="foaf:Person/foaf:homepage/@rdf:resource"/>
          </a>
        </p>
        <p><strong>Image:</strong> 
          <img src="{foaf:Person/foaf:depiction/@rdf:resource}" alt="Profile Image" />
        </p>
        
        <!-- Displaying known people -->
        <h2>Known People</h2>
        <ul>
          <xsl:for-each select="foaf:Person/foaf:knows/foaf:Person">
            <li>
              <xsl:value-of select="foaf:name"/> - 
              <a href="{foaf:homepage/@rdf:resource}">Homepage</a>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>

