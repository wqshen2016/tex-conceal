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

	" Sub scripts with numbers, letters and symbols mixed.
	let s:texSubScriptList = [
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

	" Super scripts with numbers.
	syn match texSuperScripts '0' contained conceal cchar=⁰
	syn match texSuperScripts '1' contained conceal cchar=¹
	syn match texSuperScripts '2' contained conceal cchar=²
	syn match texSuperScripts '3' contained conceal cchar=³
	syn match texSuperScripts '4' contained conceal cchar=⁴
	syn match texSuperScripts '5' contained conceal cchar=⁵
	syn match texSuperScripts '6' contained conceal cchar=⁶
	syn match texSuperScripts '7' contained conceal cchar=⁷
	syn match texSuperScripts '8' contained conceal cchar=⁸
	syn match texSuperScripts '9' contained conceal cchar=⁹

	syn match texMathSymbol '\^\([0-9]\|{[0-9]\+}\)' contained conceal contains=texSuperScripts

	" Special super scripts with letters and symbols.
	syn match texMathSymbol '\^o' contained conceal cchar=ᵒ
	syn match texMathSymbol '\^i' contained conceal cchar=ⁱ
	syn match texMathSymbol '\^n' contained conceal cchar=ⁿ

	syn match texSuperScriptsSpecial '-' contained conceal cchar=⁻
	syn match texSuperScriptsSpecial 'T' contained conceal cchar=ᵀ

	syn match texMathSymbol '\^T'              contained conceal contains=texSuperscriptsSpecial
	syn match texMathSymbol '\^{-T}'           contained conceal contains=texSuperscriptsSpecial
	syn match texMathSymbol '\^\\mathrm{-\?T}' contained conceal contains=texSuperscriptsSpecial

	" All \mathbb characters.
	syn match texMathSymbolBb ' ' contained conceal cchar= 
	syn match texMathSymbolBb 'A' contained conceal cchar=𝔸
	syn match texMathSymbolBb 'B' contained conceal cchar=𝔹
	syn match texMathSymbolBb 'C' contained conceal cchar=ℂ
	syn match texMathSymbolBb 'D' contained conceal cchar=𝔻
	syn match texMathSymbolBb 'E' contained conceal cchar=𝔼
	syn match texMathSymbolBb 'F' contained conceal cchar=𝔽
	syn match texMathSymbolBb 'G' contained conceal cchar=𝔾
	syn match texMathSymbolBb 'H' contained conceal cchar=ℍ
	syn match texMathSymbolBb 'I' contained conceal cchar=𝕀
	syn match texMathSymbolBb 'J' contained conceal cchar=𝕁
	syn match texMathSymbolBb 'K' contained conceal cchar=𝕂
	syn match texMathSymbolBb 'L' contained conceal cchar=𝕃
	syn match texMathSymbolBb 'M' contained conceal cchar=𝕄
	syn match texMathSymbolBb 'N' contained conceal cchar=ℕ
	syn match texMathSymbolBb 'O' contained conceal cchar=𝕆
	syn match texMathSymbolBb 'P' contained conceal cchar=ℙ
	syn match texMathSymbolBb 'Q' contained conceal cchar=ℚ
	syn match texMathSymbolBb 'R' contained conceal cchar=ℝ
	syn match texMathSymbolBb 'S' contained conceal cchar=𝕊
	syn match texMathSymbolBb 'T' contained conceal cchar=𝕋
	syn match texMathSymbolBb 'U' contained conceal cchar=𝕌
	syn match texMathSymbolBb 'V' contained conceal cchar=𝕍
	syn match texMathSymbolBb 'W' contained conceal cchar=𝕎
	syn match texMathSymbolBb 'X' contained conceal cchar=𝕏
	syn match texMathSymbolBb 'Y' contained conceal cchar=𝕐
	syn match texMathSymbolBb 'Z' contained conceal cchar=ℤ
	syn match texMathSymbol '\\mathbb{\(\s\|[A-Z]\)\+}' contained conceal contains=texMathSymbolBb

	" Do spell checking inside of the correct tex statements.
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
