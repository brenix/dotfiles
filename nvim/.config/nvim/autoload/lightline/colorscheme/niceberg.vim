let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:niceberg0 = ["#252933", "NONE"]
let s:niceberg1 = ["#3b4252", 0]
let s:niceberg2 = ["#434c5e", "NONE"]
let s:niceberg3 = ["#20252d", 8]
let s:niceberg4 = ["#d8dee9", "NONE"]
let s:niceberg5 = ["#e5e9f0", 7]
let s:niceberg6 = ["#eceff4", 15]
let s:niceberg7 = ["#89b8c2", 14]
let s:niceberg8 = ["#3F4149", 6]
let s:niceberg9 = ["#3F4149", 4]
let s:niceberg10 = ["#5e81ac", 12]
let s:niceberg11 = ["#e27878", 1]
let s:niceberg12 = ["#d08770", 11]
let s:niceberg13 = ["#cbb079", 3]
let s:niceberg14 = ["#b4be82", 2]
let s:niceberg15 = ["#958090", 5]

let s:p.normal.left = [ [ s:niceberg4, s:niceberg8 ], [ s:niceberg5, s:niceberg1 ] ]
let s:p.normal.middle = [ [ s:niceberg5, s:niceberg3 ] ]
let s:p.normal.right = [ [ s:niceberg5, s:niceberg1 ], [ s:niceberg5, s:niceberg1 ] ]
let s:p.normal.warning = [ [ s:niceberg1, s:niceberg13 ] ]
let s:p.normal.error = [ [ s:niceberg1, s:niceberg11 ] ]

let s:p.inactive.left =  [ [ s:niceberg4, s:niceberg8 ], [ s:niceberg5, s:niceberg1 ] ]
let s:p.inactive.middle = [ [ s:niceberg5, s:niceberg1 ] ]
let s:p.inactive.right = [ [ s:niceberg5, s:niceberg1 ], [ s:niceberg5, s:niceberg1 ] ]

let s:p.insert.left = [ [ s:niceberg1, s:niceberg14 ], [ s:niceberg5, s:niceberg1 ] ]
let s:p.replace.left = [ [ s:niceberg1, s:niceberg13 ], [ s:niceberg5, s:niceberg1 ] ]
let s:p.visual.left = [ [ s:niceberg1, s:niceberg7 ], [ s:niceberg5, s:niceberg1 ] ]

let s:p.tabline.left = [ [ s:niceberg5, s:niceberg3 ] ]
let s:p.tabline.middle = [ [ s:niceberg5, s:niceberg3 ] ]
let s:p.tabline.right = [ [ s:niceberg5, s:niceberg3 ] ]
let s:p.tabline.tabsel = [ [ s:niceberg4, s:niceberg8 ] ]

let g:lightline#colorscheme#niceberg#palette = lightline#colorscheme#flatten(s:p)
