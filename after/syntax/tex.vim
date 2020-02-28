" Vim syntax file, better concealment for tex.
" Language:     TeX
" Maintainer:   Bram Pulles
" Last Change:  February 27, 2020
"
if has('conceal') && &enc == 'utf-8'
	" Misc.
	syn match texDelimiter  '\\{'        contained conceal cchar={
	syn match texDelimiter  '\\}'        contained conceal cchar=}

	syn match texStatement  '``'         contained conceal cchar=“
	syn match texStatement  '\'\''       contained conceal cchar=”
	syn match texStatement  '\\item\>'   contained conceal cchar=•

	" Extra math symbols or redefinitions.
	let s:texMathList = [
		\ ['oplus'      , '⨭'],
		\ ['mathcal{O}' , '𐐃'],
		\ ['phi'        , 'Φ'],
		\ ['sqrt'       , '√'],
		\ ['cdot'       , '·'],
		\ ['equiv'      , '≡'],
		\ ['square'     , '◻️'],
		\ ['lozenge'    , '◊'],
		\ [','          , ' '],
		\ [' '          , ' '],
		\ ['quad'       , ' '],
		\ ['langle'     , '⟨'],
		\ ['rangle'     , '⟩'],
		\ ['lnot'       , '¬'],
		\ ['geqslant'   , '⩾'],
		\ ['leqslant'   , '⩽'],
		\ ['vDash'      , '⊨'],
		\ ['models'     , '⊨'],
		\ ['setminus'   , '\'],
		\ ['where'      , '|'],
		\ ['emptyset'   , 'Ø']]

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
		\ ['h'       , 'ₕ'],
		\ ['i'       , 'ᵢ'],
		\ ['j'       , 'ⱼ'],
		\ ['k'       , 'ₖ'],
		\ ['l'       , 'ₗ'],
		\ ['m'       , 'ₘ'],
		\ ['n'       , 'ₙ'],
		\ ['o'       , 'ₒ'],
		\ ['p'       , 'ₚ'],
		\ ['r'       , 'ᵣ'],
		\ ['s'       , 'ₛ'],
		\ ['t'       , 'ₜ'],
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
	syn match texMathSymbol '_\(\([0-9]\|a\|e\|h\|i\|j\|k\|l\|m\|n\|o\|p\|r\|s\|t\|u\|v\|x\|+\|-\|=\|(\|)\|\\phi\|\\chi\|\\beta\|\\gamma\|\\rho\)\|{\([0-9]\|a\|e\|h\|i\|j\|k\|l\|m\|n\|o\|p\|r\|s\|t\|u\|v\|x\|+\|-\|=\|(\|)\|\\phi\|\\chi\|\\beta\|\\gamma\|\\rho\| \)\+}\)' contained conceal contains=texSubScriptBetter

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
		\ ['\.','˙']]

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
	syn match texMathSymbol '\\mathbb{\(\s\|[A-Z]\)\+}' contained conceal contains=texMathSymbolBb

	" Do spell checking inside of the correct tex text statements.
	if !exists("g:tex_nospell") || !g:tex_nospell
		syn region texMathText matchgroup=texStatement start='\\mathrm\s*{'                    end='}' concealends keepend contains=@texFoldGroup        containedin=texMathMatcher
		syn region texMathText matchgroup=texStatement start='\\\(\(inter\)\=text\|mbox\)\s*{' end='}' concealends keepend contains=@texFoldGroup,@Spell containedin=texMathMatcher

	" Do not do any spell checking when it is turned of.
	else
		syn region texMathText matchgroup=texStatement start='\\\(\(inter\)\?text\|mbox\|mathrm\)\s*{' end='}' concealends keepend contains=@texFoldGroup containedin=texMathMatcher
	endif

	" Recognise \begin{align} as a math environment to enable concealment there.
	syn region texMathZoneA matchgroup=texStatement start="\\begin{align}"   matchgroup=texStatement end="\\end{align}"   keepend contains=@texMathZoneGroup
	syn region texMathZoneA matchgroup=texStatement start="\\begin{align\*}" matchgroup=texStatement end="\\end{align\*}" keepend contains=@texMathZoneGroup

	" Add a syntax group for bold text in mathmode.
	syn cluster texMathZoneGroup add=texBoldMathText
	highlight texBoldMathText cterm=bold gui=bold

	" Hide \mathbf and \bm and make it bold. Text which is bold and italics.
	syn region texBoldMathText  matchgroup=texStatement start='\\\(mathbf\|bm\){' end='}' concealends contains=@texMathZoneGroup containedin=texMathMatcher
	syn region texBoldItalStyle matchgroup=texTypeStyle start="\\emph\s*{"        end="}" concealends contains=@texItalGroup

	" If this is not set then the unicode charaters break monospacing when text is concealed.
	set ambiwidth=single
endif
