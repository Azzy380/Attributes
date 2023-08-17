<#assign attr = "">
<#if field$attribute.startsWith("CUSTOM:")>
<#assign attr = JavaModName + "Attributes." + field$attribute?replace("CUSTOM:", "")?upper_case + ".get()">
<#elseif field$attribute.startsWith("FORGE:")>
<#assign attr = "ForgeMod." + field$attribute?replace("FORGE:", "") + ".get()">
<#else>
<#assign attr = "net.minecraft.world.entity.ai.attributes.Attributes." + field$attribute>
</#if>
<#if field$checkExiting?lower_case == "true">
    if(!(((LivingEntity) ${input$entity}).getAttribute(${attr}).hasModifier(${input$modifier})))
</#if>
<#if field$permanent?lower_case == "true">
    ((LivingEntity) ${input$entity}).getAttribute(${attr}).addPermanentModifier(${input$modifier});
<#else>
    ((LivingEntity) ${input$entity}).getAttribute(${attr}).addTransientModifier(${input$modifier});
</#if>