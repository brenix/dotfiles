let s:black = [ '#161616', '0' ]
let s:black2 = [ '#222222', '233' ]

let s:gray = [ '#353535', '235' ]
let s:gray2 = [ '#484848', '237' ]
let s:gray3 = [ '#595959', '239' ]
let s:gray4 = [ '#787878', '241' ]

let s:violet = [ '#7574a5', '170' ]

let s:blue = [ '#81b38c', '67' ]
let s:blue2 = [ '#507057', '110' ]

let s:green = [ '#a7ecb7', '71' ]
let s:gold = [ '#a5a5a5', '220' ]
let s:red = [ '#c05776', '160' ]
let s:none = [ 'NONE', 'NONE' ]


let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:black, s:blue ], [ s:gray4, s:black2 ] ]
let s:p.normal.right = [ [ s:gray, s:gray4 ], [ s:gray3, s:gray ], [ s:gray2, s:black2 ] ]
let s:p.inactive.right = [ [ s:black, s:black2 ], [ s:gray, s:black ] ]
let s:p.inactive.left =  [ [ s:gray, s:black ], [ s:black2, s:black ] ]
let s:p.insert.left = [ [ s:black, s:green ], [ s:gray4, s:black2 ] ]
let s:p.replace.left = [ [ s:black, s:red ], [ s:gray4, s:black2 ] ]
let s:p.visual.left = [ [ s:black, s:violet ], [ s:gray4, s:black2 ] ]
let s:p.normal.middle = [ [ s:gray, s:black ] ]
let s:p.inactive.middle = [ [ s:black2, s:black ] ]
let s:p.tabline.left = [ [ s:gray4, s:black ] ]
let s:p.tabline.tabsel = [ [ s:blue, s:black ] ]
let s:p.tabline.middle = [ [ s:black2, s:black ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:red, s:black ] ]
let s:p.normal.warning = [ [ s:gold, s:black2 ] ]

let g:lightline#colorscheme#grayscale#palette = lightline#colorscheme#flatten(s:p)
