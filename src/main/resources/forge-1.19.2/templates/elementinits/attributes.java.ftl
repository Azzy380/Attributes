<#-- @formatter:off -->
/*
 *    MCreator note: This file will be REGENERATED on each build.
 */
package ${package}.init;


@Mod.EventBusSubscriber (bus = Mod.EventBusSubscriber.Bus.MOD) public class ${JavaModName}Attributes {
    public static final DeferredRegister<Attribute>ATTRIBUTES = DeferredRegister.create(ForgeRegistries.ATTRIBUTES, ${JavaModName}.MODID);
    <#list attributes as attribute>
    public static final RegistryObject<Attribute>${attribute.getModElement().getRegistryNameUpper()?replace("_", "")} = ATTRIBUTES.register("${attribute.getModElement().getRegistryName().toLowerCase()}", () -> (new RangedAttribute( "attribute." + ${JavaModName}.MODID + ".${attribute.getModElement().getRegistryName()}", ${attribute.defaultValue}, ${attribute.minValue}, ${attribute.maxValue})).setSyncable(true));
    </#list>
    @SubscribeEvent
    public static void register(FMLConstructModEvent event) {
        event.enqueueWork(() -> {
            ATTRIBUTES.register(FMLJavaModLoadingContext.get().getModEventBus());
        });
    }
    @SubscribeEvent
    public static void addAttributes(EntityAttributeModificationEvent event) {
        <#list attributes as attribute>
            <#list attribute.entities as entity>
                <#assign e = generator.map(entity.getUnmappedValue(), "entities", 1)!"null">
                <#if e != "null">
                event.add(${e}, ${attribute.getModElement().getRegistryNameUpper()?replace("_", "")}.get());
                </#if>
            </#list>
        </#list>
    }
    <#if attributes?filter(a -> a.isPersistent && a.entities?seq_contains("Player"))?size != 0>
    @Mod.EventBusSubscriber
        private class Utils {
            @SubscribeEvent
            public static void persistAttributes(PlayerEvent.Clone event) {
                Player oldP = event.getOriginal();
                Player newP = (Player)event.getEntity();
                <#list attributes?filter(a -> a.isPersistent = true && a.entities?seq_contains("Player")) as attribute>
                newP.getAttribute(${attribute.getModElement().getRegistryNameUpper()?replace("_", "")}.get()).setBaseValue(oldP.getAttribute(${attribute.getModElement().getRegistryNameUpper()?replace("_", "")}.get()).getBaseValue());
                </#list>
            }
    }
    </#if>
}
<#-- @formatter:on -->