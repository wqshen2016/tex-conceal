" Vim syntax file, better concealment for tex.
" Maintainer: Bram Pulles

if has('conceal') && &enc == 'utf-8'

	" Misc.
	syn match texDelimiter  '\\{'        contained conceal cchar={
	syn match texDelimiter  '\\}'        contained conceal cchar=}
	syn match texStatement  '``'         contained conceal cchar=“
	syn match texStatement  '\'\''       contained conceal cchar=”
	syn match texStatement  '\\item\>'   contained conceal cchar=•
	" logical symbols
	syn match texMathSymbol '\\lor\>' contained conceal cchar=∨
	syn match texMathSymbol '\\land\>' contained conceal cchar=∧
	syn match texMathSymbol '\\lnot\>' contained conceal cchar=¬
	syn match texMathSymbol '\\implies\>' contained conceal cchar=⇒
	syn match texMathSymbol '\\geqslant\>' contained conceal cchar=⩾
	syn match texMathSymbol '\\leqslant\>' contained conceal cchar=⩽
	" more reasonably sized symbols that were already defined
	syn match texMathSymbol '\\Rightarrow\>' contained conceal cchar=⇒
	syn match texMathSymbol '\\Leftarrow\>' contained conceal cchar=⇐
	syn match texMathSymbol '\\rightarrow\>' contained conceal cchar=→
	syn match texMathSymbol '\\leftarrow\>' contained conceal cchar=←
	syn match texMathSymbol '\\varphi\>' contained conceal cchar=φ
	syn match texMathSymbol '\\\\' contained conceal cchar=⏎
	" \mathcal characters
	syn match texMathSymbol '\\mathscr{A}' contained conceal cchar=𝓐
	syn match texMathSymbol '\\mathscr{B}' contained conceal cchar=𝓑
	syn match texMathSymbol '\\mathscr{C}' contained conceal cchar=𝓒
	syn match texMathSymbol '\\mathscr{D}' contained conceal cchar=𝓓
	syn match texMathSymbol '\\mathscr{E}' contained conceal cchar=𝓔
	syn match texMathSymbol '\\mathscr{F}' contained conceal cchar=𝓕
	syn match texMathSymbol '\\mathscr{G}' contained conceal cchar=𝓖
	syn match texMathSymbol '\\mathscr{H}' contained conceal cchar=𝓗
	syn match texMathSymbol '\\mathscr{I}' contained conceal cchar=𝓘
	syn match texMathSymbol '\\mathscr{J}' contained conceal cchar=𝓙
	syn match texMathSymbol '\\mathscr{K}' contained conceal cchar=𝓚
	syn match texMathSymbol '\\mathscr{L}' contained conceal cchar=𝓛
	syn match texMathSymbol '\\mathscr{M}' contained conceal cchar=𝓜
	syn match texMathSymbol '\\mathscr{N}' contained conceal cchar=𝓝
	syn match texMathSymbol '\\mathscr{O}' contained conceal cchar=𝓞
	syn match texMathSymbol '\\mathscr{P}' contained conceal cchar=𝓟
	syn match texMathSymbol '\\mathscr{Q}' contained conceal cchar=𝓠
	syn match texMathSymbol '\\mathscr{R}' contained conceal cchar=𝓡
	syn match texMathSymbol '\\mathscr{S}' contained conceal cchar=𝓢
	syn match texMathSymbol '\\mathscr{T}' contained conceal cchar=𝓣
	syn match texMathSymbol '\\mathscr{U}' contained conceal cchar=𝓤
	syn match texMathSymbol '\\mathscr{V}' contained conceal cchar=𝓥
	syn match texMathSymbol '\\mathscr{W}' contained conceal cchar=𝓦
	syn match texMathSymbol '\\mathscr{X}' contained conceal cchar=𝓧
	syn match texMathSymbol '\\mathscr{Y}' contained conceal cchar=𝓨
	syn match texMathSymbol '\\mathscr{Z}' contained conceal cchar=𝓩
	syn match texMathSymbol '\\pathspace' contained conceal cchar=Ω
	syn match texMathSymbol '\\surfaces' contained conceal cchar=𝓜

	" Conceal Left/Right combinations.
	let s:texMathDelimList = [
		\ ['<'            , '<'],
		\ ['>'            , '>'],
		\ ['|'            , '|'],
		\ ['\\|'          , '‖'],
		\ ['\\backslash'  , '\'],
		\ ['\\lceil'      , '⌈'],
		\ ['\\rceil'      , '⌉'],
		\ ['\\lfloor'     , '⌊'],
		\ ['\\rfloor'     , '⌋'],
		\ ['\\lgroup'     , '⌊'],
		\ ['\\rgroup'     , '⌋'],
		\ ['\\lmoustache' , '⎛'],
		\ ['\\rmoustache' , '⎞'],
		\ ['\\lbrace'     , '['],
		\ ['\\rbrace'     , ']'],
		\ ['\\downarrow'  , '↓'],
		\ ['\\Downarrow'  , '⇓'],
		\ ['\\uparrow'    , '↑'],
		\ ['\\Uparrow'    , '↑'],
		\ ['\\updownarrow', '↕'],
		\ ['\\Updownarrow', '⇕']]

	for texMathDelim in s:texMathDelimList
		exe "syn match texMathDelim '\\\\\\([bB]igg\\?\\|left\\|right\\)".texMathDelim[0]."' contained conceal cchar=".texMathDelim[1]
	endfor

	" Extra math symbols or redefinitions.
	let s:texMathList = [
		\ ['oplus'         , '⨭'],
		\ ['mathcal{O}'    , '𐐃'],
		\ ['phi'           , 'Φ'],
		\ ['sqrt'          , '√'],
		\ ['cdot'          , '·'],
		\ ['approx'        , '≈'],
		\ ['equiv'         , '≡'],
		\ ['square'        , '◻️'],
		\ ['lozenge'       , '◊'],
		\ [','             , ' '],
		\ [' '             , ' '],
		\ ['quad'          , ' '],
		\ ['langle'        , '⟨'],
		\ ['rangle'        , '⟩'],
		\ ['lnot'          , '¬'],
		\ ['geqslant'      , '⩾'],
		\ ['leqslant'      , '⩽'],
		\ ['vDash'         , '⊨'],
		\ ['models'        , '⊨'],
		\ ['setminus'      , '\'],
		\ ['where'         , '|'],
		\ ['mid'           , '|'],
		\ ['emptyset'      , 'Ø'],
		\ ['iff'           , '↔'],
		\ ['Leftrightarrow', '↔']]

	for texMath in s:texMathList
		exe "syn match texMathSymbol '\\\\".texMath[0]."' contained conceal cchar=".texMath[1]
	endfor

	" Sub scripts with numbers, letters and symbols mixed but smartly.
	let s:texSubScriptList = [
		\ [' '       , ' '],
		\ ['0'       , '₀'],
		\ ['1'       , '₁'],
		\ ['2'       , '₂'],
		\ ['3'       , '₃'],
		\ ['4'       , '₄'],
		\ ['5'       , '₅'],
		\ ['6'       , '₆'],
		\ ['7'       , '₇'],
		\ ['8'       , '₈'],
		\ ['9'       , '₉'],
		\ ['a'       , 'ₐ'],
		\ ['e'       , 'ₑ'],
		\ ['i'       , 'ᵢ'],
		\ ['j'       , 'ⱼ'],
		\ ['o'       , 'ₒ'],
		\ ['r'       , 'ᵣ'],
		\ ['u'       , 'ᵤ'],
		\ ['v'       , 'ᵥ'],
		\ ['x'       , 'ₓ'],
		\ ['+'       , '₊'],
		\ ['-'       , '₋'],
		\ ['='       , '₌'],
		\ ['('       , '₍'],
		\ [')'       , '₎'],
		\ ['\\phi'   , 'ᵩ'],
		\ ['\\chi'   , 'ᵪ'],
		\ ['\\beta'  , 'ᵦ'],
		\ ['\\gamma' , 'ᵧ'],
		\ ['\\rho'   , 'ᵨ']]

	for texSubScript in s:texSubScriptList
		exe "syn match texSubScriptBetter '".texSubScript[0]."' contained conceal cchar=".texSubScript[1]
	endfor

	" Here we will make sure that the subscripts will only be concealed if ALL of the
	" numbers/letters/symbols have a subscript equivalent, otherwise it is not concealed.
	" NOTE: This is super ugly, so please inform me if you know a better way.
	syn match texMathSymbol '_\(\([0-9]\|a\|e\|i\|j\|o\|r\|u\|v\|x\|+\|-\|=\|(\|)\|\\phi\|\\chi\|\\beta\|\\gamma\|\\rho\)\|{\([0-9]\|a\|e\|i\|j\|o\|r\|u\|v\|x\|+\|-\|=\|(\|)\|\\phi\|\\chi\|\\beta\|\\gamma\|\\rho\| \)\+}\)' contained conceal contains=texSubScriptBetter

	" Super scripts with numbers, letters and symbols mixed but smartly.
	let s:texSuperScriptList = [
		\ [' ', ' '],
		\ ['0', '⁰'],
		\ ['1', '¹'],
		\ ['2', '²'],
		\ ['3', '³'],
		\ ['4', '⁴'],
		\ ['5', '⁵'],
		\ ['6', '⁶'],
		\ ['7', '⁷'],
		\ ['8', '⁸'],
		\ ['9', '⁹'],
		\ ['a', 'ᵃ'],
		\ ['b', 'ᵇ'],
		\ ['c', 'ᶜ'],
		\ ['d', 'ᵈ'],
		\ ['e', 'ᵉ'],
		\ ['f', 'ᶠ'],
		\ ['g', 'ᵍ'],
		\ ['h', 'ʰ'],
		\ ['i', 'ⁱ'],
		\ ['j', 'ʲ'],
		\ ['k', 'ᵏ'],
		\ ['l', 'ˡ'],
		\ ['m', 'ᵐ'],
		\ ['n', 'ⁿ'],
		\ ['o', 'ᵒ'],
		\ ['p', 'ᵖ'],
		\ ['r', 'ʳ'],
		\ ['s', 'ˢ'],
		\ ['t', 'ᵗ'],
		\ ['u', 'ᵘ'],
		\ ['v', 'ᵛ'],
		\ ['w', 'ʷ'],
		\ ['x', 'ˣ'],
		\ ['y', 'ʸ'],
		\ ['z', 'ᶻ'],
		\ ['A', 'ᴬ'],
		\ ['B', 'ᴮ'],
		\ ['D', 'ᴰ'],
		\ ['E', 'ᴱ'],
		\ ['G', 'ᴳ'],
		\ ['H', 'ᴴ'],
		\ ['I', 'ᴵ'],
		\ ['J', 'ᴶ'],
		\ ['K', 'ᴷ'],
		\ ['L', 'ᴸ'],
		\ ['M', 'ᴹ'],
		\ ['N', 'ᴺ'],
		\ ['O', 'ᴼ'],
		\ ['P', 'ᴾ'],
		\ ['R', 'ᴿ'],
		\ ['T', 'ᵀ'],
		\ ['U', 'ᵁ'],
		\ ['W', 'ᵂ'],
		\ ['+', '⁺'],
		\ ['-', '⁻'],
		\ ['<', '˂'],
		\ ['>', '˃'],
		\ ['/', 'ˊ'],
		\ ['(', '⁽'],
		\ [')', '⁾'],
		\ ['=', '⁼'],
		\ ['\.','˙'],
		\ ['\beta', 'ᵝ'],
		\ ['\gamma', 'ᵞ'],
		\ ['\delta', 'ᵟ'],
		\ ['\phi', 'ᵠ'],
		\ ['\chi', 'ᵡ'],
		\ ['\theta', 'ᶿ']]

	for texSuperScript in s:texSuperScriptList
		exe "syn match texSuperScriptBetter '".texSuperScript[0]."' contained conceal cchar=".texSuperScript[1]
	endfor

	" Here we will make sure that the superscripts will only be concealed if ALL of the
	" numbers/letters/symbols have a superscript equivalent, otherwise it is not concealed.
	" Furthermore if there are multiple characters they either all have to be numbers or no
	" numbers at all since the superscript numbers have a different height than the rest.
	" NOTE: This is super ugly, so please inform me if you know a better way.
	syn match texMathSymbol '\^\(\([0-9]\|a\|b\|c\|d\|e\|f\|g\|h\|i\|j\|k\|l\|m\|n\|o\|p\|r\|s\|t\|u\|v\|w\|x\|y\|z\|A\|B\|D\|E\|G\|H\|I\|J\|K\|L\|M\|N\|O\|P\|R\|T\|U\|W\|+\|-\|<\|>\|/\|(\|)\|=\|\.\)\|{\(a\|b\|c\|d\|e\|f\|g\|h\|i\|j\|k\|l\|m\|n\|o\|p\|r\|s\|t\|u\|v\|w\|x\|y\|z\|A\|B\|D\|E\|G\|H\|I\|J\|K\|L\|M\|N\|O\|P\|R\|T\|U\|W\|+\|-\|<\|>\|/\|(\|)\|=\|\.\| \)\+}\|{[0-9]\+}\)' contained conceal contains=texSuperScriptBetter

	" All \mathbb characters.
	let s:texMathSymbolBbList = [
		\ [' ', ' '],
		\ ['A', '𝔸'],
		\ ['B', '𝔹'],
		\ ['C', 'ℂ'],
		\ ['D', '𝔻'],
		\ ['E', '𝔼'],
		\ ['F', '𝔽'],
		\ ['G', '𝔾'],
		\ ['H', 'ℍ'],
		\ ['I', '𝕀'],
		\ ['J', '𝕁'],
		\ ['K', '𝕂'],
		\ ['L', '𝕃'],
		\ ['M', '𝕄'],
		\ ['N', 'ℕ'],
		\ ['O', '𝕆'],
		\ ['P', 'ℙ'],
		\ ['Q', 'ℚ'],
		\ ['R', 'ℝ'],
		\ ['S', '𝕊'],
		\ ['T', '𝕋'],
		\ ['U', '𝕌'],
		\ ['V', '𝕍'],
		\ ['W', '𝕎'],
		\ ['X', '𝕏'],
		\ ['Y', '𝕐'],
		\ ['Z', 'ℤ']]

	for texMathSymbolBb in s:texMathSymbolBbList
		exe "syn match texMathSymbolBb '".texMathSymbolBb[0]."' contained conceal cchar=".texMathSymbolBb[1]
	endfor

	syn match texMathSymbol '\\mathbb{\(\s\|[A-Z]\)\+}' contained conceal contains=texMathSymbolBb

	" Do spell checking inside of the correct tex text statements.
	if !exists("g:tex_nospell") || !g:tex_nospell
		syn region texMathText matchgroup=texStatement start='\\mathrm\s*{'                    end='}' concealends keepend contains=@texFoldGroup        containedin=texMathMatcher
		syn region texMathText matchgroup=texStatement start='\\\(\(inter\)\=text\|mbox\)\s*{' end='}' concealends keepend contains=@texFoldGroup,@Spell containedin=texMathMatcher
	" Do not do any spell checking when it is turned of.
	else
		syn region texMathText matchgroup=texStatement start='\\\(\(inter\)\?text\|mbox\|mathrm\)\s*{' end='}' concealends keepend contains=@texFoldGroup containedin=texMathMatcher
	endif

	" Recognise align, align* and cases as a math environment to enable concealment there.
	syn region texMathZoneA matchgroup=texStatement start="\\begin{align}"   matchgroup=texStatement end="\\end{align}"   keepend contains=@texMathZoneGroup
	syn region texMathZoneA matchgroup=texStatement start="\\begin{align\*}" matchgroup=texStatement end="\\end{align\*}" keepend contains=@texMathZoneGroup
    syn region texMathZoneA matchgroup=texStatement start="\\begin{equation}"   matchgroup=texStatement end="\\end{equation}"   keepend contains=@texMathZoneGroup
    syn region texMathZoneA matchgroup=texStatement start="\\begin{equation\*}" matchgroup=texStatement end="\\end{equation\*}" keepend contains=@texMathZoneGroup    
	syn region texMathZoneA matchgroup=texStatement start="\\begin{cases}"   matchgroup=texStatement end="\\end{align\*}" keepend contains=@texMathZoneGroup

	" Add a syntax group for bold text in mathmode.
	syn cluster texMathZoneGroup add=texBoldMathText
	highlight texBoldMathText cterm=bold gui=bold

	" Hide \mathbf and \bm and make it bold. Text which is bold and italics.
	syn region texBoldMathText  matchgroup=texStatement start='\\\(mathbf\|bm\|mathsf\|mathtt\|textbf\){' end='}' concealends contains=@texMathZoneGroup containedin=texMathMatcher
	syn region texBoldItalStyle matchgroup=texTypeStyle start="\\\(emph\|texttt\|mathit\){"       end="}" concealends contains=@texItalGroup

	" If this is not set then the unicode charaters break monospacing when text is concealed.
	set ambiwidth=single
endif
