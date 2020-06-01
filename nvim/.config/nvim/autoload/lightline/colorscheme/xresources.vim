let s:mono0 = [ '', 232 ]
let s:mono1 = [ '', 233 ]
let s:mono2 = [ '', 234 ]
let s:mono3 = [ '', 235 ]
let s:mono4 = [ '', 239 ]
let s:mono5 = [ '', 243 ]
let s:mono6 = [ '', 247 ]
let s:mono7 = [ '', 250 ]

let s:black         = [ '', 0 ]
let s:red           = [ '', 1 ]
let s:green         = [ '', 2 ]
let s:yellow        = [ '', 3 ]
let s:blue          = [ '', 4 ]
let s:magenta       = [ '', 5 ]
let s:cyan          = [ '', 6 ]
let s:white         = [ '', 7 ]

let s:brightblack   = [ '', 8 ]
let s:brightred     = [ '', 9 ]
let s:brightgreen   = [ '', 10 ]
let s:brightyellow  = [ '', 11 ]
let s:brightblue    = [ '', 12 ]
let s:brightmagenta = [ '', 13 ]
let s:brightcyan    = [ '', 14 ]
let s:brightwhite   = [ '', 15 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" [[ guifg, guibg, ctermfg, ctermbg ], ...]
let s:p.normal.left     = [ [ s:black, s:blue ], [ s:white, s:black ] ]
let s:p.insert.left     = [ [ s:black, s:green ], [ s:white, s:black ] ]
let s:p.visual.left     = [ [ s:black, s:magenta ], [ s:white, s:mono3 ] ]
let s:p.replace.left    = [ [ s:black, s:red ], [ s:white, s:mono3 ] ]
let s:p.inactive.left   = [ [ s:mono3, s:black ] ]

let s:p.normal.middle   = [ [ s:white, s:black ] ]
let s:p.inactive.middle = [ [ s:mono2, s:black ] ]

let s:p.normal.right    = [ [ s:white, s:black ], [ s:white, s:black ] ]
let s:p.inactive.right  = [ [ s:white, s:black ] ]

let s:p.normal.error    = [ [ s:white, s:red ] ]
let s:p.normal.warning  = [ [ s:white, s:yellow ] ]

let s:p.tabline.left    = [ [ s:white, s:black] ]
let s:p.tabline.middle  = [ [ s:white, s:black] ]
let s:p.tabline.right   = [ [ s:white, s:black] ]
let s:p.tabline.tabsel  = [ [ s:black, s:blue ] ]

let g:lightline#colorscheme#xresources#palette = lightline#colorscheme#flatten(s:p)
