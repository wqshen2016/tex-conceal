if has('conceal')
  " Misc
  syn match texMathSymbol '\\phi'      contained conceal cchar=Φ
  syn match texMathSymbol '\\sqrt'     contained conceal cchar=√
  syn match texStatement  '\\item\>'   contained conceal cchar=•
  syn match texStatement  '\\cdot'     contained conceal cchar=·
  syn match texStatement  '\\equiv'    contained conceal cchar=≡

  " Some nice symbols.
  syn match texMathSymbol '\\square'   contained conceal cchar=◻️
  syn match texMathSymbol '\\lozenge'  contained conceal cchar=◊

  " Whitespace in math mode.
  syn match texMathSymbol '\\,'        contained conceal cchar= 
  syn match texMathSymbol '\\ '        contained conceal cchar= 
  syn match texMathSymbol '\\quad'     contained conceal cchar= 

  " All kinds of delimiters.
  syn match texStatement  '``'         contained conceal cchar=“
  syn match texStatement  '\'\''       contained conceal cchar=”
  syn match texDelimiter  '\\{'        contained conceal cchar={
  syn match texDelimiter  '\\}'        contained conceal cchar=}
  syn match texMathSymbol '\\langle'   contained conceal cchar=⟨
  syn match texMathSymbol '\\rangle'   contained conceal cchar=⟩

  " Logical and set theory symbols.
  syn match texMathSymbol '\\lnot'     contained conceal cchar=¬
  syn match texMathSymbol '\\geqslant' contained conceal cchar=⩾
  syn match texMathSymbol '\\leqslant' contained conceal cchar=⩽

  syn match texMathSymbol '\\vDash'    contained conceal cchar=⊨
  syn match texMathSymbol '\\models'   contained conceal cchar=⊨
  syn match texMathSymbol '\\setminus' contained conceal cchar=\
  syn match texMathSymbol '\\where'    contained conceal cchar=|
  syn match texMathSymbol '\\emptyset' contained conceal cchar=Ø

  " Simple number super/sub-scripts.
  syn match texMathSymbol '\^0' contained conceal cchar=⁰
  syn match texMathSymbol '\^1' contained conceal cchar=¹
  syn match texMathSymbol '\^2' contained conceal cchar=²
  syn match texMathSymbol '\^3' contained conceal cchar=³
  syn match texMathSymbol '\^4' contained conceal cchar=⁴
  syn match texMathSymbol '\^5' contained conceal cchar=⁵
  syn match texMathSymbol '\^6' contained conceal cchar=⁶
  syn match texMathSymbol '\^7' contained conceal cchar=⁷
  syn match texMathSymbol '\^8' contained conceal cchar=⁸
  syn match texMathSymbol '\^9' contained conceal cchar=⁹

  syn match texMathSymbol '_0' contained conceal cchar=₀
  syn match texMathSymbol '_1' contained conceal cchar=₁
  syn match texMathSymbol '_2' contained conceal cchar=₂
  syn match texMathSymbol '_3' contained conceal cchar=₃
  syn match texMathSymbol '_4' contained conceal cchar=₄
  syn match texMathSymbol '_5' contained conceal cchar=₅
  syn match texMathSymbol '_6' contained conceal cchar=₆
  syn match texMathSymbol '_7' contained conceal cchar=₇
  syn match texMathSymbol '_8' contained conceal cchar=₈
  syn match texMathSymbol '_9' contained conceal cchar=₉

  syn match texMathSymbol '_i' contained conceal cchar=ᵢ
  syn match texMathSymbol '^i' contained conceal cchar=ⁱ
  syn match texMathSymbol '_o' contained conceal cchar=ₒ
  syn match texMathSymbol '^o' contained conceal cchar=ᵒ

  syn match texSuperscripts '1' contained conceal cchar=¹
  syn match texSuperscripts '-' contained conceal cchar=⁻
  syn match texSuperscripts 'T' contained conceal cchar=ᵀ

  syn match texMathSymbol '\^{-1}'         contained conceal contains=texSuperscripts
  syn match texMathSymbol '\^T'            contained conceal contains=texSuperscripts
  syn match texMathSymbol '\^{-T}'         contained conceal contains=texSuperscripts
  syn match texMathSymbol '\^\\mathrm{T}'  contained conceal contains=texSuperscripts
  syn match texMathSymbol '\^\\mathrm{-T}' contained conceal contains=texSuperscripts

  " All \mathbb characters.
  syn match texMathSymbol '\\mathbb{A}' contained conceal cchar=𝔸
  syn match texMathSymbol '\\mathbb{B}' contained conceal cchar=𝔹
  syn match texMathSymbol '\\mathbb{C}' contained conceal cchar=ℂ
  syn match texMathSymbol '\\mathbb{D}' contained conceal cchar=𝔻
  syn match texMathSymbol '\\mathbb{E}' contained conceal cchar=𝔼
  syn match texMathSymbol '\\mathbb{F}' contained conceal cchar=𝔽
  syn match texMathSymbol '\\mathbb{G}' contained conceal cchar=𝔾
  syn match texMathSymbol '\\mathbb{H}' contained conceal cchar=ℍ
  syn match texMathSymbol '\\mathbb{I}' contained conceal cchar=𝕀
  syn match texMathSymbol '\\mathbb{J}' contained conceal cchar=𝕁
  syn match texMathSymbol '\\mathbb{K}' contained conceal cchar=𝕂
  syn match texMathSymbol '\\mathbb{L}' contained conceal cchar=𝕃
  syn match texMathSymbol '\\mathbb{M}' contained conceal cchar=𝕄
  syn match texMathSymbol '\\mathbb{N}' contained conceal cchar=ℕ
  syn match texMathSymbol '\\mathbb{O}' contained conceal cchar=𝕆
  syn match texMathSymbol '\\mathbb{P}' contained conceal cchar=ℙ
  syn match texMathSymbol '\\mathbb{Q}' contained conceal cchar=ℚ
  syn match texMathSymbol '\\mathbb{R}' contained conceal cchar=ℝ
  syn match texMathSymbol '\\mathbb{S}' contained conceal cchar=𝕊
  syn match texMathSymbol '\\mathbb{T}' contained conceal cchar=𝕋
  syn match texMathSymbol '\\mathbb{U}' contained conceal cchar=𝕌
  syn match texMathSymbol '\\mathbb{V}' contained conceal cchar=𝕍
  syn match texMathSymbol '\\mathbb{W}' contained conceal cchar=𝕎
  syn match texMathSymbol '\\mathbb{X}' contained conceal cchar=𝕏
  syn match texMathSymbol '\\mathbb{Y}' contained conceal cchar=𝕐
  syn match texMathSymbol '\\mathbb{Z}' contained conceal cchar=ℤ

  " All \mathcal characters.
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

  " Hide \text delimiter etc inside math mode TODO look into it
  if !exists("g:tex_nospell") || !g:tex_nospell
    syn region texMathText matchgroup=texStatement start='\\\(\(inter\)\=mathrm\)\s*{'     end='}' concealends keepend contains=@texFoldGroup containedin=texMathMatcher
    syn region texMathText matchgroup=texStatement start='\\\(\(inter\)\=text\|mbox\)\s*{' end='}' concealends keepend contains=@texFoldGroup,@Spell containedin=texMathMatcher
  else
    syn region texMathText matchgroup=texStatement start='\\\(\(inter\)\=text\|mbox\|mathrm\)\s*{' end='}' concealends keepend contains=@texFoldGroup containedin=texMathMatcher
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
