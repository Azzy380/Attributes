<#assign attr = "">
<#if field$attribute.startsWith("CUSTOM:")>
<#assign attr = JavaModName + "Attributes." + field$attribute?replace("CUSTOM:", "")?upper_case + ".get()">
<#elseif field$attribute.startsWith("FORGE:")>
<#assign attr = "ForgeMod." + field$attribute?replace("FORGE:", "") + ".get()">
<#else>
<#assign attr = "net.minecraft.world.entity.ai.attributes.Attributes." + field$attribute>
</#if>
<#if field$permanent?lower_case == "true">
    ((LivingEntity) ${input$entity}).getAttribute(${attr}).removePermanentModifier(UUID.fromString(${input$modifierid}));
<#else>
    ((LivingEntity) ${input$entity}).getAttribute(${attr}).removeModifier(UUID.fromString(${input$modifierid}));
</#if>