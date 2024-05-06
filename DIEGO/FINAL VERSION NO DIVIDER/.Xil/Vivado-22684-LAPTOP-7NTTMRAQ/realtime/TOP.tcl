# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/.Xil/Vivado-22684-LAPTOP-7NTTMRAQ/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xc7a100tcsg324-1

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common.tcl
    set rt::defaultWorkLibName xil_defaultlib

    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_verilog {
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/HA.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/FA.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/mux2to1.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/block0.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/divider_4bit.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/ArrMult_4bit.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/project_final.srcs/sources_1/new/AddSub_8bit.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/project_final.srcs/sources_1/new/BCD_to7Seg.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/project_final.srcs/sources_1/new/ALU.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/project_final.srcs/sources_1/new/Register.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/project_final.srcs/sources_1/new/time_multiplexer.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/project_final.srcs/sources_1/new/digit_Sep.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/project_final.srcs/sources_1/new/ControlUnit.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/project_final.srcs/sources_1/new/InstructionDecoder.v}
      {C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/project_final.srcs/sources_1/new/tempTOP.v}
    }
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top TOP
    set rt::reportTiming false
    rt::set_parameter elaborateOnly true
    rt::set_parameter elaborateRtl true
    rt::set_parameter eliminateRedundantBitOperator false
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter merge_flipflops true
    rt::set_parameter srlDepthThreshold 3
    rt::set_parameter rstSrlDepthThreshold 4
# MODE: 
    rt::set_parameter webTalkPath {}
    rt::set_parameter enableSplitFlowPath "C:/Users/jonat/OneDrive/Desktop/CECS-361-8BitRiscProcessor/DIEGO/FINAL VERSION NO DIVIDER/.Xil/Vivado-22684-LAPTOP-7NTTMRAQ/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
      rt::run_rtlelab -module $rt::top
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    if { $rt::flowresult == 1 } { return -code error }

    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] && [info exists rt::doParallel] && $rt::doParallel} { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] && [info exists rt::doParallel] && $rt::doParallel} { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
