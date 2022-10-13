@Mod.EventBusSubscriber private static class GlobalTrigger {
@SubscribeEvent public static void addAttributeModifier(ItemAttributeModifierEvent event) {
Map<String, Object> dependencies = new HashMap<>();
		dependencies.put("itemstack", event.getItemStack());
		dependencies.put("event", event);
		executeProcedure(dependencies);
	}
}