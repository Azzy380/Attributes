package net.azzier.attributes.utils;

import net.mcreator.element.BaseType;
import net.mcreator.minecraft.DataListEntry;
import net.mcreator.minecraft.DataListLoader;
import net.mcreator.minecraft.ElementUtil;
import net.mcreator.workspace.Workspace;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class EntityUtils {
    public static List<DataListEntry> loadEntities(Workspace workspace) {
        List<DataListEntry> retval = DataListLoader.loadDataList("livingEntities");
        List<DataListEntry> custom = ElementUtil.loadAllSpawnableEntities(workspace).stream().filter((e) -> {
            return e.getName().contains("CUSTOM:");
        }).toList();
        retval.addAll(custom);
        Collections.sort(retval);
        return retval;
    }
}
