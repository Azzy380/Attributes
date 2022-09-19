<#if field$attribute.startsWith("CUSTOM:")>
<#assign attr = field$attribute?replace("CUSTOM:", "")?upper_case>
((LivingEntity) ${input$entity}).getAttribute(${JavaModName}Attributes.${attr}.get()).getBaseValue()
<#else>
((LivingEntity) ${input$entity}).getAttribute(net.minecraft.entity.ai.attributes.Attributes.${field$attribute}).getBaseValue()
</#if>