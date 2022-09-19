<#if field$attribute.startsWith("CUSTOM:")>
<#assign attr = field$attribute?replace("CUSTOM:", "")?upper_case>
((LivingEntity) ${input$entity}).getAttribute(${JavaModName}Attributes.${attr}.get()).setBaseValue(${input$value});
<#else>
((LivingEntity) ${input$entity}).getAttribute(net.minecraft.entity.ai.attributes.Attributes.${field$attribute}).setBaseValue(${input$value});
</#if>
