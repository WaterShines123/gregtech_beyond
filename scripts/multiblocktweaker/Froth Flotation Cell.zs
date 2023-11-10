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


var loc = "froth_flotation_cell";
var meta = 10006;
val froth_flotation_cell = Builder.start(loc, meta)
    .withPattern(
            FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.BACK, RelativeDirection.UP)
                .aisle(
                    "~~P~~",
                    "~CCC~",
                    "PCCCP",
                    "~CCC~",
                    "~~P~~")
                .aisle(
                    "~~P~~",
                    "~CCC~",
                    "PC~CP",
                    "~CCC~",
                    "~~S~~")
                .aisle(
                    "~~~~~",
                    "~CCC~",
                    "~C~C~",
                    "~CCC~",
                    "~~~~~")
                .aisle(
                    "~~~~~",
                    "~CCC~",
                    "~C~C~",
                    "~CCC~",
                    "~~~~~")
                .aisle(
                    "~~~~~",
                    "~CCC~",
                    "~CGC~",
                    "~CCC~",
                    "~~~~~")
                .where("S", IBlockMatcher.controller(loc))
                .where("~", IBlockMatcher.ANY)
                .whereOr("C", 
                <metastate:gregtech:metal_casing:5>,
                    IBlockMatcher.abilityPartPredicate(
                        MultiblockAbility.IMPORT_FLUIDS,
                        MultiblockAbility.IMPORT_ITEMS,
                        MultiblockAbility.INPUT_ENERGY,
                        MultiblockAbility.EXPORT_FLUIDS,
                        MultiblockAbility.EXPORT_ITEMS
                ))
                .where("P", <metastate:gregtech:boiler_casing:1>)
                .where("G", <metastate:gregtech:multiblock_casing:1>)
                .build())
        .addDesign(
                FactoryMultiblockShapeInfo.start()
                .aisle(
                    "  P  ",
                    "  P  ",
                    "     ",
                    "     ",
                    "     ")
                .aisle(
                    " CCC ",
                    " CCC ",
                    " CCC ",
                    " CCC ",
                    " CCC ")
                .aisle(
                    "PCCCP",
                    "SC CP",
                    " C E ",
                    " C C ",
                    " CGC ")
                .aisle(
                    " CCC ",
                    " CCC ",
                    " CCC ",
                    " CCC ",
                    " CCC ")
                .aisle(
                    "  P  ",
                    "  P  ",
                    "     ",
                    "     ",
                    "     ")
                .where("C", <metastate:gregtech:metal_casing:5>)
                .where("P", <metastate:gregtech:boiler_casing:1>)
                .where("G", <metastate:gregtech:multiblock_casing:1>)
                .where("S", IBlockInfo.controller(loc))
                .where("L", MetaTileEntities.FLUID_IMPORT_HATCH[1], IFacing.south())
                .where("X", MetaTileEntities.FLUID_EXPORT_HATCH[1], IFacing.north())
                .where("E", MetaTileEntities.ENERGY_INPUT_HATCH[4], IFacing.east())
                .build())
.withRecipeMap(
        FactoryRecipeMap.start(loc)
                        .maxInputs(4)
                        .maxFluidInputs(2)
                        .maxFluidOutputs(2)
                        .maxOutputs(6)
                        .build())
.withTexture(ICubeRenderer.sided("contenttweaker:blocks/machine_casing_clean_stainless_steel"))
.withZoom(0.5f)

.buildAndRegister() as Multiblock;


froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5182>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:sphaleriteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5103>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:cinnabarslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5601>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:aikiniteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5100>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:chalcopyriteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5360>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:borniteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5132>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:molybdeniteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5148>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:pyriteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5362>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:enargiteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5185>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:stibniteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5614>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:carroliteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5668>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:arsenopyriteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5107>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:cobaltiteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5611>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:rheniiteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5108>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:sheldoniteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5609>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:sylvaniteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5667>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:galliteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5666>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:bowieiteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5608>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:stanniteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5363>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:tennaniteslurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5117>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:green_sapphire_slurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5157>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:sapphire_slurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();

froth_flotation_cell.recipeMap.recipeBuilder()
    .inputs(<gregtech:meta_item_1:5154>*5)
    .outputs(<gtadditions:ga_dust:32135>)
    .fluidInputs(<liquid:froth_flotation_fluid>*100,<liquid:water>*32000)
    .notConsumable(<gregtech:meta_item_1:2595>*3)
    .notConsumable(<gregtech:meta_item_1:2526>*3)
    .fluidOutputs(<liquid:used_froth_flotation_fluid>*200,<liquid:ruby_slurry>*1000)
    .duration(280)
    .EUt(480)
    .buildAndRegister();
    