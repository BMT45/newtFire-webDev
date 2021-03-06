<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    
<!--ebb: Note the appropriate SVG stylesheet and output lines we need for XSLT to write good SVG.
    NOTE: this is modified from the stylesheet we showed in class.-->
    
    <xsl:variable name="Interval" select="70"/>
    <xsl:template match="/">
        <svg width="100%" height="100%">
            <!--2015-11-09 ebb: DISCOVERY AFTER CLASS: I discover that if we include the xmlns for SVG in
                the xsl:stylesheet above, we don't need (or want) to include it here. 
                When we write stylesheets to produce SVG with multiple template rules, it's important 
                that we define the output namespace up in the xsl stylesheet code at the top of file.
                Otherwise we'll produce erroneous output: the SVG being output in each template rule will 
                have an empty xmlns attribute without this. Positioning the namespace in the document node
                template is brittle and will only work if we have just one template rule 
                on the document node, so we shouldn't do that.-->
         
            <g transform="translate(70, 525)">
                
                
                <line x1="20" x2="20" y1="0" y2="-500" stroke="black" stroke-width="1"/>
                <line x1="20" x2="900" y1="0" y2="0" stroke="black" stroke-width="1"/>
                <text x="5" y="0" text-anchor="middle">0</text>
                <text x="5" y="-70" text-anchor="middle">10</text>
                <text x="5" y="-140" text-anchor="middle">20</text>
                <text x="5" y="-210" text-anchor="middle">30</text>
                <text x="5" y="-280" text-anchor="middle">40</text>
                <text x="5" y="-350" text-anchor="middle">50</text>
                <text x="5" y="-420" text-anchor="middle">60</text>
                <text x="5" y="-490" text-anchor="middle">70</text>
                <xsl:for-each select="//chapter">
                    <xsl:variable name="xPosition" select="position()*$Interval"/>
                    <!--ebb: This uses the position() of the chapter in the XML hierarchy to assign
                        its number. We could use the @which attribute instead, since this holds the chapter
                    number as well.-->
                    <xsl:variable name="yPosition" select="count(.//q[@sp='alice'])* 7"/>
                    <line x1="{$xPosition}" y1="0" x2="{$xPosition}" y2="-{$yPosition}" color="black" stroke="black" stroke-width="3"/>
                    <text x="{$xPosition}" y="20" text-anchor="middle"> Ch.
                        <xsl:value-of select="@which"/>
                    </text>
                </xsl:for-each>
            </g>
        </svg>
    </xsl:template>


</xsl:stylesheet>
