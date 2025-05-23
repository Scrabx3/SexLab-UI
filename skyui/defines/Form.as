﻿class skyui.defines.Form
{
	public static var TYPE_NONE: Number				= 0;

	public static var TYPE_EFFECTSETTING: Number	= 18;

	public static var TYPE_ENCHANTMENT: Number		= 21;
	public static var TYPE_SPELL: Number			= 22;
	public static var TYPE_SCROLLITEM: Number		= 23;

	public static var TYPE_ARMOR: Number			= 26;
	public static var TYPE_BOOK: Number				= 27;

	public static var TYPE_INGREDIENT: Number		= 30;
	public static var TYPE_LIGHT: Number			= 31; //Torch
	public static var TYPE_MISC: Number				= 32;

	public static var TYPE_WEAPON: Number			= 41;
	public static var TYPE_AMMO: Number				= 42;

	public static var TYPE_KEY: Number				= 45;
	public static var TYPE_POTION: Number			= 46;

	public static var TYPE_SOULGEM: Number			= 52;

	public static var TYPE_SHOUT: Number 			= 119;

	/*
	NONE = 0,			// NONE
	TES4,				//	TES4
	GROUP,			//	GRUP	
	GMST,				//	GMST
	KEYWORD,			//	KYWD	BGSKEYWORD
	LOCATIONREF,		//	LCRT	BGSLOCATIONREFTYPE
	ACTION,			//	AACT	BGSACTION
	TEXTURESET,		//	TXST	BGSTEXTURESET
	MENUICON,			//	MICN	BGSMENUICON
	GLOBAL,			//	GLOB	TESGLOBAL
	CLASS,			//	CLAS	TESCLASS
	FACTION,			//	FACT	TESFACTION
	HEADPART,			//	HDPT	BGSHEADPART
	EYES,				//	EYES	TESEYES
	RACE,				//	RACE	TESRACE
	SOUND,			//	SOUN	TESSOUND
	ACOUSTICSPACE,	//	ASPC	BGSACOUSTICSPACE
	SKILL,			//	SKIL	<MISSING>
//	EFFECTSETTING,	//	MGEF	EFFECTSETTING
	SCRIPT,			//	SCPT	SCRIPT
	LANDTEXTURE,		//	LTEX	TESLANDTEXTURE
	ENCHANTMENT,		//	ENCH	ENCHANTMENTITEM
//	SPELL,			//	SPEL	SPELLITEM
//	SCROLLITEM,		//	SCRL	SCROLLITEM
	ACTIVATOR,		//	ACTI	TESOBJECTACTI
	TALKINGACTIVATOR,	//	TACT	BGSTALKINGACTIVATOR
//	ARMOR,			//	ARMO	TESOBJECTARMO
//	BOOK,				//	BOOK	TESOBJECTBOOK
	CONTAINER,		//	CONT	TESOBJECTCONT
	DOOR,				//	DOOR	TESOBJECTDOOR
//	INGREDIENT,		//	INGR	INGREDIENTITEM
//	LIGHT,			//	LIGH	TESOBJECTLIGH
//	MISC,				//	TESOBJECTMISC
	APPARATUS,		//	APPA	BGSAPPARATUS
	STATIC,			//	STAT	TESOBJECTSTAT
	STATICCOLLECTION,	//	BGSSTATICCOLLECTION
	MOVABLESTATIC,	//	MSTT	BGSMOVABLESTATIC
	GRASS,			//	GRAS	TESGRASS
	TREE,				//	TREE	TESOBJECTTREE
	FLORA,			//	FLOR	TESFLORA
	FURNITURE,		//	FURN	TESFURNITURE
	WEAPON,			//	WEAP	TESOBJECTWEAP
	AMMO,				//	AMMO	TESAMMO
	NPC,				//	NPC_	TESNPC
	LEVELEDCHARACTER,	//	LVLN	TESLEVCHARACTER
//	KEY,				//	KEYM	TESKEY
//	POTION,			//	ALCH	ALCHEMYITEM
	IDLEMARKER,		//	IDLM	BGSIDLEMARKER / BGSDEFAULTOBJECTMANAGER? STRANGE
	NOTE,				//	NOTE	BGSNOTE
	CONSTRUCTIBLEOBJECT,	//	COBJ	BGSCONSTRUCTIBLEOBJECT
	PROJECTILE,		//	PROJ	BGSPROJECTILE
	HAZARD,			//	HAZD	BGSHAZARD
//	SOULGEM,			//	SLGM	TESSOULGEM
	LEVELEDITEM,		//	LVLI	TESLEVITEM
	WEATHER,			//	WTHR	TESWEATHER
	CLIMATE,			//	CLMT	TESCLIMATE
	SPGD,				//	SPGD	BGSSHADERPARTICLEGEOMETRYDATA
	REFERENCEEFFECT,	//	RFCT	BGSREFERENCEEFFECT
	REGION,			//	REGN	TESREGION
	NAVI,				//	NAVI	NAVMESHINFOMAP
	CELL,				//	CELL	TESOBJECTCELL
	REFERENCE,		//	REFR	TESOBJECTREFR / ACTOR
	CHARACTER,		//	ACHR	CHARACTER / PLAYERCHARACTER
	MISSILE,			//	PMIS	MISSILEPROJECTILE
	ARROW,			//	PARW	ARROWPROJECTILE
	GRENADE,			//	PGRE	GRENADEPROJECTILE
	BEAMPROJ,			//	PBEA	BEAMPROJECTILE
	FLAMEPROJ,		//	PFLA	FLAMEPROJECTILE
	CONEPROJ,			//	PCON	CONEPROJECTILE
	BARRIERPROJ,		//	PBAR	BARRIERPROJECTILE
	PHZD,				//	PHZD	HAZARD
	WORLDSPACE,		//	WRLD	TESWORLDSPACE
	LAND,				//	LAND	TESOBJECTLAND
	NAVM,				//	NAVM	NAVMESH
	TLOD,				//	TLOD	?
	TOPIC,			//	DIAL	TESTOPIC
	TOPICINFO,		//	INFO	TESTOPICINFO
	QUEST,			//	QUST	TESQUEST
	IDLE,				//	IDLE	TESIDLEFORM
	PACKAGE,			//	PACK	TESPACKAGE
	COMBATSTYLE,		//	CSTY	TESCOMBATSTYLE
	LOADSCREEN,		//	LSCR	TESLOADSCREEN
	LEVELEDSPELL,		//	LVSP	TESLEVSPELL
	ANIO,				//	ANIO	TESOBJECTANIO
	WATER,			//	WATR	TESWATERFORM
	EFFECTSHADER,		//	EFSH	TESEFFECTSHADER
	TOFT,				//	TOFT	?
	EXPLOSION,		//	EXPL	BGSEXPLOSION
	DEBRIS,			//	DEBR	BGSDEBRIS
	IMAGESPACE,		//	IMGS	TESIMAGESPACE
	IMAGESPACEMOD,	//	IMAD	TESIMAGESPACEMODIFIER
	LIST,				//	FLST	BGSLISTFORM
	PERK,				//	PERK	BGSPERK
	BODYPARTDATA,		//	BPTD	BGSBODYPARTDATA
	ADDONNODE,		//	ADDN	BGSADDONNODE
	ACTORVALUEINFO,	//	AVIF	ACTORVALUEINFO
	CAMERASHOT,		//	CAMS	BGSCAMERASHOT
	CAMERAPATH,		//	CPTH	BGSCAMERAPATH
	VOICETYPE,		//	VTYP	BGSVOICETYPE
	MATERIALTYPE,		//	MATT	BGSMATERIALTYPE
	IMPACTDATA,		//	IPCT	BGSIMPACTDATA
	IMPACTDATASET,	//	IPDS	BGSIMPACTDATASET
	ARMA,				//	ARMA	TESOBJECTARMA
	ENCOUNTERZONE,	//	ECZN	BGSENCOUNTERZONE
	LOCATION,			//	LCTN	BGSLOCATION
	MESSAGE,			//	MESH	BGSMESSAGE
	RAGDOLL,			//	RGDL	BGSRAGDOLL
	DOBJ,				//	DOBJ	? (USED FOR DEFAULT OBJECTS, CUSTOM LOADER)
	LIGHTINGTEMPLATE,	//	LGTM	BGSLIGHTINGTEMPLATE
	MUSICTYPE,		//	MUSC	BGSMUSICTYPE
	FOOTSTEP,			//	FSTP	BGSFOOTSTEP
	FOOTSTEPSET,		//	FSTS	BGSFOOTSTEPSET
	STORYBRANCHNODE,	//	SMBN	BGSSTORYMANAGERBRANCHNODE
	STORYQUESTNODE,	//	SMQN	BGSSTORYMANAGERQUESTNODE
	STORYEVENTNODE,	//	SMEN	BGSSTORYMANAGEREVENTNODE
	DIALOGUEBRANCH,	//	DLBR	BGSDIALOGUEBRANCH
	MUSICTRACK,		//	MUST	BGSMUSICTRACKFORMWRAPPER
	DLVW,				//	DLVW	?
	WORDOFPOWER,		//	WOOP	TESWORDOFPOWER
//	SHOUT,			//	SHOU	TESSHOUT
	EQUIPSLOT,		//	EQUP	BGSEQUIPSLOT
	RELATIONSHIP,		//	RELA	BGSRELATIONSHIP
	SCENE,			//	SCEN	BGSSCENE
	ASSOCIATIONTYPE,	//	ASTP	BGSASSOCIATIONTYPE
	OUTFIT,			//	OTFT	BGSOUTFIT
	ART,				//	ARTO	BGSARTOBJECT
	MATERIAL,			//	MATO	BGSMATERIALOBJECT
	MOVEMENTTYPE,		//	MOVT	BGSMOVEMENTTYPE
	SOUNDDESCRIPTOR,	//	SNDR	BGSSOUNDDESCRIPTORFORM
	DUALCASTDATA,		//	DUAL	BGSDUALCASTDATA
	SOUNDCATEGORY,	//	SNCT	BGSSOUNDCATEGORY
	SOUNDOUTPUT,		//	SOPM	BGSSOUNDOUTPUT
	COLLISIONLAYER,	//	COLL	BGSCOLLISIONLAYER
	COLORFORM,		//	CLFM	BGSCOLORFORM
	REVERBPARAM,		//	REVB	BGSREVERBPARAMETERS
	*/

	// baseId = (formId & 0x00FFFFFF)
	// Armor
	public static var BASEID_CLOTHESWEDDINGWREATH: Number				= 0x08895A;
	public static var BASEID_DLC1CLOTHESVAMPIRELORDARMOR: Number		= 0x011A84;

	// Ammo
	public static var BASEID_BOUNDARROW: Number							= 0x10B0A7;
	public static var BASEID_CWARROW: Number							= 0x020DDF;
	public static var BASEID_CWARROWSHORT: Number						= 0x020F02;
	public static var BASEID_DAEDRICARROW: Number						= 0x0139C0;
	public static var BASEID_DRAUGRARROW: Number						= 0x034182;
	public static var BASEID_DUNARCHERPRATICEARROW: Number				= 0x0CAB52;
	public static var BASEID_DUNGEIRMUNDSIGDISARROWSILLUSION: Number	= 0x0E738A;
	public static var BASEID_DWARVENARROW: Number 						= 0x0139BC;
	public static var BASEID_DWARVENSPHEREARROW: Number 				= 0x07B932;
	public static var BASEID_DWARVENSPHEREBOLT01: Number 				= 0x07B935;
	public static var BASEID_DWARVENSPHEREBOLT02: Number 				= 0x10EC8C;
	public static var BASEID_EBONYARROW: Number 						= 0x0139BF;
	public static var BASEID_ELVENARROW: Number 						= 0x0139BD;
	public static var BASEID_FALMERARROW: Number 						= 0x038341;
	public static var BASEID_FOLLOWERIRONARROW: Number 					= 0x10E2DE;
	public static var BASEID_FORSWORNARROW: Number 						= 0x0CEE9E;
	public static var BASEID_GLASSARROW: Number 						= 0x0139BE;
	public static var BASEID_IRONARROW: Number 							= 0x01397D;
	public static var BASEID_MQ101STEELARROW: Number 					= 0x105EE7;
	public static var BASEID_NORDHEROARROW: Number 						= 0x0EAFDF;
	public static var BASEID_ORCISHARROW: Number 						= 0x0139BB;
	public static var BASEID_STEELARROW: Number 						= 0x01397F;
	public static var BASEID_TRAPDART: Number 							= 0x0236DD;
	public static var BASEID_DLC1ELVENARROWBLESSED: Number				= 0x0098A1;
	public static var BASEID_DLC1ELVENARROWBLOOD: Number				= 0x0098A0;
	public static var BASEID_TESTDLC1BOLT: Number						= 0x00590C;
	public static var BASEID_DLC2DWARVENBALLISTABOLT: Number			= 0x0339A1;
	public static var BASEID_DLC2RIEKLINGSPEARTHROWN: Number			= 0x017720;
	
	// Misc
	public static var BASEID_LOCKPICK: Number							= 0x00000A;
	public static var BASEID_GOLD001: Number							= 0x00000F;

	public static var BASEID_LEATHER01: Number							= 0x0DB5D2;
	public static var BASEID_LEATHERSTRIPS: Number						= 0x0800E4;

	public static var BASEID_GEMAMETHYSTFLAWLESS: Number				= 0x06851E;

	public static var BASEID_RUBYDRAGONCLAW: Number 					= 0x04B56C;
	public static var BASEID_IVORYDRAGONCLAW: Number 					= 0x0AB7BB;
	public static var BASEID_GLASSCLAW: Number 							= 0x07C260;
	public static var BASEID_EBONYCLAW: Number 							= 0x05AF48;
	public static var BASEID_EMERALDDRAGONCLAW: Number 					= 0x0ED417;
	public static var BASEID_DIAMONDCLAW: Number 						= 0x0AB375;
	public static var BASEID_IRONCLAW: Number 							= 0x08CDFA;
	public static var BASEID_CORALDRAGONCLAW: Number 					= 0x0B634C;
	public static var BASEID_E3GOLDENCLAW: Number 						= 0x0999E7;
	public static var BASEID_SAPPHIREDRAGONCLAW: Number 				= 0x0663D7;
	public static var BASEID_MS13GOLDENCLAW: Number 					= 0x039647;

	public static var BASEID_DA01AZURASSTARBROKEN: Number 				= 0x028AD7;
	
	// SoulGem
	public static var BASEID_DA01SOULGEMBLACKSTAR: Number 				= 0x063B29;
	public static var BASEID_DA01SOULGEMAZURASSTAR: Number 				= 0x063B27;
	
	// Weapons
	public static var BASEID_WEAPPICKAXE: Number 						= 0x0E3C16;
	public static var BASEID_SSDROCKSPLINTERPICKAXE: Number 			= 0x06A707;
	public static var BASEID_DUNVOLUNRUUDPICKAXE: Number 				= 0x1019D4;

	public static var BASEID_AXE01: Number 								= 0x02F2F4;
	public static var BASEID_DUNHALTEDSTREAMPOACHERSAXE: Number 		= 0x0AE086;

	// Form Ids
	// Sound Descriptors
	public static var FORMID_ITMPotionUse: Number 						= 0x000B6435;
	
	// EquipType
	public static var EQUIP_RIGHT_HAND: Number 							= 0x00013f42;
	public static var EQUIP_LEFT_HAND: Number 							= 0x00013f43;
	public static var EQUIP_EITHER_HAND: Number 						= 0x00013f44;
	public static var EQUIP_BOTH_HANDS: Number 							= 0x00013f45;
	public static var EQUIP_VOICE: Number 								= 0x00025bee;
}