let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:faded0 = ["#252933", "NONE"]
let s:faded1 = ["#3B4252", 0]
let s:faded2 = ["#434C5E", "NONE"]
let s:faded3 = ["#3B4252", 8]
let s:faded4 = ["#D8DEE9", "NONE"]
let s:faded5 = ["#E5E9F0", 7]
let s:faded6 = ["#ECEFF4", 15]
let s:faded7 = ["#8FBCBB", 14]
let s:faded8 = ["#83A2BE", 6]
let s:faded9 = ["#83A2BE", 4]
let s:faded10 = ["#5E81AC", 12]
let s:faded11 = ["#B77A76", 1]
let s:faded12 = ["#D08770", 11]
let s:faded13 = ["#CBB079", 3]
let s:faded14 = ["#B4BF86", 2]
let s:faded15 = ["#958090", 5]

let s:p.normal.left = [ [ s:faded1, s:faded8 ], [ s:faded5, s:faded1 ] ]
let s:p.normal.middle = [ [ s:faded5, s:faded3 ] ]
let s:p.normal.right = [ [ s:faded5, s:faded1 ], [ s:faded5, s:faded1 ] ]
let s:p.normal.warning = [ [ s:faded1, s:faded13 ] ]
let s:p.normal.error = [ [ s:faded1, s:faded11 ] ]

let s:p.inactive.left =  [ [ s:faded1, s:faded8 ], [ s:faded5, s:faded1 ] ]
let s:p.inactive.middle = [ [ s:faded5, s:faded1 ] ]
let s:p.inactive.right = [ [ s:faded5, s:faded1 ], [ s:faded5, s:faded1 ] ]

let s:p.insert.left = [ [ s:faded1, s:faded6 ], [ s:faded5, s:faded1 ] ]
let s:p.replace.left = [ [ s:faded1, s:faded13 ], [ s:faded5, s:faded1 ] ]
let s:p.visual.left = [ [ s:faded1, s:faded7 ], [ s:faded5, s:faded1 ] ]

let s:p.tabline.left = [ [ s:faded5, s:faded3 ] ]
let s:p.tabline.middle = [ [ s:faded5, s:faded3 ] ]
let s:p.tabline.right = [ [ s:faded5, s:faded3 ] ]
let s:p.tabline.tabsel = [ [ s:faded1, s:faded8 ] ]

let g:lightline#colorscheme#faded#palette = lightline#colorscheme#flatten(s:p)
