<#function getSource attribute="">
    <#if attribute.startsWith("CUSTOM:")>
        <#return "custom">
    <#elseif field$attribute.startsWith("FORGE:")>
        <#return "forge">
    <#else>
        <#return "minecraft">
    </#if>
</#function>

<#function getAttributeResource attribute="">
    <#assign attr = getSource(field$attribute)>
    <#if attr == "custom">
        <#return JavaModName + "Attributes." + attribute?replace("CUSTOM:", "")?upper_case>
    <#elseif attr == "forge">
        <#return "ForgeMod." + attribute?replace("FORGE:", "")>
    <#else>
        <#return "net.minecraft.world.entity.ai.attributes.Attributes." + attribute>
    </#if>
</#function>

<#function getAttribute attribute="">
    <#assign attr = getSource(field$attribute)>
    <#if attr == "custom">
        <#return JavaModName + "Attributes." + attribute?replace("CUSTOM:", "")?upper_case + ".get()">
    <#elseif attr == "forge">
        <#return "ForgeMod." + attribute?replace("FORGE:", "") + ".get()">
    <#else>
        <#return "net.minecraft.world.entity.ai.attributes.Attributes." + attribute>
    </#if>
</#function>