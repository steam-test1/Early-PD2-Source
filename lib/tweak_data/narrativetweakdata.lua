NarrativeTweakData = NarrativeTweakData or class()
function NarrativeTweakData:init()
	self.STARS = {}
	self.STARS[1] = {
		jcs = {
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[2] = {
		jcs = {
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[3] = {
		jcs = {
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[4] = {
		jcs = {
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[5] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[6] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[7] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[8] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[9] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[10] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS_CURVES = {
		1.6,
		1.5,
		1.5,
		1.5,
		1.5,
		1.5,
		1.5,
		1.4,
		1.3,
		1.2
	}
	self.JC_CHANCE = 0.01
	self.JC_PICKS = 35
	self.CONTRACT_COOLDOWN_TIME = 300
	self.HEAT_OTHER_JOBS_RATIO = 0.3
	self.ABSOLUTE_ZERO_JOBS_HEATS_OTHERS = false
	self.HEATED_MAX_XP_MUL = 1.15
	self.FREEZING_MAX_XP_MUL = 0.7
	self.DEFAULT_HEAT = {this_job = -5, other_jobs = 5}
	self.MAX_JOBS_IN_CONTAINERS = {
		6,
		18,
		24,
		false,
		12,
		4,
		1
	}
	self.DEFAULT_GHOST_BONUS = 0
	self.contacts = {}
	self.contacts.dallas = {}
	self.contacts.dallas.name_id = "heist_contact_dallas"
	self.contacts.dallas.description_id = "heist_contact_dallas_description"
	self.contacts.dallas.package = "packages/contact_dallas"
	self.contacts.dallas.assets_gui = Idstring("guis/mission_briefing/preload_contact_dallas")
	self.contacts.vlad = {}
	self.contacts.vlad.name_id = "heist_contact_vlad"
	self.contacts.vlad.description_id = "heist_contact_vlad_description"
	self.contacts.vlad.package = "packages/contact_vlad"
	self.contacts.vlad.assets_gui = Idstring("guis/mission_briefing/preload_contact_vlad")
	self.contacts.hector = {}
	self.contacts.hector.name_id = "heist_contact_hector"
	self.contacts.hector.description_id = "heist_contact_hector_description"
	self.contacts.hector.package = "packages/contact_hector"
	self.contacts.hector.assets_gui = Idstring("guis/mission_briefing/preload_contact_hector")
	self.contacts.the_elephant = {}
	self.contacts.the_elephant.name_id = "heist_contact_the_elephant"
	self.contacts.the_elephant.description_id = "heist_contact_the_elephant_description"
	self.contacts.the_elephant.package = "packages/contact_the_elephant"
	self.contacts.the_elephant.assets_gui = Idstring("guis/mission_briefing/preload_contact_the_elephant")
	self.contacts.bain = {}
	self.contacts.bain.name_id = "heist_contact_bain"
	self.contacts.bain.description_id = "heist_contact_bain_description"
	self.contacts.bain.package = "packages/contact_bain"
	self.contacts.bain.assets_gui = Idstring("guis/mission_briefing/preload_contact_bain")
	self.contacts.the_dentist = {}
	self.contacts.the_dentist.name_id = "heist_contact_the_dentist"
	self.contacts.the_dentist.description_id = "heist_contact_the_dentist_description"
	self.contacts.the_dentist.package = "packages/contact_the_dentist"
	self.contacts.the_dentist.assets_gui = Idstring("guis/dlcs/big_bank/guis/preload_contact_the_dentist")
	self.contacts.interupt = {}
	self.contacts.interupt.name_id = "heist_contact_interupt"
	self.contacts.interupt.description_id = "heist_contact_interupt_description"
	self.contacts.interupt.package = "packages/contact_interupt"
	self.contacts.interupt.assets_gui = Idstring("guis/mission_briefing/preload_contact_interupt")
	self.jobs = {}
	self.jobs.firestarter = {}
	self.jobs.firestarter.name_id = "heist_firestarter"
	self.jobs.firestarter.briefing_id = "heist_firestarter_crimenet"
	self.jobs.firestarter.package = "packages/job_firestarter"
	self.jobs.firestarter.contact = "hector"
	self.jobs.firestarter.jc = 50
	self.jobs.firestarter.chain = {
		{
			level_id = "firestarter_1",
			type_id = "heist_type_hijack",
			type = "d"
		},
		{
			level_id = "firestarter_2",
			type_id = "heist_type_stealth",
			type = "d"
		},
		{
			level_id = "firestarter_3",
			type_id = "heist_type_knockover",
			type = "d",
			mission = "default",
			mission_filter = {5}
		}
	}
	self.jobs.firestarter.briefing_event = "hct_firestarter_brf"
	self.jobs.firestarter.debrief_event = "hct_firestarter_debrief"
	self.jobs.firestarter.crimenet_callouts = {
		"hct_firestarter_cnc_01",
		"hct_firestarter_cnc_02",
		"hct_firestarter_cnc_03"
	}
	self.jobs.firestarter.crimenet_videos = {
		"cn_fires1",
		"cn_fires2",
		"cn_fires3"
	}
	self.jobs.firestarter.payout = {
		70000,
		95000,
		125000,
		200000,
		250000
	}
	self.jobs.firestarter.contract_cost = {
		39000,
		78000,
		195000,
		390000,
		500000
	}
	self.jobs.firestarter.experience_mul = {
		1.2,
		1.2,
		1.2,
		1.2,
		1.2
	}
	self.jobs.firestarter_prof = deep_clone(self.jobs.firestarter)
	self.jobs.firestarter_prof.jc = 60
	self.jobs.firestarter_prof.professional = true
	self.jobs.firestarter_prof.region = "professional"
	self.jobs.firestarter_prof.payout = {
		80000,
		110000,
		160000,
		250000,
		300000
	}
	self.jobs.firestarter_prof.contract_cost = {
		47000,
		94000,
		235000,
		470000,
		600000
	}
	self.jobs.firestarter_prof.experience_mul = {
		1,
		1,
		1,
		1,
		1
	}
	self.jobs.alex = {}
	self.jobs.alex.name_id = "heist_alex"
	self.jobs.alex.briefing_id = "heist_alex_crimenet"
	self.jobs.alex.package = "packages/job_rats"
	self.jobs.alex.contact = "hector"
	self.jobs.alex.jc = 40
	self.jobs.alex.chain = {
		{
			level_id = "alex_1",
			type_id = "heist_type_survive",
			type = "d"
		},
		{
			level_id = "alex_2",
			type_id = "heist_type_survive",
			type = "d"
		},
		{
			level_id = "alex_3",
			type_id = "heist_type_assault",
			type = "d"
		}
	}
	self.jobs.alex.briefing_event = "hct_rats_brf_speak"
	self.jobs.alex.debrief_event = "hct_rats_debrief"
	self.jobs.alex.crimenet_callouts = {
		"hct_rats_cnc_01",
		"hct_rats_cnc_02",
		"hct_rats_cnc_03"
	}
	self.jobs.alex.crimenet_videos = {
		"cn_rat1",
		"cn_rat2",
		"cn_rat3"
	}
	self.jobs.alex.experience_mul = {
		1,
		1,
		1,
		1,
		1.5
	}
	self.jobs.alex.payout = {
		10000,
		15000,
		20000,
		30000,
		50000
	}
	self.jobs.alex.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000
	}
	self.jobs.alex_prof = deep_clone(self.jobs.alex)
	self.jobs.alex_prof.jc = 50
	self.jobs.alex_prof.professional = true
	self.jobs.alex_prof.region = "professional"
	self.jobs.alex_prof.experience_mul = {
		1,
		1,
		1,
		1,
		1.8
	}
	self.jobs.alex_prof.payout = {
		10000,
		15000,
		30000,
		40000,
		80000
	}
	self.jobs.alex_prof.contract_cost = {
		39000,
		78000,
		195000,
		390000,
		500000
	}
	self.jobs.welcome_to_the_jungle_wrapper = {}
	self.jobs.welcome_to_the_jungle_wrapper.name_id = "heist_welcome_to_the_jungle"
	self.jobs.welcome_to_the_jungle_wrapper.briefing_id = "heist_welcome_to_the_jungle_crimenet"
	self.jobs.welcome_to_the_jungle_wrapper.contact = "the_elephant"
	self.jobs.welcome_to_the_jungle_wrapper.jc = 50
	self.jobs.welcome_to_the_jungle_wrapper.chain = {
		{}
	}
	self.jobs.welcome_to_the_jungle_wrapper.job_wrapper = {
		"welcome_to_the_jungle"
	}
	self.jobs.welcome_to_the_jungle_wrapper.briefing_event = "elp_bigoil_brf"
	self.jobs.welcome_to_the_jungle_wrapper.debrief_event = "elp_bigoil_debrief"
	self.jobs.welcome_to_the_jungle_wrapper.crimenet_callouts = {
		"elp_bigoil_cnc_01",
		"elp_bigoil_cnc_02",
		"elp_bigoil_cnc_03"
	}
	self.jobs.welcome_to_the_jungle_wrapper.crimenet_videos = {
		"cn_bigoil1",
		"cn_bigoil2",
		"cn_bigoil3"
	}
	self.jobs.welcome_to_the_jungle_wrapper.payout = {
		200000,
		275000,
		400000,
		500000,
		800000
	}
	self.jobs.welcome_to_the_jungle_wrapper.contract_cost = {
		20000,
		36000,
		50000,
		90000,
		150000
	}
	self.jobs.welcome_to_the_jungle_wrapper_prof = deep_clone(self.jobs.welcome_to_the_jungle_wrapper)
	self.jobs.welcome_to_the_jungle_wrapper_prof.job_wrapper = {
		"welcome_to_the_jungle_prof"
	}
	self.jobs.welcome_to_the_jungle_wrapper_prof.jc = 70
	self.jobs.welcome_to_the_jungle_wrapper_prof.professional = true
	self.jobs.welcome_to_the_jungle_wrapper_prof.region = "professional"
	self.jobs.welcome_to_the_jungle_wrapper_prof.payout = {
		250000,
		300000,
		450000,
		550000,
		850000
	}
	self.jobs.welcome_to_the_jungle_wrapper_prof.contract_cost = {
		54000,
		108000,
		270000,
		540000,
		700000
	}
	self.jobs.welcome_to_the_jungle = {}
	self.jobs.welcome_to_the_jungle.package = "packages/job_bigoil"
	self.jobs.welcome_to_the_jungle.chain = {
		{
			level_id = "welcome_to_the_jungle_1",
			type_id = "heist_type_assault",
			type = "e",
			mission_filter = {1}
		},
		{
			level_id = "welcome_to_the_jungle_2",
			type_id = "heist_type_stealth",
			type = "e",
			mission_filter = {1}
		}
	}
	self.jobs.welcome_to_the_jungle_prof = deep_clone(self.jobs.welcome_to_the_jungle)
	self.jobs.framing_frame = {}
	self.jobs.framing_frame.name_id = "heist_framing_frame"
	self.jobs.framing_frame.briefing_id = "heist_framing_frame_crimenet"
	self.jobs.framing_frame.package = "packages/job_framing_frame"
	self.jobs.framing_frame.contact = "the_elephant"
	self.jobs.framing_frame.jc = 50
	self.jobs.framing_frame.chain = {
		{
			level_id = "framing_frame_1",
			type_id = "heist_type_knockover",
			type = "e",
			mission_filter = {1}
		},
		{
			level_id = "framing_frame_2",
			type_id = "heist_type_trade",
			type = "e",
			mission_filter = {1}
		},
		{
			level_id = "framing_frame_3",
			type_id = "heist_type_stealth",
			type = "e",
			mission_filter = {1}
		}
	}
	self.jobs.framing_frame.briefing_event = "elp_framing_brf"
	self.jobs.framing_frame.debrief_event = "elp_framing_debrief"
	self.jobs.framing_frame.crimenet_callouts = {
		"elp_framing_cmc_01",
		"elp_framing_cmc_02",
		"elp_framing_cmc_03"
	}
	self.jobs.framing_frame.crimenet_videos = {
		"cn_framingframe1",
		"cn_framingframe2",
		"cn_framingframe3"
	}
	self.jobs.framing_frame.payout = {
		60000,
		120000,
		300000,
		600000,
		800000
	}
	self.jobs.framing_frame.contract_cost = {
		31000,
		62000,
		155000,
		310000,
		400000
	}
	self.jobs.framing_frame_prof = deep_clone(self.jobs.framing_frame)
	self.jobs.framing_frame_prof.jc = 70
	self.jobs.framing_frame_prof.professional = true
	self.jobs.framing_frame_prof.region = "professional"
	self.jobs.framing_frame_prof.payout = {
		88000,
		110000,
		330000,
		660000,
		880000
	}
	self.jobs.framing_frame_prof.contract_cost = {
		54000,
		108000,
		270000,
		540000,
		700000
	}
	self.jobs.watchdogs_wrapper = {}
	self.jobs.watchdogs_wrapper.name_id = "heist_watchdogs"
	self.jobs.watchdogs_wrapper.briefing_id = "heist_watchdogs_crimenet"
	self.jobs.watchdogs_wrapper.contact = "hector"
	self.jobs.watchdogs_wrapper.package = "packages/job_watchdogs"
	self.jobs.watchdogs_wrapper.region = "dock"
	self.jobs.watchdogs_wrapper.jc = 50
	self.jobs.watchdogs_wrapper.chain = {
		{}
	}
	self.jobs.watchdogs_wrapper.job_wrapper = {"watchdogs"}
	self.jobs.watchdogs_wrapper.briefing_event = "hct_watchdogs_brf_speak"
	self.jobs.watchdogs_wrapper.debrief_event = "hct_watchdogs_debrief"
	self.jobs.watchdogs_wrapper.crimenet_callouts = {
		"hct_watchdogs_cnc_01",
		"hct_watchdogs_cnc_02",
		"hct_watchdogs_cnc_03"
	}
	self.jobs.watchdogs_wrapper.crimenet_videos = {
		"cn_watchdog1",
		"cn_watchdog2",
		"cn_watchdog3"
	}
	self.jobs.watchdogs_wrapper.payout = {
		60000,
		74000,
		125000,
		185000,
		260000
	}
	self.jobs.watchdogs_wrapper.contract_cost = {
		31000,
		62000,
		155000,
		310000,
		400000
	}
	self.jobs.watchdogs_wrapper_prof = deep_clone(self.jobs.watchdogs_wrapper)
	self.jobs.watchdogs_wrapper_prof.job_wrapper = {
		"watchdogs_prof"
	}
	self.jobs.watchdogs_wrapper_prof.jc = 60
	self.jobs.watchdogs_wrapper_prof.professional = true
	self.jobs.watchdogs_wrapper_prof.payout = {
		75000,
		85000,
		150000,
		200000,
		290000
	}
	self.jobs.watchdogs_wrapper_prof.contract_cost = {
		47000,
		94000,
		235000,
		470000,
		600000
	}
	self.jobs.watchdogs = {}
	self.jobs.watchdogs.package = "packages/job_watchdogs"
	self.jobs.watchdogs.chain = {
		{
			level_id = "watchdogs_1",
			type_id = "heist_type_survive",
			type = "d"
		},
		{
			level_id = "watchdogs_2",
			type_id = "heist_type_survive",
			type = "d"
		}
	}
	self.jobs.watchdogs_prof = deep_clone(self.jobs.watchdogs)
	self.jobs.nightclub = {}
	self.jobs.nightclub.name_id = "heist_nightclub"
	self.jobs.nightclub.briefing_id = "heist_nightclub_crimenet"
	self.jobs.nightclub.package = "packages/job_nightclub"
	self.jobs.nightclub.region = "street"
	self.jobs.nightclub.contact = "vlad"
	self.jobs.nightclub.jc = 30
	self.jobs.nightclub.chain = {
		{
			level_id = "nightclub",
			type_id = "heist_type_assault",
			type = "d"
		}
	}
	self.jobs.nightclub.briefing_event = "vld_nightclub_brf"
	self.jobs.nightclub.debrief_event = "vld_nightclub_debrief"
	self.jobs.nightclub.crimenet_callouts = {
		"vld_nightclub_cnc_01",
		"vld_nightclub_cnc_02",
		"vld_nightclub_cnc_03"
	}
	self.jobs.nightclub.crimenet_videos = {
		"cn_nightc1",
		"cn_nightc2",
		"cn_nightc3"
	}
	self.jobs.nightclub.payout = {
		20000,
		22500,
		40000,
		60000,
		80000
	}
	self.jobs.nightclub.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.nightclub_prof = deep_clone(self.jobs.nightclub)
	self.jobs.nightclub_prof.jc = 40
	self.jobs.nightclub_prof.professional = true
	self.jobs.nightclub_prof.region = "professional"
	self.jobs.nightclub_prof.payout = {
		20000,
		40000,
		60000,
		80000,
		95000
	}
	self.jobs.ukrainian_job = {}
	self.jobs.ukrainian_job.name_id = "heist_ukrainian_job"
	self.jobs.ukrainian_job.briefing_id = "heist_ukrainian_job_crimenet"
	self.jobs.ukrainian_job.package = "packages/job_ukrainian"
	self.jobs.ukrainian_job.contact = "vlad"
	self.jobs.ukrainian_job.region = "street"
	self.jobs.ukrainian_job.jc = 20
	self.jobs.ukrainian_job.chain = {
		{
			level_id = "ukrainian_job",
			type_id = "heist_type_assault",
			type = "d"
		}
	}
	self.jobs.ukrainian_job.briefing_event = "vld_ukranian_brf"
	self.jobs.ukrainian_job.debrief_event = "vld_ukranian_debrief"
	self.jobs.ukrainian_job.crimenet_callouts = {
		"vld_ukranian_cnc_01",
		"vld_ukranian_cnc_02",
		"vld_ukranian_cnc_03",
		"vld_ukranian_cnc_04"
	}
	self.jobs.ukrainian_job.crimenet_videos = {
		"cn_ukr1",
		"cn_ukr2",
		"cn_ukr3"
	}
	self.jobs.ukrainian_job.payout = {
		20000,
		21000,
		23000,
		25000,
		30000
	}
	self.jobs.ukrainian_job_prof = deep_clone(self.jobs.ukrainian_job)
	self.jobs.ukrainian_job_prof.jc = 20
	self.jobs.ukrainian_job_prof.professional = true
	self.jobs.ukrainian_job_prof.region = "professional"
	self.jobs.ukrainian_job_prof.payout = {
		21000,
		24000,
		26000,
		30000,
		40000
	}
	self.jobs.ukrainian_job_prof.contract_cost = {
		8000,
		16000,
		40000,
		80000,
		100000
	}
	self.jobs.jewelry_store = {}
	self.jobs.jewelry_store.name_id = "heist_jewelry_store"
	self.jobs.jewelry_store.briefing_id = "heist_jewelry_store_crimenet"
	self.jobs.jewelry_store.package = "packages/job_jewelry"
	self.jobs.jewelry_store.contact = "bain"
	self.jobs.jewelry_store.region = "street"
	self.jobs.jewelry_store.jc = 10
	self.jobs.jewelry_store.chain = {
		{
			level_id = "jewelry_store",
			type_id = "heist_type_assault",
			type = "d"
		}
	}
	self.jobs.jewelry_store.briefing_event = "pln_jewelrystore_stage1_brf_speak"
	self.jobs.jewelry_store.debrief_event = nil
	self.jobs.jewelry_store.crimenet_callouts = {
		"pln_jewelrystore_stage1_cnc_01",
		"pln_jewelrystore_stage1_cnc_02",
		"pln_jewelrystore_stage1_cnc_03"
	}
	self.jobs.jewelry_store.crimenet_videos = {
		"cn_jewel1",
		"cn_jewel2",
		"cn_jewel3"
	}
	self.jobs.jewelry_store.experience_mul = {
		1,
		1,
		1,
		1,
		3
	}
	self.jobs.jewelry_store.payout = {
		6000,
		12000,
		30000,
		50000,
		60000
	}
	self.jobs.jewelry_store.contract_cost = {
		4000,
		8000,
		20000,
		40000,
		100000
	}
	self.jobs.jewelry_store_prof = deep_clone(self.jobs.jewelry_store)
	self.jobs.jewelry_store_prof.jc = 20
	self.jobs.jewelry_store_prof.professional = true
	self.jobs.jewelry_store_prof.region = "professional"
	self.jobs.jewelry_store_prof.payout = {
		10000,
		20000,
		38000,
		50000,
		70000
	}
	self.jobs.four_stores = {}
	self.jobs.four_stores.name_id = "heist_four_stores"
	self.jobs.four_stores.briefing_id = "heist_four_stores_crimenet"
	self.jobs.four_stores.package = "packages/job_four_stores"
	self.jobs.four_stores.contact = "vlad"
	self.jobs.four_stores.region = "street"
	self.jobs.four_stores.jc = 20
	self.jobs.four_stores.chain = {
		{
			level_id = "four_stores",
			type_id = "heist_type_assault",
			type = "d"
		}
	}
	self.jobs.four_stores.briefing_event = "vld_fourstores_brf"
	self.jobs.four_stores.debrief_event = "vld_fourstores_debrief"
	self.jobs.four_stores.crimenet_callouts = {
		"vld_fourstores_cnc_01",
		"vld_fourstores_cnc_02",
		"vld_fourstores_cnc_03"
	}
	self.jobs.four_stores.crimenet_videos = {
		"cn_fours1",
		"cn_fours2",
		"cn_fours3"
	}
	self.jobs.four_stores.payout = {
		9000,
		18000,
		45000,
		90000,
		120000
	}
	self.jobs.four_stores.contract_cost = {
		8000,
		16000,
		40000,
		80000,
		100000
	}
	self.jobs.four_stores_prof = deep_clone(self.jobs.four_stores)
	self.jobs.four_stores_prof.jc = 20
	self.jobs.four_stores_prof.professional = true
	self.jobs.four_stores_prof.region = "professional"
	self.jobs.four_stores_prof.payout = {
		24000,
		38000,
		46000,
		70000,
		80000
	}
	self.jobs.mallcrasher = {}
	self.jobs.mallcrasher.name_id = "heist_mallcrasher"
	self.jobs.mallcrasher.briefing_id = "heist_mallcrasher_crimenet"
	self.jobs.mallcrasher.package = "packages/job_mallcrasher"
	self.jobs.mallcrasher.contact = "vlad"
	self.jobs.mallcrasher.region = "street"
	self.jobs.mallcrasher.jc = 20
	self.jobs.mallcrasher.chain = {
		{
			level_id = "mallcrasher",
			type_id = "heist_type_assault",
			type = "d"
		}
	}
	self.jobs.mallcrasher.briefing_event = "vld_mallcrashers_brf"
	self.jobs.mallcrasher.debrief_event = "vld_mallcrashers_debrief"
	self.jobs.mallcrasher.crimenet_callouts = {
		"vld_mallcrashers_cnc_01",
		"vld_mallcrashers_cnc_02",
		"vld_mallcrashers_cnc_03"
	}
	self.jobs.mallcrasher.crimenet_videos = {
		"cn_mallcrash1",
		"cn_mallcrash2",
		"cn_mallcrash3"
	}
	self.jobs.mallcrasher.payout = {
		9000,
		18000,
		45000,
		90000,
		120000
	}
	self.jobs.mallcrasher.contract_cost = {
		8000,
		16000,
		40000,
		80000,
		100000
	}
	self.jobs.mallcrasher_prof = deep_clone(self.jobs.mallcrasher)
	self.jobs.mallcrasher_prof.jc = 30
	self.jobs.mallcrasher_prof.professional = true
	self.jobs.mallcrasher_prof.region = "professional"
	self.jobs.mallcrasher_prof.payout = {
		8000,
		16000,
		40000,
		80000,
		100000
	}
	self.jobs.branchbank = {}
	self.jobs.branchbank.name_id = "heist_branchbank"
	self.jobs.branchbank.briefing_id = "heist_branchbank_crimenet"
	self.jobs.branchbank.package = "packages/job_branchbank_random"
	self.jobs.branchbank.contact = "bain"
	self.jobs.branchbank.region = "street"
	self.jobs.branchbank.jc = 30
	self.jobs.branchbank.chain = {
		{
			level_id = "branchbank",
			type_id = "heist_type_assault",
			type = "d",
			mission = "standalone",
			mission_filter = {4},
			briefing_dialog = nil
		}
	}
	self.jobs.branchbank.briefing_event = "pln_branchbank_random_brf_speak"
	self.jobs.branchbank.debrief_event = nil
	self.jobs.branchbank.crimenet_callouts = {
		"pln_branchbank_random_cnc_01",
		"pln_branchbank_random_cnc_02",
		"pln_branchbank_random_cnc_03",
		"pln_branchbank_random_cnc_04",
		"pln_branchbank_random_cnc_05",
		"pln_branchbank_random_cnc_06"
	}
	self.jobs.branchbank.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.branchbank.payout = {
		20000,
		30000,
		40000,
		70000,
		80000
	}
	self.jobs.branchbank.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.branchbank_prof = deep_clone(self.jobs.branchbank)
	self.jobs.branchbank_prof.jc = 30
	self.jobs.branchbank_prof.professional = true
	self.jobs.branchbank_prof.region = "professional"
	self.jobs.branchbank_prof.payout = {
		26000,
		40000,
		48000,
		70000,
		85000
	}
	self.jobs.branchbank_prof.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.branchbank_deposit = {}
	self.jobs.branchbank_deposit.name_id = "heist_branchbank_deposit"
	self.jobs.branchbank_deposit.briefing_id = "heist_branchbank_deposit_crimenet"
	self.jobs.branchbank_deposit.package = "packages/job_branchbank_deposit"
	self.jobs.branchbank_deposit.contact = "bain"
	self.jobs.branchbank_deposit.region = "street"
	self.jobs.branchbank_deposit.jc = 30
	self.jobs.branchbank_deposit.chain = {
		{
			level_id = "branchbank",
			type_id = "heist_type_assault",
			type = "d",
			mission = "standalone",
			mission_filter = {1},
			briefing_dialog = "Play_pln_branchbank_depositbox_stage1_brief",
			briefing_id = "heist_branchbank_deposit_briefing"
		}
	}
	self.jobs.branchbank_deposit.briefing_event = "pln_branchbank_depositbox_brf_speak"
	self.jobs.branchbank_deposit.debrief_event = nil
	self.jobs.branchbank_deposit.crimenet_callouts = {
		"pln_branchbank_deposit_cnc_01",
		"pln_branchbank_deposit_cnc_02",
		"pln_branchbank_deposit_cnc_03",
		"pln_branchbank_deposit_cnc_04",
		"pln_branchbank_deposit_cnc_05",
		"pln_branchbank_deposit_cnc_06"
	}
	self.jobs.branchbank_deposit.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.branchbank_deposit.payout = {
		30000,
		35000,
		44000,
		68000,
		76000
	}
	self.jobs.branchbank_deposit.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.branchbank_deposit_prof = deep_clone(self.jobs.branchbank_deposit)
	self.jobs.branchbank_deposit_prof.jc = 30
	self.jobs.branchbank_deposit_prof.professional = true
	self.jobs.branchbank_deposit_prof.region = "professional"
	self.jobs.branchbank_deposit_prof.payout = {
		36000,
		40000,
		54000,
		76000,
		86000
	}
	self.jobs.branchbank_deposit_prof.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.branchbank_cash = {}
	self.jobs.branchbank_cash.name_id = "heist_branchbank_cash"
	self.jobs.branchbank_cash.briefing_id = "heist_branchbank_cash_crimenet"
	self.jobs.branchbank_cash.package = "packages/job_branchbank_cash"
	self.jobs.branchbank_cash.contact = "bain"
	self.jobs.branchbank_cash.region = "street"
	self.jobs.branchbank_cash.jc = 30
	self.jobs.branchbank_cash.chain = {
		{
			level_id = "branchbank",
			type_id = "heist_type_assault",
			type = "d",
			mission = "standalone",
			mission_filter = {2},
			briefing_dialog = "Play_pln_branchbank_cash_stage1_brief",
			briefing_id = "heist_branchbank_cash_briefing"
		}
	}
	self.jobs.branchbank_cash.briefing_event = "pln_branchbank_cash_brf_speak"
	self.jobs.branchbank_cash.debrief_event = nil
	self.jobs.branchbank_cash.crimenet_callouts = {
		"pln_branchbank_cash_cnc_01",
		"pln_branchbank_cash_cnc_02",
		"pln_branchbank_cash_cnc_03",
		"pln_branchbank_cash_cnc_04",
		"pln_branchbank_cash_cnc_05",
		"pln_branchbank_cash_cnc_06",
		"pln_branchbank_cash_cnc_07"
	}
	self.jobs.branchbank_cash.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.branchbank_cash.payout = {
		10000,
		15000,
		40000,
		60000,
		75000
	}
	self.jobs.branchbank_cash.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.branchbank_cash_prof = deep_clone(self.jobs.branchbank_cash)
	self.jobs.branchbank_cash_prof.jc = 30
	self.jobs.branchbank_cash_prof.professional = true
	self.jobs.branchbank_cash_prof.region = "professional"
	self.jobs.branchbank_cash_prof.payout = {
		26000,
		40000,
		44000,
		68000,
		80000
	}
	self.jobs.branchbank_cash_prof.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.branchbank_gold = {}
	self.jobs.branchbank_gold.name_id = "heist_branchbank_gold"
	self.jobs.branchbank_gold.briefing_id = "heist_branchbank_gold_crimenet"
	self.jobs.branchbank_gold.package = "packages/job_branchbank_gold"
	self.jobs.branchbank_gold.contact = "bain"
	self.jobs.branchbank_gold.region = "street"
	self.jobs.branchbank_gold.jc = 30
	self.jobs.branchbank_gold.chain = {
		{
			level_id = "branchbank",
			type_id = "heist_type_assault",
			type = "d",
			mission = "standalone",
			mission_filter = {3},
			briefing_dialog = "Play_pln_branchbank_gold_stage1_brief",
			briefing_id = "heist_branchbank_gold_briefing"
		}
	}
	self.jobs.branchbank_gold.briefing_event = "pln_branchbank_gold_brf_speak"
	self.jobs.branchbank_gold.debrief_event = nil
	self.jobs.branchbank_gold.crimenet_callouts = {
		"pln_branchbank_gold_cnc_01",
		"pln_branchbank_gold_cnc_02",
		"pln_branchbank_gold_cnc_03",
		"pln_branchbank_gold_cnc_04",
		"pln_branchbank_gold_cnc_05",
		"pln_branchbank_gold_cnc_06",
		"pln_branchbank_gold_cnc_07"
	}
	self.jobs.branchbank_gold.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.branchbank_gold.payout = {
		20000,
		25000,
		50000,
		75000,
		85000
	}
	self.jobs.branchbank_gold.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.branchbank_gold_prof = deep_clone(self.jobs.branchbank_gold)
	self.jobs.branchbank_gold_prof.jc = 30
	self.jobs.branchbank_gold_prof.professional = true
	self.jobs.branchbank_gold_prof.region = "professional"
	self.jobs.branchbank_gold_prof.payout = {
		26000,
		40000,
		54000,
		76000,
		90000
	}
	self.jobs.branchbank_gold_prof.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.election_day = {}
	self.jobs.election_day.name_id = "heist_election_day"
	self.jobs.election_day.briefing_id = "heist_election_day_crimenet"
	self.jobs.election_day.package = "packages/job_election_day"
	self.jobs.election_day.contact = "the_elephant"
	self.jobs.election_day.jc = 40
	self.jobs.election_day.chain = {
		{
			level_id = "election_day_1",
			type_id = "heist_type_assault",
			type = "e",
			mission_filter = {1}
		},
		{
			{
				level_id = "election_day_2",
				type_id = "heist_type_assault",
				type = "e",
				mission_filter = {1}
			},
			{
				level_id = "election_day_3",
				type_id = "heist_type_knockover",
				type = "e",
				mission_filter = {1}
			},
			{
				level_id = "election_day_3_skip1",
				type_id = "heist_type_knockover",
				type = "e",
				mission_filter = {1}
			},
			{
				level_id = "election_day_3_skip2",
				type_id = "heist_type_knockover",
				type = "e",
				mission_filter = {1}
			}
		}
	}
	self.jobs.election_day.briefing_event = "elp_election_brf"
	self.jobs.election_day.debrief_event = "elp_election_debrief"
	self.jobs.election_day.crimenet_callouts = {
		"elp_election_cmc_01",
		"elp_election_cmc_02",
		"elp_election_cmc_03"
	}
	self.jobs.election_day.crimenet_videos = {
		"cn_elcday1",
		"cn_elcday2",
		"cn_elcday3"
	}
	self.jobs.election_day.payout = {
		20000,
		25000,
		40000,
		60000,
		90000
	}
	self.jobs.election_day.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000
	}
	self.jobs.election_day_prof = deep_clone(self.jobs.election_day)
	self.jobs.election_day_prof.jc = 50
	self.jobs.election_day_prof.professional = true
	self.jobs.election_day_prof.region = "professional"
	self.jobs.election_day_prof.payout = {
		25000,
		35000,
		50000,
		65000,
		100000
	}
	self.jobs.election_day_prof.contract_cost = {
		31000,
		62000,
		155000,
		310000,
		400000
	}
	self.jobs.safehouse = {}
	self.jobs.safehouse.name_id = "heist_safehouse"
	self.jobs.safehouse.briefing_id = "heist_safehouse_crimenet"
	self.jobs.safehouse.contact = "bain"
	self.jobs.safehouse.jc = 5
	self.jobs.safehouse.chain = {
		{
			level_id = "safehouse",
			type_id = "heist_type_assault",
			type = "d",
			briefing_id = Global.mission_manager and Global.mission_manager.saved_job_values.playedSafeHouseBefore and "heist_safehouse_briefing_2" or nil
		}
	}
	self.jobs.safehouse.briefing_event = nil
	self.jobs.safehouse.debrief_event = nil
	self.jobs.safehouse.crimenet_callouts = {}
	self.jobs.arm_wrapper = {}
	self.jobs.arm_wrapper = {}
	self.jobs.arm_wrapper.name_id = "heist_arm_temp"
	self.jobs.arm_wrapper.briefing_id = "heist_arm_crimenet"
	self.jobs.arm_wrapper.contact = "bain"
	self.jobs.arm_wrapper.jc = 30
	self.jobs.arm_wrapper.chain = {
		{}
	}
	self.jobs.arm_wrapper.job_wrapper = {
		"arm_cro",
		"arm_und",
		"arm_hcm",
		"arm_par",
		"arm_fac"
	}
	self.jobs.arm_wrapper.briefing_event = "pln_at1_brf_01"
	self.jobs.arm_wrapper.crimenet_callouts = {
		"pln_at1_cnc_01"
	}
	self.jobs.arm_wrapper.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.arm_wrapper.payout = {
		8500,
		11000,
		30000,
		32000,
		44000
	}
	self.jobs.arm_wrapper.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.arm_wrapper.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.arm_cro = {}
	self.jobs.arm_cro.name_id = "heist_arm_cro"
	self.jobs.arm_cro.briefing_id = "heist_arm_cro_crimenet"
	self.jobs.arm_cro.package = "packages/job_arm_cro"
	self.jobs.arm_cro.contact = "bain"
	self.jobs.arm_cro.region = "street"
	self.jobs.arm_cro.jc = 30
	self.jobs.arm_cro.chain = {
		{
			level_id = "arm_cro",
			type_id = "heist_type_assault",
			type = "d",
			mission_filter = {4},
			briefing_dialog = nil
		}
	}
	self.jobs.arm_cro.briefing_event = "pln_at1_cbf_01"
	self.jobs.arm_cro.debrief_event = nil
	self.jobs.arm_cro.crimenet_callouts = {
		"pln_at1_cnc_01_01"
	}
	self.jobs.arm_cro.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.arm_cro.payout = {
		30500,
		34000,
		50000,
		62000,
		74000
	}
	self.jobs.arm_cro.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.arm_cro.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.arm_cro.dlc = "armored_transport"
	self.jobs.arm_cro.spawn_chance_multiplier = 0.5
	self.jobs.arm_cro_prof = deep_clone(self.jobs.arm_cro)
	self.jobs.arm_cro_prof.jc = 30
	self.jobs.arm_cro_prof.professional = true
	self.jobs.arm_cro_prof.region = "professional"
	self.jobs.arm_und = {}
	self.jobs.arm_und.name_id = "heist_arm_und"
	self.jobs.arm_und.briefing_id = "heist_arm_und_crimenet"
	self.jobs.arm_und.package = "packages/job_arm_und"
	self.jobs.arm_und.contact = "bain"
	self.jobs.arm_und.region = "street"
	self.jobs.arm_und.jc = 30
	self.jobs.arm_und.chain = {
		{
			level_id = "arm_und",
			type_id = "heist_type_assault",
			type = "d",
			mission_filter = {4},
			briefing_dialog = nil
		}
	}
	self.jobs.arm_und.briefing_event = "pln_at1_cbf_01"
	self.jobs.arm_und.debrief_event = nil
	self.jobs.arm_und.crimenet_callouts = {
		"pln_at1_cnc_05_01"
	}
	self.jobs.arm_und.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.arm_und.payout = {
		27500,
		31000,
		48000,
		53000,
		66600
	}
	self.jobs.arm_und.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.arm_und.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.arm_und.dlc = "armored_transport"
	self.jobs.arm_und.spawn_chance_multiplier = 0.5
	self.jobs.arm_und_prof = deep_clone(self.jobs.arm_und)
	self.jobs.arm_und_prof.jc = 30
	self.jobs.arm_und_prof.professional = true
	self.jobs.arm_und_prof.region = "professional"
	self.jobs.arm_bri = {}
	self.jobs.arm_bri.name_id = "heist_arm_bri"
	self.jobs.arm_bri.briefing_id = "heist_arm_bri_crimenet"
	self.jobs.arm_bri.package = "packages/job_arm_bri"
	self.jobs.arm_bri.contact = "bain"
	self.jobs.arm_bri.region = "street"
	self.jobs.arm_bri.jc = 30
	self.jobs.arm_bri.chain = {
		{
			level_id = "arm_bri",
			type_id = "heist_type_assault",
			type = "d",
			mission_filter = {4},
			briefing_dialog = nil
		}
	}
	self.jobs.arm_bri.briefing_event = "Play_pln_at1_cbf_01"
	self.jobs.arm_bri.debrief_event = nil
	self.jobs.arm_bri.crimenet_callouts = {
		"pln_at1_cnc_01_01",
		"pln_at1_cnc_01_02",
		"pln_at1_cnc_01_03"
	}
	self.jobs.arm_bri.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.arm_bri.payout = {
		28500,
		33000,
		54000,
		60000,
		70000
	}
	self.jobs.arm_bri.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.arm_bri.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.arm_bri.dlc = "armored_transport"
	self.jobs.arm_bri.spawn_chance_multiplier = 0.5
	self.jobs.arm_bri_prof = deep_clone(self.jobs.arm_bri)
	self.jobs.arm_bri_prof.jc = 30
	self.jobs.arm_bri_prof.professional = true
	self.jobs.arm_bri_prof.region = "professional"
	self.jobs.arm_hcm = {}
	self.jobs.arm_hcm.name_id = "heist_arm_hcm"
	self.jobs.arm_hcm.briefing_id = "heist_arm_hcm_crimenet"
	self.jobs.arm_hcm.package = "packages/job_arm_hcm"
	self.jobs.arm_hcm.contact = "bain"
	self.jobs.arm_hcm.region = "street"
	self.jobs.arm_hcm.jc = 30
	self.jobs.arm_hcm.chain = {
		{
			level_id = "arm_hcm",
			type_id = "heist_type_assault",
			type = "d",
			mission_filter = {4},
			briefing_dialog = nil
		}
	}
	self.jobs.arm_hcm.briefing_event = "pln_at1_cbf_01"
	self.jobs.arm_hcm.debrief_event = nil
	self.jobs.arm_hcm.crimenet_callouts = {
		"pln_at1_cnc_02_01"
	}
	self.jobs.arm_hcm.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.arm_hcm.payout = {
		26500,
		31000,
		50000,
		52000,
		64000
	}
	self.jobs.arm_hcm.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.arm_hcm.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.arm_hcm.dlc = "armored_transport"
	self.jobs.arm_hcm.spawn_chance_multiplier = 0.5
	self.jobs.arm_hcm_prof = deep_clone(self.jobs.arm_hcm)
	self.jobs.arm_hcm_prof.jc = 30
	self.jobs.arm_hcm_prof.professional = true
	self.jobs.arm_hcm_prof.region = "professional"
	self.jobs.arm_par = {}
	self.jobs.arm_par.name_id = "heist_arm_par"
	self.jobs.arm_par.briefing_id = "heist_arm_par_crimenet"
	self.jobs.arm_par.package = "packages/job_arm_par"
	self.jobs.arm_par.contact = "bain"
	self.jobs.arm_par.region = "street"
	self.jobs.arm_par.jc = 30
	self.jobs.arm_par.chain = {
		{
			level_id = "arm_par",
			type_id = "heist_type_assault",
			type = "d",
			mission_filter = {4},
			briefing_dialog = nil
		}
	}
	self.jobs.arm_par.briefing_event = "pln_at1_cbf_01"
	self.jobs.arm_par.debrief_event = nil
	self.jobs.arm_par.crimenet_callouts = {
		"pln_at1_cnc_04_01"
	}
	self.jobs.arm_par.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.arm_par.payout = {
		28500,
		31000,
		40000,
		43000,
		56000
	}
	self.jobs.arm_par.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.arm_par.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.arm_par.dlc = "armored_transport"
	self.jobs.arm_par.spawn_chance_multiplier = 0.5
	self.jobs.arm_par_prof = deep_clone(self.jobs.arm_par)
	self.jobs.arm_par_prof.jc = 40
	self.jobs.arm_par_prof.professional = true
	self.jobs.arm_par_prof.region = "professional"
	self.jobs.arm_fac = {}
	self.jobs.arm_fac.name_id = "heist_arm_fac"
	self.jobs.arm_fac.briefing_id = "heist_arm_fac_crimenet"
	self.jobs.arm_fac.package = "packages/job_arm_fac"
	self.jobs.arm_fac.contact = "bain"
	self.jobs.arm_fac.region = "street"
	self.jobs.arm_fac.jc = 30
	self.jobs.arm_fac.chain = {
		{
			level_id = "arm_fac",
			type_id = "heist_type_assault",
			type = "d",
			mission_filter = {4},
			briefing_dialog = nil
		}
	}
	self.jobs.arm_fac.briefing_event = "pln_at1_cbf_01"
	self.jobs.arm_fac.debrief_event = nil
	self.jobs.arm_fac.crimenet_callouts = {
		"pln_at1_cnc_03_01"
	}
	self.jobs.arm_fac.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.arm_fac.payout = {
		22500,
		29000,
		40000,
		42000,
		54000
	}
	self.jobs.arm_fac.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.arm_fac.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.arm_fac.dlc = "armored_transport"
	self.jobs.arm_fac.spawn_chance_multiplier = 0.5
	self.jobs.arm_fac_prof = deep_clone(self.jobs.arm_fac)
	self.jobs.arm_fac_prof.jc = 30
	self.jobs.arm_fac_prof.professional = true
	self.jobs.arm_fac_prof.region = "professional"
	self.jobs.arm_for = {}
	self.jobs.arm_for.name_id = "heist_arm_for"
	self.jobs.arm_for.briefing_id = "heist_arm_for_crimenet"
	self.jobs.arm_for.contact = "bain"
	self.jobs.arm_for.region = "street"
	self.jobs.arm_for.jc = 70
	self.jobs.arm_for.chain = {
		{
			level_id = "arm_for",
			type_id = "heist_type_assault",
			type = "d",
			mission_filter = {4},
			briefing_dialog = nil
		}
	}
	self.jobs.arm_for.briefing_event = "pln_at1_brf_01"
	self.jobs.arm_for.debrief_event = nil
	self.jobs.arm_for.crimenet_callouts = {
		"pln_at1_cnc_01_01",
		"pln_at1_cnc_01_02",
		"pln_at1_cnc_01_03"
	}
	self.jobs.arm_for.crimenet_videos = {
		"cn_jewel1",
		"cn_jewel2",
		"cn_jewel1"
	}
	self.jobs.arm_for.payout = {
		40,
		56,
		80,
		100,
		200
	}
	self.jobs.arm_for.dlc = "armored_transport"
	self.jobs.arm_for_prof = deep_clone(self.jobs.arm_for)
	self.jobs.arm_for_prof.jc = 70
	self.jobs.arm_for_prof.professional = true
	self.jobs.arm_for_prof.region = "professional"
	self.jobs.family = {}
	self.jobs.family.name_id = "heist_family"
	self.jobs.family.briefing_id = "heist_family_crimenet"
	self.jobs.family.package = "packages/job_family"
	self.jobs.family.contact = "bain"
	self.jobs.family.region = "street"
	self.jobs.family.jc = 20
	self.jobs.family.chain = {
		{
			level_id = "family",
			type_id = "heist_type_assault",
			type = "d"
		}
	}
	self.jobs.family.briefing_event = "pln_fj1_cbf_01"
	self.jobs.family.debrief_event = nil
	self.jobs.family.crimenet_callouts = {
		"pln_fj1_cnc_01_01",
		"pln_fj1_cnc_01_02",
		"pln_fj1_cnc_01_03"
	}
	self.jobs.family.crimenet_videos = {
		"cn_jewel1",
		"cn_jewel2",
		"cn_jewel3"
	}
	self.jobs.family.payout = {
		6000,
		12000,
		30000,
		50000,
		60000
	}
	self.jobs.family.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000
	}
	self.jobs.family.experience_mul = {
		1.5,
		1.5,
		1.5,
		1.5,
		1.5
	}
	self.jobs.family_prof = deep_clone(self.jobs.family)
	self.jobs.family_prof.jc = 50
	self.jobs.family_prof.professional = true
	self.jobs.family_prof.region = "professional"
	self.jobs.family_prof.payout = {
		40000,
		44000,
		62000,
		70000,
		85000
	}
	self.jobs.big = {}
	self.jobs.big.name_id = "heist_big"
	self.jobs.big.briefing_id = "heist_big_crimenet"
	self.jobs.big.package = "packages/job_big"
	self.jobs.big.contact = "the_dentist"
	self.jobs.big.region = "street"
	self.jobs.big.jc = 60
	self.jobs.big.chain = {
		{
			level_id = "big",
			type_id = "heist_type_assault",
			type = "d",
			mission_filter = {1}
		}
	}
	self.jobs.big.briefing_event = "gus_bb1_cbf_01"
	self.jobs.big.debrief_event = "gus_bb1_debrief_01"
	self.jobs.big.crimenet_callouts = {
		"gus_bb1_cnc_01",
		"gus_bb1_cnc_01",
		"gus_bb1_cnc_01"
	}
	self.jobs.big.crimenet_videos = {
		"cn_big1",
		"cn_big2",
		"cn_big3"
	}
	self.jobs.big.payout = {
		90000,
		135000,
		180000,
		310000,
		380000
	}
	self.jobs.big.contract_cost = {
		47000,
		94000,
		235000,
		470000,
		600000
	}
	self.jobs.big.dlc = "big_bank"
	self.jobs.big_prof = deep_clone(self.jobs.big)
	self.jobs.big_prof.jc = 60
	self.jobs.big_prof.professional = true
	self.jobs.big_prof.region = "professional"
	self.jobs.big_prof.payout = {
		40000,
		44000,
		62000,
		70000,
		140000
	}
	self.jobs.roberts = {}
	self.jobs.roberts.name_id = "heist_roberts"
	self.jobs.roberts.briefing_id = "heist_roberts_crimenet"
	self.jobs.roberts.package = "packages/job_roberts"
	self.jobs.roberts.contact = "bain"
	self.jobs.roberts.region = "street"
	self.jobs.roberts.jc = 40
	self.jobs.roberts.chain = {
		{
			level_id = "roberts",
			type_id = "heist_type_assault",
			type = "d"
		}
	}
	self.jobs.roberts.briefing_event = "pln_cs1_cbf_01"
	self.jobs.roberts.debrief_event = nil
	self.jobs.roberts.crimenet_callouts = {
		"pln_cs1_cnc_01",
		"pln_cs1_cnc_02",
		"pln_cs1_cnc_03"
	}
	self.jobs.roberts.crimenet_videos = {
		"cn_jewel1",
		"cn_jewel2",
		"cn_jewel3"
	}
	self.jobs.roberts.payout = {
		55000,
		110000,
		275000,
		550000,
		700000
	}
	self.jobs.roberts.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.roberts.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000
	}
	self.jobs.roberts_prof = deep_clone(self.jobs.roberts)
	self.jobs.roberts_prof.jc = 40
	self.jobs.roberts_prof.professional = true
	self.jobs.roberts_prof.region = "professional"
	self.jobs.roberts_prof.payout = {
		40000,
		44000,
		62000,
		70000,
		140000
	}
	self.jobs.kosugi = {}
	self.jobs.kosugi.name_id = "heist_kosugi"
	self.jobs.kosugi.briefing_id = "heist_kosugi_crimenet"
	self.jobs.kosugi.contact = "bain"
	self.jobs.kosugi.region = "street"
	self.jobs.kosugi.jc = 30
	self.jobs.kosugi.chain = {
		{
			level_id = "kosugi",
			type_id = "heist_type_assault",
			type = "d"
		}
	}
	self.jobs.kosugi.briefing_event = "pln_ko1_cbf_01"
	self.jobs.kosugi.debrief_event = nil
	self.jobs.kosugi.crimenet_callouts = {
		"pln_ko1_cnc_01",
		"pln_ko1_cnc_01",
		"pln_ko1_cnc_01"
	}
	self.jobs.kosugi.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.kosugi.contract_cost = {
		0,
		0,
		0,
		100000,
		130000
	}
	self.jobs.kosugi.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000
	}
	self.jobs.kosugi.payout = {
		10000,
		20000,
		30000,
		40000,
		80000
	}
	self.jobs.kosugi.experience_mul = {
		1,
		1,
		1,
		1.5,
		1.8
	}
	self.jobs.kosugi_prof = deep_clone(self.jobs.kosugi)
	self.jobs.kosugi_prof.jc = 40
	self.jobs.kosugi_prof.professional = true
	self.jobs.kosugi_prof.region = "professional"
	self.jobs.kosugi_prof.payout = {
		10000,
		20000,
		30000,
		40000,
		80000
	}
	self._jobs_index = {
		"jewelry_store",
		"four_stores",
		"nightclub",
		"mallcrasher",
		"ukrainian_job_prof",
		"branchbank_deposit",
		"branchbank_cash",
		"branchbank_prof",
		"branchbank_gold_prof",
		"firestarter",
		"firestarter_prof",
		"alex",
		"alex_prof",
		"watchdogs_wrapper",
		"watchdogs_wrapper_prof",
		"watchdogs",
		"watchdogs_prof",
		"framing_frame",
		"framing_frame_prof",
		"welcome_to_the_jungle_wrapper_prof",
		"welcome_to_the_jungle_prof",
		"family",
		"roberts",
		"election_day",
		"election_day_prof",
		"kosugi",
		"arm_fac",
		"arm_par",
		"arm_hcm",
		"arm_und",
		"arm_cro",
		"big"
	}
	self:set_job_wrappers()
end
function NarrativeTweakData:set_job_wrappers()
	for _, job_id in ipairs(self._jobs_index) do
		local job_wrapper = self.jobs[job_id].job_wrapper
		if job_wrapper then
			for _, wrapped_job_id in ipairs(job_wrapper) do
				if self.jobs[wrapped_job_id].job_wrapper then
					Application:throw_exception("Can't wrap " .. tostring(wrapped_job_id) .. " into another wrapper.")
				elseif self.jobs[wrapped_job_id].wrapped_to_job then
					Application:throw_exception("The job " .. tostring(wrapped_job_id) .. " is already included in another wrapper (" .. tostring(self.jobs[wrapped_job_id].wrapped_to_job) .. ")")
				else
					self.jobs[wrapped_job_id].wrapped_to_job = job_id
				end
			end
		end
	end
end
function NarrativeTweakData:has_job_wrapper(job_id)
	return self.jobs[job_id] and not not self.jobs[job_id].job_wrapper
end
function NarrativeTweakData:is_wrapped_to_job(job_id)
	return self.jobs[job_id] and not not self.jobs[job_id].wrapped_to_job
end
function NarrativeTweakData:get_jobs_index()
	return self._jobs_index
end
function NarrativeTweakData:get_index_from_job_id(job_id)
	for index, entry_name in ipairs(self._jobs_index) do
		if entry_name == job_id then
			return index
		end
	end
	return 0
end
function NarrativeTweakData:get_job_name_from_index(index)
	return self._jobs_index[index]
end
function NarrativeTweakData:job_data(job_id, unique_to_job)
	if not job_id or not self.jobs[job_id] then
		return
	end
	if unique_to_job then
		return self.jobs[job_id]
	end
	if self.jobs[job_id].wrapped_to_job then
		return self.jobs[self.jobs[job_id].wrapped_to_job]
	end
	return self.jobs[job_id]
end
function NarrativeTweakData:job_chain(job_id)
	if not job_id or not self.jobs[job_id] then
		return {}
	end
	if self.jobs[job_id].job_wrapper then
		return self.jobs[self.jobs[job_id].job_wrapper[1]].chain or {}
	end
	return self.jobs[job_id].chain or {}
end
function NarrativeTweakData:create_job_name(job_id)
	local color_ranges
	local job_tweak = self:job_data(job_id)
	local text_id = managers.localization:to_upper_text(job_tweak.name_id)
	if job_tweak.dlc and tweak_data.dlc[job_tweak.dlc] and not tweak_data.dlc[job_tweak.dlc].free then
		local pro_text = "  DLC"
		local s_len = utf8.len(text_id)
		text_id = text_id .. pro_text
		local e_len = utf8.len(text_id)
		color_ranges = {
			start = s_len,
			stop = e_len,
			color = tweak_data.screen_colors.dlc_color
		}
	end
	if job_tweak.professional then
		local pro_text = "  " .. managers.localization:to_upper_text("cn_menu_pro_job")
		local s_len = utf8.len(text_id)
		text_id = text_id .. pro_text
		local e_len = utf8.len(text_id)
		color_ranges = {
			start = s_len,
			stop = e_len,
			color = tweak_data.screen_colors.pro_color
		}
	end
	return text_id, color_ranges
end
function NarrativeTweakData:test_contract_packages()
	for i, job_id in ipairs(self._jobs_index) do
		local package = self.jobs[job_id] and self.jobs[job_id].package
		if not package or not DB:has(Idstring("package"), package) then
			print("test_contract_packages", "1", job_id)
		end
	end
	for job_id, job in ipairs(self.jobs) do
		if job.package and not DB:has(Idstring("package"), job.package) then
			print("test_contract_packages", "2", job_id)
		end
	end
end
