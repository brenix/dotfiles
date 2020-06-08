
[38;5;4m[38;5;4mbspwm/.config/bspwm/bspwmrc[0m[0m
[38;5;4m──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────[0m
[38;5;4m───────────────────────────────────────────────────────[0m[38;5;4m┐[0m
[38;5;4m bspc config pointer_motion_interval 7 # 144hz refresh[0m [38;5;4m│[0m
[38;5;4m───────────────────────────────────────────────────────[0m[38;5;4m┘[0m
[38;5;4m35[0m
                                                                                                                                                
 # -- COLORS                                                                                                                                    
 source "${HOME}/.cache/wal/colors.sh"                                                                                                          
[48;5;52m bspc config normal_border_color "[48;5;131m#4C566A[48;5;52m"[0m[48;5;52m                                                                                                      [0m
[48;5;52m bspc config active_border_color "[48;5;131m#4C566A[48;5;52m"[0m[48;5;52m                                                                                                      [0m
[48;5;52m bspc config focused_border_color "[48;5;131m#81A1C1[48;5;52m"[0m[48;5;52m                                                                                                     [0m
[48;5;52m bspc config presel_feedback_color "[48;5;131m#4C566A[48;5;52m"[0m[48;5;52m                                                                                                    [0m
[48;5;22m bspc config normal_border_color "[48;5;65m#22262e[48;5;22m"[0m[48;5;22m                                                                                                      [0m
[48;5;22m bspc config active_border_color "[48;5;65m#22262e[48;5;22m"[0m[48;5;22m                                                                                                      [0m
[48;5;22m bspc config focused_border_color "[48;5;65m#6b7089[48;5;22m"[0m[48;5;22m                                                                                                     [0m
[48;5;22m bspc config presel_feedback_color "[48;5;65m#22262e[48;5;22m"[0m[48;5;22m                                                                                                    [0m
                                                                                                                                                
 # -- RULES                                                                                                                                     
 bspc rule -a Pavucontrol state=floating                                                                                                        
[38;5;4m──────────────────────────────────[0m[38;5;4m┐[0m
[38;5;4m bspc rule -a zoom state=floating[0m [38;5;4m│[0m
[38;5;4m──────────────────────────────────[0m[38;5;4m┘[0m
[38;5;4m48[0m
                                                                                                                                                
 polybar main -r &                                                                                                                              
 dunst &                                                                                                                                        
[48;5;52m #picom -b[0m[48;5;52m                                                                                                                                      [0m
[48;5;22m picom -b[0m[48;5;22m                                                                                                                                       [0m
 $HOME/.fehbg                                                                                                                                   
                                                                                                                                                
 # vim: set ft=sh:                                                                                                                              

[38;5;4m[38;5;4mncmpcpp/.config/ncmpcpp/config[0m[0m
[38;5;4m──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────[0m

[38;5;4m1[0m
[48;5;22m allow_for_physical_item_deletion = "yes"[0m[48;5;22m                                                                                                       [0m
[48;5;22m alternative_header_second_line_format = "$8{%a}$8"[0m[48;5;22m                                                                                             [0m
[48;5;22m alternative_ui_separator_color = "244"[0m[48;5;22m                                                                                                         [0m
 ask_before_clearing_playlists = "no"                                                                                                           
 autocenter_mode = "yes"                                                                                                                        
[48;5;22m browser_display_mode = "classic"[0m[48;5;22m                                                                                                               [0m
[48;5;22m browser_playlist_prefix = "$b$3▶$/b$5 "[0m[48;5;22m                                                                                                        [0m
 centered_cursor = "yes"                                                                                                                        
[48;5;52m color1 = cyan[0m[48;5;52m                                                                                                                                  [0m
[48;5;52m color2 = cyan[0m[48;5;52m                                                                                                                                  [0m
[48;5;22m clock_display_seconds = "no"[0m[48;5;22m                                                                                                                   [0m
[48;5;22m colors_enabled = "yes"[0m[48;5;22m                                                                                                                         [0m
 current_item_prefix = $(white)$r                                                                                                               
[48;5;52m enable_window_title = "[48;5;131myes[48;5;52m"[0m[48;5;52m                                                                                                                    [0m
[48;5;22m default_place_to_search_in = "database"[0m[48;5;22m                                                                                                        [0m
[48;5;22m discard_colors_if_item_is_selected = "yes"[0m[48;5;22m                                                                                                     [0m
[48;5;22m display_bitrate = "no"[0m[48;5;22m                                                                                                                         [0m
[48;5;22m display_remaining_time = "no"[0m[48;5;22m                                                                                                                  [0m
[48;5;22m display_volume_level = "yes"[0m[48;5;22m                                                                                                                   [0m
[48;5;22m empty_tag_marker = ""[0m[48;5;22m                                                                                                                          [0m
[48;5;22m enable_window_title = "[48;5;65mno[48;5;22m"[0m[48;5;22m                                                                                                                     [0m
[48;5;22m external_editor = "nvim"[0m[48;5;22m                                                                                                                       [0m
 header_visibility = "no"                                                                                                                       
[48;5;52m main_window_color = white[0m[48;5;52m                                                                                                                      [0m
[48;5;22m header_window_color = "white"[0m[48;5;22m                                                                                                                  [0m
[48;5;22m ignore_leading_the = "yes"[0m[48;5;22m                                                                                                                     [0m
[48;5;22m main_window_color = "white"[0m[48;5;22m                                                                                                                    [0m
[48;5;22m message_delay_time = 2[0m[48;5;22m                                                                                                                         [0m
[48;5;22m mouse_support = "yes"[0m[48;5;22m                                                                                                                          [0m
 mpd_music_dir = "/music"                                                                                                                       
 ncmpcpp_directory = "~/.ncmpcpp"                                                                                                               
 playlist_display_mode = "classic"                                                                                                              
[48;5;22m playlist_separate_albums = "no"[0m[48;5;22m                                                                                                                [0m
[48;5;22m playlist_show_remaining_time = "no"[0m[48;5;22m                                                                                                            [0m
 progressbar_color = "black"                                                                                                                    
[48;5;52m progressbar_elapsed_color = "[48;5;131mcyan[48;5;52m"[0m[48;5;52m                                                                                                             [0m
[48;5;22m progressbar_elapsed_color = "[48;5;65mblue[48;5;22m"[0m[48;5;22m                                                                                                             [0m
 progressbar_look = "━━━"                                                                                                                       
[48;5;52m song_columns_list_format = "(25)[blue]{A} (40)[red]{t|f} (30)[magenta]{b}"[0m[48;5;52m                                                                     [0m
[48;5;52m song_list_format = {%A - }{%t}|{$8%f$9}$R{$5$b(%l)$9}[0m[48;5;52m                                                                                          [0m
[48;5;22m search_engine_display_mode = "classic"[0m[48;5;22m                                                                                                         [0m
[48;5;22m selected_item_suffix = "$b$4 *$0$/b"[0m[48;5;22m                                                                                                           [0m
[48;5;22m song_columns_list_format = "(7)[244]{l} (30)[yellow]{a} (40)[blue]{t|f:Title} (20)[cyan]{b}"[0m[48;5;22m                                                   [0m
[48;5;22m song_library_format = {%t}|{%f}[0m[48;5;22m                                                                                                                [0m
[48;5;22m song_list_format = "$7{%a $8 }{$5{%t}$0}$R{$4$b(%l)$9}"[0m[48;5;22m                                                                                       [0m
 state_flags_color = cyan                                                                                                                       
 statusbar_visibility = "no"                                                                                                                    
 titles_visibility = "no"                                                                                                                       
[48;5;52m user_interface = "[48;5;131mclassic[48;5;52m"[0m[48;5;52m                                                                                                                     [0m
[48;5;52m visualizer_color = cyan[0m[48;5;52m                                                                                                                        [0m
[48;5;22m user_interface = "[48;5;65malternative[48;5;22m"[0m[48;5;22m                                                                                                                 [0m
 visualizer_fifo_path = "/tmp/mpd.fifo"                                                                                                         
 visualizer_in_stereo = "yes"                                                                                                                   
[48;5;52m visualizer_look = [48;5;131m●▮[0m[48;5;52m                                                                                                                           [0m
[48;5;52m visualizer_output_name = "[48;5;131mmy_fifo[48;5;52m"[0m[48;5;52m                                                                                                             [0m
[48;5;52m visualizer_sync_interval = [48;5;131m"30"[0m[48;5;52m                                                                                                                [0m
[48;5;52m visualizer_type = "spectrum"[0m[48;5;52m                                                                                                                   [0m
[48;5;22m visualizer_look = [48;5;65m●●[0m[48;5;22m                                                                                                                           [0m
[48;5;22m visualizer_output_name = "[48;5;65mvisualizer[48;5;22m"[0m[48;5;22m                                                                                                          [0m
[48;5;22m visualizer_sync_interval = [48;5;65m30[0m[48;5;22m                                                                                                                  [0m
[48;5;22m volume_color = "blue"[0m[48;5;22m                                                                                                                          [0m
 window_border_color = cyan                                                                                                                     
                                                                                                                                                
 # vim: set ft=dosini:                                                                                                                          

[38;5;4m[38;5;4mnvim/.config/nvim/init.vim[0m[0m
[38;5;4m──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────[0m
[38;5;4m──────────────────────────[0m[38;5;4m┐[0m
[38;5;4m Plug 'tpope/vim-vinegar'[0m [38;5;4m│[0m
[38;5;4m──────────────────────────[0m[38;5;4m┘[0m
[38;5;4m56[0m
                                                                                                                                                
 " Colorschemes                                                                                                                                 
 Plug 'arcticicestudio/nord-vim'                                                                                                                
[48;5;22m Plug 'cocopon/iceberg.vim'[0m[48;5;22m                                                                                                                     [0m
 Plug 'cormacrelf/vim-colors-github'                                                                                                            
 Plug 'dylanaraps/wal.vim'                                                                                                                      
 Plug 'habamax/vim-colors-lessthan'                                                                                                             
[38;5;4m─────────────[0m[38;5;4m┐[0m
[38;5;4m augroup end[0m [38;5;4m│[0m
[38;5;4m─────────────[0m[38;5;4m┘[0m
[38;5;4m182[0m
 " --- Colors {{{                                                                                                                               
                                                                                                                                                
 " Enable truecolor support in NVIM                                                                                                             
[48;5;52m if (has("nvim"))[0m[48;5;52m                                                                                                                               [0m
[48;5;52m   let $NVIM_TUI_ENABLE_TRUE_COLOR=1[0m[48;5;52m                                                                                                            [0m
[48;5;52m   set termguicolors[0m[48;5;52m                                                                                                                            [0m
[48;5;52m endif[0m[48;5;52m                                                                                                                                          [0m
[48;5;22m [48;5;65m"[48;5;22m if (has("nvim"))[0m[48;5;22m                                                                                                                             [0m
[48;5;22m [48;5;65m"[48;5;22m   let $NVIM_TUI_ENABLE_TRUE_COLOR=1[0m[48;5;22m                                                                                                          [0m
[48;5;22m [48;5;65m"[48;5;22m   set termguicolors[0m[48;5;22m                                                                                                                          [0m
[48;5;22m [48;5;65m"[48;5;22m endif[0m[48;5;22m                                                                                                                                        [0m
                                                                                                                                                
 " Enable syntax highlighting                                                                                                                   
 syntax enable                                                                                                                                  
[38;5;4m───────────────[0m[38;5;4m┐[0m
[38;5;4m syntax enable[0m [38;5;4m│[0m
[38;5;4m───────────────[0m[38;5;4m┘[0m
[38;5;4m194[0m
 set background=dark                                                                                                                            
                                                                                                                                                
 " Selected colorscheme                                                                                                                         
[48;5;52m colorscheme [48;5;131mnord[0m[48;5;52m                                                                                                                               [0m
[48;5;22m colorscheme [48;5;65miceberg[0m[48;5;22m                                                                                                                            [0m
                                                                                                                                                
 " }}}                                                                                                                                          
                                                                                                                                                
[38;5;4m─────────────[0m[38;5;4m┐[0m
[38;5;4m endfunction[0m [38;5;4m│[0m
[38;5;4m─────────────[0m[38;5;4m┘[0m
[38;5;4m388[0m
                                                                                                                                                
 " Set lightline config                                                                                                                         
 let g:lightline = {                                                                                                                            
[48;5;52m   \ 'colorscheme': '[48;5;131mnord[48;5;52m',[0m[48;5;52m                                                                                                                     [0m
[48;5;22m   \ 'colorscheme': '[48;5;65mxresources[48;5;22m',[0m[48;5;22m                                                                                                               [0m
   \ 'active': {                                                                                                                                
[48;5;52m   \   'left': [ [ 'mode', 'paste' ],[0m[48;5;52m                                                                                                           [0m
[48;5;52m   \   [48;5;131m          [48;5;52m[ 'cocstatus', 'currentfunction', '[48;5;131mgitbranch[48;5;52m', '[48;5;131mreadonly[48;5;52m', '[48;5;131mfilename[48;5;52m', 'modified' ] ][0m[48;5;52m                                          [0m
[48;5;22m   \   [48;5;65m'left': [ [48;5;22m[ 'cocstatus', 'currentfunction', '[48;5;65mfilename[48;5;22m', '[48;5;65mgitbranch[48;5;22m', '[48;5;65mreadonly[48;5;22m', 'modified' ] ][0m[48;5;22m                                          [0m
   \ },                                                                                                                                         
   \ 'component_function': {                                                                                                                    
   \   'gitbranch': 'fugitive#head',                                                                                                            

[38;5;4m[38;5;4mpicom/.config/picom/picom.conf[0m[0m
[38;5;4m──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────[0m

[38;5;4m1[0m
 # -- general settings                                                                                                                          
[48;5;52m backend = "[48;5;131mglx[48;5;52m";[0m[48;5;52m                                                                                                                               [0m
[48;5;22m backend = "[48;5;65mxrender[48;5;22m";[0m[48;5;22m                                                                                                                           [0m
                                                                                                                                                
 # -- shadow                                                                                                                                    
 shadow = true;                                                                                                                                 
[38;5;4m────────────────────[0m[38;5;4m┐[0m
[38;5;4m shadow-radius = 12[0m [38;5;4m│[0m
[38;5;4m────────────────────[0m[38;5;4m┘[0m
[38;5;4m7[0m
 shadow-opacity = .75                                                                                                                           
 shadow-offset-x = -7;                                                                                                                          
 shadow-offset-y = -7;                                                                                                                          
[48;5;22m shadow-exclude = [[0m[48;5;22m                                                                                                                             [0m
[48;5;22m     "class_g *?= 'polybar'",[0m[48;5;22m                                                                                                                   [0m
[48;5;22m     "class_g = 'Bspwm' && class_i = 'presel_feedback'",[0m[48;5;22m                                                                                        [0m
[48;5;22m ];[0m[48;5;22m                                                                                                                                             [0m
[48;5;22m dropdown_menu = { shadow = false; };[0m[48;5;22m                                                                                                           [0m
[48;5;22m popup_menu    = { shadow = false; };[0m[48;5;22m                                                                                                           [0m
[48;5;22m utility       = { shadow = false; };[0m[48;5;22m                                                                                                           [0m
                                                                                                                                                
 # -- opacity                                                                                                                                   
 active-opacity = 1.0;                                                                                                                          
[38;5;4m──────────────────────[0m[38;5;4m┐[0m
[38;5;4m frame-opacity = 1.0;[0m [38;5;4m│[0m
[38;5;4m──────────────────────[0m[38;5;4m┘[0m
[38;5;4m22[0m
 inactive-opacity-override = false;                                                                                                             
                                                                                                                                                
 opacity-rule = [                                                                                                                               
[48;5;52m   "100:class_g    = 'Google-chrome'",[0m[48;5;52m                                                                                                          [0m
[48;5;52m   "100:class_g    = 'Nightly'",[0m[48;5;52m                                                                                                                [0m
[48;5;52m   "100:class_g    = 'Polybar'",[0m[48;5;52m                                                                                                                [0m
[48;5;52m   "100:class_g    = 'Slack'",[0m[48;5;52m                                                                                                                  [0m
[48;5;52m   "100:class_g    = 'code'",[0m[48;5;52m                                                                                                                   [0m
[48;5;52m   "100:class_g    = 'feh'",[0m[48;5;52m                                                                                                                    [0m
[48;5;52m   "100:class_g    = 'firefox'",[0m[48;5;52m                                                                                                                [0m
[48;5;52m   "100:class_g    = 'mpv'",[0m[48;5;52m                                                                                                                    [0m
[48;5;52m   "100:class_g    = 'zoom'"[0m[48;5;52m                                                                                                                    [0m
[48;5;22m   "90:class_g *?= 'st'"[0m[48;5;22m                                                                                                                        [0m
 ];                                                                                                                                             
                                                                                                                                                
 # fading                                                                                                                                       

[38;5;4m[38;5;4mpolybar/.config/polybar/config[0m[0m
[38;5;4m──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────[0m
[38;5;4m────────────────[0m[38;5;4m┐[0m
[38;5;4m margin-top = 1[0m [38;5;4m│[0m
[38;5;4m────────────────[0m[38;5;4m┘[0m
[38;5;4m8[0m
 margin-bottom = 1                                                                                                                              
                                                                                                                                                
 [colors]                                                                                                                                       
[48;5;52m background     = "[48;5;131m#2e3440[48;5;52m"[0m[48;5;52m                                                                                                                     [0m
[48;5;22m background     = "[48;5;65m#161821[48;5;22m"[0m[48;5;22m                                                                                                                     [0m
 foreground     = ${xrdb:color15}                                                                                                               
 foreground-alt = ${xrdb:color7}                                                                                                                
 primary        = ${xrdb:color1}                                                                                                                

[38;5;4m[38;5;4mrofi/.config/rofi/config.rasi[0m[0m
[38;5;4m──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────[0m

[38;5;4m1[0m
 configuration {                                                                                                                                
     bw: 0;                                                                                                                                     
[48;5;52m     color-active: "#252933, #606778, #252933, #4c566a, #e5e9f0";[0m[48;5;52m                                                                               [0m
[48;5;52m     color-normal: "#252933, #606778, #252933, #4c566a, #e5e9f0";[0m[48;5;52m                                                                               [0m
[48;5;52m     color-urgent: "#252933, #606778, #252933, #4c566a, #e5e9f0";[0m[48;5;52m                                                                               [0m
[48;5;52m     color-window: "[48;5;131m#252933[48;5;52m, #606778";[0m[48;5;52m                                                                                                          [0m
[48;5;22m     color-active: "#161821, #606778, #161821, #1e2029, #e5e9f0";[0m[48;5;22m                                                                               [0m
[48;5;22m     color-normal: "#161821, #606778, #161821, #1e2029, #e5e9f0";[0m[48;5;22m                                                                               [0m
[48;5;22m     color-urgent: "#161821, #606778, #161821, #1e2029, #e5e9f0";[0m[48;5;22m                                                                               [0m
[48;5;22m     color-window: "[48;5;65m#161821[48;5;22m, #606778";[0m[48;5;22m                                                                                                          [0m
     combi-hide-mode-prefix: true;                                                                                                              
     combi-modi: "window,run";                                                                                                                  
     dpi: 91;                                                                                                                                   
     eh: 1;                                                                                                                                     
[48;5;52m     font: "Terminus [48;5;131m9[48;5;52m";[0m[48;5;52m                                                                                                                        [0m
[48;5;22m     font: "Terminus [48;5;65m10[48;5;22m";[0m[48;5;22m                                                                                                                       [0m
     hide-scrollbar: true;                                                                                                                      
     line-margin: 1;                                                                                                                            
     lines: 10;                                                                                                                                 

[38;5;4m[38;5;4mx11/.Xresources[0m[0m
[38;5;4m──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────[0m
[38;5;4m─────────────────────────────[0m[38;5;4m┐[0m
[38;5;4m URxvt.cursorBlink:        1[0m [38;5;4m│[0m
[38;5;4m─────────────────────────────[0m[38;5;4m┘[0m
[38;5;4m33[0m
 URxvt.cursorUnderline:    1                                                                                                                    
                                                                                                                                                
 ! -- colors                                                                                                                                    
[48;5;52m #include ".xcolors.d/[48;5;131mnord[48;5;52m"[0m[48;5;52m                                                                                                                     [0m
[48;5;22m #include ".xcolors.d/[48;5;65miceberg[48;5;22m"[0m[48;5;22m                                                                                                                  [0m

[38;5;4m[38;5;4mx11/.xinitrc[0m[0m
[38;5;4m──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────[0m
[38;5;4m───────────────────────────────────────────────[0m[38;5;4m┐[0m
[38;5;4m nvidia-settings -a InitialPixmapPlacement=2 \[0m [38;5;4m│[0m
[38;5;4m───────────────────────────────────────────────[0m[38;5;4m┘[0m
[38;5;4m42[0m
   -a GpuPowerMizerMode=1                                                                                                                       
                                                                                                                                                
 # -- window manager                                                                                                                            
[48;5;52m #exec openbox-session[0m[48;5;52m                                                                                                                          [0m
 exec bspwm                                                                                                                                     

[38;5;4m[38;5;4mzsh/.zsh.d/prompt.zsh[0m[0m
[38;5;4m──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────[0m

[38;5;4m1[0m
 # spaceship configuration                                                                                                                      
 SPACESHIP_PROMPT_ORDER=(                                                                                                                       
[48;5;52m   [48;5;131m# [48;5;52muser      # Username section[0m[48;5;52m                                                                                                               [0m
[48;5;52m   [48;5;131m# [48;5;52mhost      # Hostname section[0m[48;5;52m                                                                                                               [0m
[48;5;22m   user      # Username section[0m[48;5;22m                                                                                                                 [0m
[48;5;22m   host      # Hostname section[0m[48;5;22m                                                                                                                 [0m
   dir       # Current directory section                                                                                                        
   git       # Git section (git_branch + git_status)                                                                                            
   venv      # Python virtualenv section                                                                                                        
