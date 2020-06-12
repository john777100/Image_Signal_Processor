#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri Jun 12 18:12:20 2020                
#                                                     
#######################################################

#@(#)CDS: Innovus v17.11-s080_1 (64bit) 08/04/2017 11:13 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 17.11-s080_1 NR170721-2155/17_11-UB (database version 2.30, 390.7.1) {superthreading v1.44}
#@(#)CDS: AAE 17.11-s034 (64bit) 08/04/2017 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 17.11-s053_1 () Aug  1 2017 23:31:41 ( )
#@(#)CDS: SYNTECH 17.11-s012_1 () Jul 21 2017 02:29:12 ( )
#@(#)CDS: CPE v17.11-s095
#@(#)CDS: IQRC/TQRC 16.1.1-s215 (64bit) Thu Jul  6 20:18:10 PDT 2017 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set init_gnd_net GND
set init_lef_file {lef/header6_V55_20ka_cic.lef lef/fsa0m_a_generic_core.lef lef/FSA0M_A_GENERIC_CORE_ANT_V55.lef lef/fsa0m_a_t33_generic_io.lef lef/FSA0M_A_T33_GENERIC_IO_ANT_V55.lef lef/BONDPAD.lef}
set init_verilog design/CHIP_syn.v
set init_mmmc_file mmmc.view
set init_io_file design/CHIP.ioc
set init_top_cell CHIP
set init_pwr_net VCC
init_design
clearGlobalNets
globalNetConnect VCC -type pgpin -pin VCC -inst *
globalNetConnect GND -type pgpin -pin GND -inst *
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site core_5040 -d 1500 1500 80 80 80 80
uiSetTool select
getIoFlowFlag
fit
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer metal6 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VCC GND} -type core_rings -follow core -layer {top metal5 bottom metal5 left metal4 right metal4} -width {top 2 bottom 2 left 2 right 2} -spacing {top 0.28 bottom 0.28 left 0.28 right 0.28} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None -use_wire_group 1 -use_wire_group_bits 15 -use_interleaving_wire_group 1
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { padPin } -layerChangeRange { metal1(1) metal6(6) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -allowJogging 1 -crossoverViaLayerRange { metal1(1) metal6(6) } -nets { VCC GND } -allowLayerChange 1 -targetViaLayerRange { metal1(1) metal6(6) }
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length 0 -stacked_via_top_layer metal6 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring }
addStripe -nets {VCC GND} -layer metal4 -direction vertical -width 1 -spacing 0.28 -set_to_set_distance 400 -start_from left -start_offset 250 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit metal6 -padcore_ring_bottom_layer_limit metal1 -block_ring_top_layer_limit metal6 -block_ring_bottom_layer_limit metal1 -use_wire_group 0 -snap_wire_center_to_grid None -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { corePin } -layerChangeRange { metal1(1) metal6(6) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { metal1(1) metal6(6) } -nets { VCC GND } -allowLayerChange 1 -targetViaLayerRange { metal1(1) metal6(6) }
addIoFiller -cell EMPTY16D -prefix IOFILLER
addIoFiller -cell EMPTY8D -prefix IOFILLER
addIoFiller -cell EMPTY4D -prefix IOFILLER
addIoFiller -cell EMPTY2D -prefix IOFILLER
addIoFiller -cell EMPTY1D -prefix IOFILLER -fillAnyGap
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
verifyConnectivity -nets {VCC GND} -type special -noUnroutedNet -error 1000 -warning 50
saveDesign DBS/powerroute
setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -droutePostRouteSpreadWire 1
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DELC DELB DELA BUF8CK BUF8 BUF6CK BUF6 BUF4CK BUF4 BUF3CK BUF3 BUF2CK BUF2 BUF1S BUF1CK BUF12CK BUF1 INV8CK INV8 INV6CK INV6 INV4CK INV4 INV3CK INV3 INV2CK INV2 INV1S INV1CK INV12CK INV12 INV1} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 0 -placeIOPins 0 -moduleAwareSpare 0 -maxDensity 0.6 -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setPlaceMode -fp false
placeDesign
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -preCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_preCTS -outDir timingReports
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -preCTS
saveDesign DBS/placement
create_ccopt_clock_tree_spec -file ccopt.spec
ccopt_check_and_flatten_ilms_no_restore
set_ccopt_property case_analysis -pin ipad_clk_i/PD 0
set_ccopt_property case_analysis -pin ipad_clk_i/PU 0
set_ccopt_property case_analysis -pin ipad_clk_i/SMT 0
create_ccopt_clock_tree -name i_clk_i -source i_clk_i -no_skew_group
set_ccopt_property clock_period -pin i_clk_i 10
create_ccopt_skew_group -name i_clk_i/func_mode -sources i_clk_i -auto_sinks
set_ccopt_property include_source_latency -skew_group i_clk_i/func_mode true
set_ccopt_property target_insertion_delay -skew_group i_clk_i/func_mode 0.500
set_ccopt_property extracted_from_clock_name -skew_group i_clk_i/func_mode i_clk_i
set_ccopt_property extracted_from_constraint_mode_name -skew_group i_clk_i/func_mode func_mode
set_ccopt_property extracted_from_delay_corners -skew_group i_clk_i/func_mode {DC_max DC_min}
create_ccopt_skew_group -name i_clk_i/scan_mode -sources i_clk_i -auto_sinks
set_ccopt_property include_source_latency -skew_group i_clk_i/scan_mode true
set_ccopt_property target_insertion_delay -skew_group i_clk_i/scan_mode 0.500
set_ccopt_property extracted_from_clock_name -skew_group i_clk_i/scan_mode i_clk_i
set_ccopt_property extracted_from_constraint_mode_name -skew_group i_clk_i/scan_mode scan_mode
set_ccopt_property extracted_from_delay_corners -skew_group i_clk_i/scan_mode {DC_max DC_min}
check_ccopt_clock_tree_convergence
get_ccopt_property auto_design_state_for_ilms
getCTSMode -engine -quiet
ctd_win -id ctd_window
setLayerPreference pgGround -isVisible 0
setLayerPreference power -isVisible 0
setLayerPreference net -isVisible 0
setLayerPreference net -isVisible 1
setLayerPreference power -isVisible 1
setLayerPreference pgGround -isVisible 1
setLayerPreference net -isVisible 0
setLayerPreference power -isVisible 0
setLayerPreference pgPower -isVisible 0
setLayerPreference pgGround -isVisible 0
setLayerPreference clock -isVisible 0
setLayerPreference clock -isVisible 1
getCTSMode -engine -quiet
ctd_win -id ctd_window
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_postCTS -outDir timingReports
setLayerPreference pgGround -isVisible 1
setLayerPreference pgPower -isVisible 1
setLayerPreference power -isVisible 1
setLayerPreference net -isVisible 1
saveDesign DBS/cts
setNanoRouteMode -quiet -routeInsertAntennaDiode 1
setNanoRouteMode -quiet -routeAntennaCellName ANTENNA
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithTimingDriven 1
setNanoRouteMode -quiet -routeWithSiDriven 1
setNanoRouteMode -quiet -routeWithSiPostRouteFix 1
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
routeDesign -globalDetail -viaOpt -wireOpt
fit
setAnalysisMode -analysisType onChipVariation
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_postRoute -outDir timingReports
saveDesign DBS/route
getFillerMode -quiet
addFiller -cell FILLERCC FILLERBC FILLERAC FILLER8C FILLER4C FILLER2C FILLER8 FILLER64 FILLER4 FILLER32 FILLER2 FILLER16 FILLER1 -prefix FILLER
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
fit
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
verifyProcessAntenna -reportfile CHIP.antenna.rpt -error 1000
verifyConnectivity -nets {VCC GND} -type special -noUnroutedNet -error 1000 -warning 50
saveDesign DBS/corefiller
saveNetlist CHIP.v
setAnalysisMode -analysisType bcwc
write_sdf -max_view av_func_mode_max -min_view av_func_mode_min -edges noedge  -splitsetuphold -remashold -splitrecrem -min_period_edges none CHIP.sdf
set dbgLefDefOutVersion 5.8
global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.8
defOut -floorplan -netlist -routing CHIP.def
set dbgLefDefOutVersion 5.8
set dbgLefDefOutVersion 5.8
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_o_0 -loc 194.06 -56.92 -ori R0
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_o_1 -loc 310.62 -56.92 -ori R0
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_o_2 -loc 427.18 -56.92 -ori R0
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_o_3 -loc 543.74 -56.92 -ori R0
addInst -physical -cell BONDPADD_m -inst BPad_ipad_CoreVSS2 -loc 660.3 -56.92 -ori R0
addInst -physical -cell BONDPADD_m -inst BPad_ipad_CoreVDD2 -loc 776.86 -56.92 -ori R0
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_o_4 -loc 893.42 -56.92 -ori R0
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_o_5 -loc 1009.98 -56.92 -ori R0
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_o_6 -loc 1126.54 -56.92 -ori R0
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_o_7 -loc 1243.1 -56.92 -ori R0
addInst -physical -cell BONDPADD_m -inst BPad_ipad_valid_o -loc 1499.78 194.11 -ori R90
addInst -physical -cell BONDPADD_m -inst BPad_ipad_color_o_0 -loc 1499.78 310.71 -ori R90
addInst -physical -cell BONDPADD_m -inst BPad_ipad_color_o_1 -loc 1499.78 427.31 -ori R90
addInst -physical -cell BONDPADD_m -inst BPad_ipad_last_col_o -loc 1499.78 543.91 -ori R90
addInst -physical -cell BONDPADD_m -inst BPad_ipad_IOVDD2 -loc 1499.78 660.51 -ori R90
addInst -physical -cell BONDPADD_m -inst BPad_ipad_IOVSS2 -loc 1499.78 777.11 -ori R90
addInst -physical -cell BONDPADD_m -inst BPad_ipad_last_pic_o -loc 1499.78 893.71 -ori R90
addInst -physical -cell BONDPADD_m -inst BPad_ipad_finish_operation_o -loc 1499.78 1010.31 -ori R90
addInst -physical -cell BONDPADD_m -inst BPad_ipad_clk_i -loc 1499.78 1126.91 -ori R90
addInst -physical -cell BONDPADD_m -inst BPad_ipad_rst_n_i -loc 1499.78 1243.51 -ori R90
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_i_7 -loc 1243.1 1500.24 -ori R180
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_i_6 -loc 1126.54 1500.24 -ori R180
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_i_5 -loc 1009.98 1500.24 -ori R180
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_i_4 -loc 893.42 1500.24 -ori R180
addInst -physical -cell BONDPADD_m -inst BPad_ipad_CoreVSS1 -loc 776.86 1500.24 -ori R180
addInst -physical -cell BONDPADD_m -inst BPad_ipad_CoreVDD1 -loc 660.3 1500.24 -ori R180
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_i_3 -loc 543.74 1500.24 -ori R180
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_i_2 -loc 427.18 1500.24 -ori R180
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_i_1 -loc 310.62 1500.24 -ori R180
addInst -physical -cell BONDPADD_m -inst BPad_ipad_pixel_i_0 -loc 194.06 1500.24 -ori R180
addInst -physical -cell BONDPADD_m -inst BPad_ipad_mode_i_2 -loc -56.92 1243.51 -ori R270
addInst -physical -cell BONDPADD_m -inst BPad_ipad_mode_i_1 -loc -56.92 1126.91 -ori R270
addInst -physical -cell BONDPADD_m -inst BPad_ipad_mode_i_0 -loc -56.92 1010.31 -ori R270
addInst -physical -cell BONDPADD_m -inst BPad_ipad_last_pic -loc -56.92 893.71 -ori R270
addInst -physical -cell BONDPADD_m -inst BPad_ipad_IOVSS1 -loc -56.92 777.11 -ori R270
addInst -physical -cell BONDPADD_m -inst BPad_ipad_IOVDD1 -loc -56.92 660.51 -ori R270
addInst -physical -cell BONDPADD_m -inst BPad_ipad_last_col -loc -56.92 543.91 -ori R270
addInst -physical -cell BONDPADD_m -inst BPad_ipad_color_i_1 -loc -56.92 427.31 -ori R270
addInst -physical -cell BONDPADD_m -inst BPad_ipad_color_i_0 -loc -56.92 310.71 -ori R270
addInst -physical -cell BONDPADD_m -inst BPad_ipad_valid_i -loc -56.92 194.11 -ori R270
setDrawView place
redraw
fit
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage 0 -1
panPage 1 0
fit
getIoFlowFlag
selectInst BPad_ipad_valid_i
panPage 0 1
deselectAll
selectInst BPad_ipad_pixel_i_7
add_text -layer metal5 -pt 1435 640 -label IOVDD -height 10
add_text -layer metal5 -pt 1435 750 -label IOVSS -height 10
fit
saveDesign DBS/finish
addMetalFill -layer { metal1 metal2 metal3 metal4 metal5 metal6 } -timingAware sta -slackThreshold 0.2
addMetalFill -layer { metal1 metal2 metal3 metal4 metal5 metal6 } -timingAware sta -slackThreshold 0.2
setStreamOutMode -specifyViaName default -SEvianames false -virtualConnection false -uniquifyCellNamesPrefix false -snapToMGrid false -textSize 1 -version 3
streamOut CHIP.gds -mapFile streamOut.map -merge { ./Phantom/fsa0m_a_generic_core_cic.gds ./Phantom/fsa0m_a_t33_generic_io_cic.gds ./Phantom/BONDPAD.gds} -stripes 1 -units 1000 -mode ALL
