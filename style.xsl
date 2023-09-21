<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:dc="http://purl.org/dc/elements/1.1/">

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta charset="UTF-8" />
                <title>foaf profile</title>
            </head>
            <body>
                <h1>profile foaf</h1>
                <xsl:apply-templates select="//foaf:Person" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="foaf:Person">
        <div>
            <h2>
                <xsl:value-of select="foaf:name" />
            </h2>
            <br />
            <p>
                <strong> Nickname:</strong>
                <xsl:value-of select="foaf:nick" />
            </p>
            <br />
            <p>
                <strong> Age:</strong>
                <xsl:value-of select="foaf:age" />
            </p>
            <br />
            <p>
                <strong> Homepage:</strong>
                <a href="{foaf:homepage/@rdf:resource}">
                    <xsl:value-of select="foaf:homepage/@rdf:resource" />
                </a>
            </p>
            <br />
            <p>
                <strong> Email:</strong>
                <a href="mailto:{foaf:mbox}">
                    <xsl:value-of select="foaf:mbox" />
                </a>
            </p>
            <br />
            <p>
                <strong> Phone:</strong>
                <a href="tel:{foaf:phone}">
                    <xsl:value-of select="foaf:phone" />
                </a>
            </p>
            <br />
            <img src="{foaf:img/@rdf:resource}" alt="Profile Picture" />

            <xsl:apply-templates select="foaf:knows" />
        </div>
    </xsl:template>

    <xsl:template match="foaf:knows">
        <h3> Knows:</h3>
        <br />
    <ul>
            <!-- Process each known person -->
            <xsl:for-each select="foaf:Person">
                <li>
                    <p> Knows : </p>
                    <p>
                        <strong> nom: </strong>
                        <xsl:value-of select="foaf:name" />
                    </p>
                    <br />
                    <p>
                        <strong> homepage : </strong>
                        <a href="{foaf:homepage/@rdf:resource}">
                            <xsl:value-of select="foaf:homepage/@rdf:resource" />
                        </a>
                    </p>
                    <br />
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>

</xsl:stylesheet>