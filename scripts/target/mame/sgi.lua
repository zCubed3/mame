-- license:BSD-3-Clause
-- copyright-holders:MAMEdev Team

---------------------------------------------------------------------------
--
--   sgi.lua
--
--   Small driver-specific example makefile
--   Use make SUBTARGET=sgi to build
--
---------------------------------------------------------------------------


-- NOTE: PS2 sources are included due to how tightly bound it is to MAME's MIPS-3 implementation

--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in sgi.lst.
--------------------------------------------------

CPUS["MIPS3"] = true
CPUS["M6800"] = true
CPUS["M6805"] = true
CPUS["MCS51"] = true
CPUS["MCS48"] = true
CPUS["IE15"] = true
CPUS["Z80"] = true
CPUS["ARM"] = true
CPUS["UPD7810"] = true
CPUS["NEC"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in sgi.lst.
--------------------------------------------------

SOUNDS["CDDA"] = true
SOUNDS["DAC"] = true
SOUNDS["AY8910"] = true
SOUNDS["BEEP"] = true
SOUNDS["VOTRAX_SC01"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

VIDEOS["MC6845"] = true
VIDEOS["PS2GS"] = true
VIDEOS["PS2GIF"] = true

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["DS1386"] = true       
MACHINES["EDLC"] = true         
MACHINES["EEPROMDEV"] = true   
MACHINES["NSCSI"] = true    
MACHINES["SAA7191"] = true      
MACHINES["WD33C9X"] = true      
MACHINES["PCKEYBRD"] = true     
MACHINES["AT_KEYBC"] = true 
MACHINES["PIT8253"] = true      
MACHINES["Z80SCC"] = true      
MACHINES["PC_LPT"] = true      
MACHINES["INPUT_MERGER"] = true  
MACHINES["IE15"] = true      
MACHINES["INS8250"] = true      
MACHINES["MM5740"] = true      
MACHINES["Z80DAISY"] = true   
MACHINES["CHESSMACHINE"] = true    
MACHINES["MM74C922"] = true 
MACHINES["TASC_SB30"] = true   
MACHINES["TMS1024"] = true   
MACHINES["SENSORBOARD"] = true     
MACHINES["SWTPC8212"] = true     
MACHINES["PCF8573"] = true     
MACHINES["E05A03"] = true 
MACHINES["E05A30"] = true 
MACHINES["6821PIA"] = true     
MACHINES["BANKDEV"] = true    
MACHINES["BITMAP_PRINTER"] = true     
MACHINES["STEPPERS"] = true     
MACHINES["OUTPUT_LATCH"] = true  
MACHINES["PS2INTC"] = true     
MACHINES["VOTRAXTNT"] = true    
MACHINES["ACIA6850"] = true

--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

BUSES["NSCSI"] = true
BUSES["GIO64"] = true
BUSES["PC_KBD"] = true
BUSES["RS232"] = true
BUSES["H89BUS"] = true
BUSES["HEATH_TLB_CONNECTOR"] = true
BUSES["CENTRONICS"] = true
BUSES["VCS_CTRL"] = true
BUSES["SUNKBD"] = true

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in sgi.lst
--------------------------------------------------

function createProjects_mame_sgi(_target, _subtarget)
	project ("mame_sgi")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-sgi"))
	addprojectflags()
	precompiledheaders_novs()

	includedirs {
		MAME_DIR .. "src/osd",
		MAME_DIR .. "src/emu",
		MAME_DIR .. "src/devices",
		MAME_DIR .. "src/mame/shared",
		MAME_DIR .. "src/lib",
		MAME_DIR .. "src/lib/util",
		MAME_DIR .. "3rdparty",
		GEN_DIR  .. "mame/layout",
	}

files{
	MAME_DIR .. "src/mame/sgi/indy_indigo2.cpp",
    MAME_DIR .. "src/mame/sgi/hpc3.cpp",
    MAME_DIR .. "src/mame/sgi/ioc2.cpp",
    MAME_DIR .. "src/mame/sgi/vino.cpp",
    MAME_DIR .. "src/mame/sgi/mc.cpp",
    MAME_DIR .. "src/mame/sgi/hal2.cpp",
}
end

function linkProjects_mame_sgi(_target, _subtarget)
	links {
		"mame_sgi",
	}
end
