<#assign attr = "">
<#if field$attribute.startsWith("FORGE:")>
<#assign attr = "ForgeMod." + field$attribute?replace("FORGE:", "") + ".get()">
<#else>
<#assign attr = "net.minecraft.entity.ai.attributes.Attributes." + field$attribute>
</#if>
_event.addModifier(${attr}, ${input$modifier});