	                                                   function RenderObj path ActionName prefix=
		
	
	
	
	
														(
																
															

																dir = #("0","1","2","3","4","5","6","7")
																																												
																for d = 1 to 8 do
																(
																	
																	outfilename = (path+ActionName+"\\"+prefix+dir[d]+".png")
																	render outputfile:outfilename camera:$Camera001 fromframe:rendStart toframe:rendEnd nthframe:rendNThFrame outputwidth:renderwidth outputheight:renderheight renderer:#production
																	
																	animate off
																	(															
																		rotate $Dummy001 45 [0,0,1]	
																	)															
																)	
																	
																												
																		
														)	
															rollout eight "render_8" width:171 height:239
															(
																button bCurrent4 "rotate camera" pos:[4,4] width:163 height:35
																
																label lbl1 "name" pos:[42,45] width:140 height:17
																edittext etDir "" pos:[40,60] width:98 height:17
																button bCurrent3 "render" pos:[4,200] width:163 height:35
																checkbox chk2 "Checkbox" pos:[40,82] width:9 height:12
																label lbl3 "path" pos:[60,82] width:128 height:16
																edittext edt2 "" pos:[33,100] width:133 height:18 enabled:false															
																label lbl37 "file" pos:[7,100] width:31 height:14
																button btn4 "128X128" pos:[42,120] width:56 height:20
																label lbl5 "size" pos:[5,120] width:37 height:16
																button btn6 "256X256" pos:[106,120] width:54 height:20 toolTip:""
																
																
																spinner spn1 "" pos:[42,150] width:44 height:16 range:[0,100,0] type:#integer 
																label lbl25 "range" pos:[4,150] width:37 height:15
																label lbl26 "to:" pos:[89,150] width:36 height:15
																spinner spn2 "" pos:[124,150] width:39 height:16 range:[0,100,0] type:#integer
																spinner spn3 "" pos:[83,180] width:42 height:16 range:[1,100,1] type:#integer
																label lbl27 "frame" pos:[29,180] width:52 height:18															
																on eight open do
																(
																spn1.range =[0,100,rendstart]
																spn2.range =[0,100,rendend]
																spn3.range =[1,100,rendNThFrame]
																)
																
																on bCurrent4 pressed do
																(
																	for i in helpers do
																		
																	if i==$Dummy001 then 
																		(
																			
																			rotate i (angleaxis 45 [0,0,1])
																			
																			
																			)
																)
																
																
																
																
																
																
																
																
																on bCurrent3 pressed do
																(							
																	temppath = maxfilepath
																	tempname = getfilenamefile maxfilename
																	
																																	
																	dir = #("0","1","2","3","4","5","6","7")
																	if chk2.checked then
																	(
																		pathname = edt2.text
																	)
																	else
																	(
																		pathname = temppath + tempname
																	)
																						
																	for d = 1 to 8 do
																	(								
																		outfilename = (pathname+"\\"+etDir.text + dir[d]+".png")
																		render outputfile:outfilename camera:$Camera001 fromframe:rendStart toframe:rendEnd nthframe:rendNThFrame outputwidth:renderwidth outputheight:renderheight renderer:#production progressbar:true
																		--renderers.production.AntiAiasing=false
																		animate off
																		(
																			rotate $Dummy001 45 [0,0,1]
																		)
																	)																		
																																
																)
																on chk2 changed state do
																(
																	if chk2.checked then
																	(
																		tempsavefilename = getsavepath()
																		if tempsavefilename == undefined then
																		(																		
																			chk2.checked = false
																			return false
																		)														
																		edt2.enabled =true
																		edt2.text =tempsavefilename																	
																	)
																	else
																	(
																		edt2.enabled =false
																	)
																)
																on btn4 pressed do
																(
																	scanlineRender.antiAliasFilter =catmull_rom()
																	renderWidth = 128
																	renderHeight= 128
																	
																)
																on btn6 pressed do
																(
																		scanlineRender.antiAliasFilter =catmull_rom()
																		renderWidth = 256
																		renderHeight= 256
																)
																
																on spn1 changed val do
																(
																rendStart=val
																)
																on spn2 changed val do
																(
																	rendEnd =val
																	)
																on spn3 changed val do
																(
																	rendNThFrame=val	
																	)
															)
															createdialog eight width:171 height:239
															