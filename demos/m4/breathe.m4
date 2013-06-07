  commchange(`dnl')

  m4 macro definitions

  define(`BREATHE',``
  start breathe

: Esc [ 92 m
: Esc [ ? 25 l
|###'dnl
ifelse(`$#', `0', `', ` `$1' ###')'dnl
`|
@@@
: Esc [ 'dnl
`ifelse(`$#', `0', ``3'', `eval(len(`###  ###') `+' len(`$1'))')dnl
` D
: Esc [ K
: Esc [ ? 25 h
: Esc [ 0 m

  end breathe
'')
