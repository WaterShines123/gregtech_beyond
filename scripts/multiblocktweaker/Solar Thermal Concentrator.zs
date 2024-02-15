import crafttweaker.world.IFacing;
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.IBlockMatcher;
import mods.gregtech.multiblock.MultiblockAbility;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.FactoryMultiblockShapeInfo;
import mods.gregtech.multiblock.IBlockInfo;
import mods.gregtech.multiblock.IBlockWorldState;
import mods.gregtech.multiblock.Multiblock;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.MetaTileEntities;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.render.ITextureArea;
import mods.gregtech.render.MoveType;
import mods.gregtech.render.ICubeRenderer;
import mods.gregtech.render.Textures;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;


var loc = "solar_thermal_concentrator";
var meta = 10055;
val solar_thermal_concentrator = Builder.start(loc, meta)
    .withPattern(
            FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.BACK, RelativeDirection.UP)
                .aisle(
                    "FFFFF",
                    "FCCCF",
                    "FCCCF",
                    "FFSFF")
                .aisle(
                    "CBPBC",
                    "CBPBC",
                    "CBPBC",
                    "CBPBC")
                .aisle(
                    "Z~~~Z",
                    "~~~~~",
                    "~~~~~",
                    "Z~~~Z")
                .aisle(
                    "Z~~~Z",
                    "~~~~~",
                    "~~~~~",
                    "Z~~~Z")
                .aisle(
                    "GGGGG",
                    "GGGGG",
                    "GGGGG",
                    "GGGGG")
                .aisle(
                    "~GGG~",
                    "~GGG~",
                    "~GGG~",
                    "~GGG~")
                .where("S", IBlockMatcher.controller(loc))
                .where("~", IBlockMatcher.ANY)
                .whereOr("B", 
                <metastate:gregtech:boiler_casing>,
                    IBlockMatcher.abilityPartPredicate(
                        MultiblockAbility.IMPORT_FLUIDS,
                        MultiblockAbility.IMPORT_ITEMS,
                        MultiblockAbility.EXPORT_FLUIDS,
                        MultiblockAbility.EXPORT_ITEMS
                ))
                .whereOr("P", 
                <metastate:gregtech:boiler_casing:1>,
                    IBlockMatcher.abilityPartPredicate(
                        MultiblockAbility.INPUT_ENERGY
                    ))
                .where("C", <metastate:gregtech:metal_casing>)
                .where("G", <metastate:minecraft:glass>)
                .where("F", <metastate:gregtech:boiler_firebox_casing>)
                .where("Z", <metastate:gregtech:frame_bronze>)
                .build())
        .addDesign(
                FactoryMultiblockShapeInfo.start()
                .aisle("FFFF","CCCC","Z  Z","Z  Z","GGGGG","     ")
                .aisle("FCCF","LBBB","    ","    ","GGGGG","GGGGG")
                .aisle("SCCF","EPPP","    ","    ","GGGGG","GGGGG")
                .aisle("FCCF","UBBB","    ","    ","GGGGG","GGGGG")
                .aisle("FFFF","CCCC","Z  Z","Z  Z","GGGGG","     ")
                .where("B", <metastate:gregtech:boiler_casing>)
                .where("P", <metastate:gregtech:boiler_casing:1>)
                .where("C", <metastate:gregtech:metal_casing>)
                .where("G", <metastate:minecraft:glass>)
                .where("F", <metastate:gregtech:boiler_firebox_casing>)
                .where("Z", <metastate:gregtech:frame_bronze>)
                .where("S", IBlockInfo.controller(loc))
                .where("E", MetaTileEntities.ENERGY_OUTPUT_HATCH[1], IFacing.west())
                .where("L", MetaTileEntities.FLUID_EXPORT_HATCH[1], IFacing.west())
                .where("U", MetaTileEntities.FLUID_IMPORT_HATCH[1], IFacing.west())
                .build())
.withRecipeMap(
        FactoryRecipeMap.start(loc)
                        .maxFluidInputs(1)
                        .maxFluidOutputs(1)
                        .build())
.withZoom(0.5f)
.buildAndRegister() as Multiblock;
solar_thermal_concentrator.noEnergy = true;

solar_thermal_concentrator.recipeMap.recipeBuilder()
    .fluidInputs(<liquid:water>*2)
    .fluidOutputs(<liquid:steam>*320)
    .duration(200)
    .buildAndRegister();