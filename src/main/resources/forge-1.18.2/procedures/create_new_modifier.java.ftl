<#if field$attribute.startsWith("CUSTOM:")>
<#assign attr = field$attribute?replace("CUSTOM:", "")?upper_case>
${input$var} = ;
<#else>
${input$var} = new AttributeModifier(net.minecraft.world.entity.ai.attributes.Attributes.${field$attribute}.getDescriptionId(), ${input$value}, AttributeModifier.Operation.${field$operation});
</#if>