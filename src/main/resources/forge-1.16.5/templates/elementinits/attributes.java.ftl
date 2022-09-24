<#-- @formatter:off -->
/*
 *    MCreator note: This file will be REGENERATED on each build.
 */
package ${package}.init;


@Mod.EventBusSubscriber (bus = Mod.EventBusSubscriber.Bus.MOD) public class ${JavaModName}Attributes {
    public static final DeferredRegister<Attribute>REGISTRY = DeferredRegister.create(ForgeRegistries.ATTRIBUTES, ${JavaModName}.MODID);

    <#list attributes as attribute>
    public static final RegistryObject<Attribute> ${attribute.getModElement().getRegistryNameUpper()} = REGISTRY.register("${attribute.getModElement().getRegistryName().toLowerCase()}", () -> (new RangedAttribute("${attribute.description}", ${attribute.defaultValue}, ${attribute.minValue}, ${attribute.maxValue})).setSyncable(true));
    </#list>


    @SubscribeEvent
    public static void register(FMLConstructModEvent event) {
        event.enqueueWork(() -> {
            REGISTRY.register(FMLJavaModLoadingContext.get().getModEventBus());
        });
    }

   @SubscribeEvent
   public static void addAttributes(EntityAttributeModificationEvent event) {
       <#list attributes as attribute>
           <#list attribute.entities as entity>
               <#assign e = generator.map(entity.getUnmappedValue(), "entities", 1)!"null">
               <#if e != "null">
               event.add(${e}, ${attribute.getModElement().getRegistryNameUpper()}.get());
               </#if>
           </#list>

       </#list>
   }

}
<#-- @formatter:on -->