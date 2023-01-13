<#assign attr = "">
<#if field$attribute.startsWith("FORGE:")>
<#assign attr = "ForgeMod." + field$attribute?replace("FORGE:", "") + ".get()">
<#else>
<#assign attr = "net.minecraft.entity.ai.attributes.Attributes." + field$attribute>
</#if>
((entity instanceof LivingEntity) ? ((LivingEntity) ${input$entity}).getAttribute(${attr}).getBaseValue() : -1)