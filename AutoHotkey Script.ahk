SetCapsLockState AlwaysOff

; CapsLock+I/K/J/L to Up/Down/Left/Right
>+i::Send {up}
>+k::Send {down}
>+j::Send {left}
>+l::Send {right}

>+o::Send ^{right}
>+u::Send ^{left}

>+p::Send {End}
>+y::Send {Home}

;CapsLock + f to Delete, CapsLock + d to Backspace
>+f::Send {Delete}
>+d::Send {Backspace}

>+r::Send ^{Delete}
>+e::Send ^{Backspace}

>+.::Send ^{.}

>+z::Send ^{z}
>+x::Send ^{x}
>+c::Send ^{c}


>+1::Send +{1}
>+2::Send +{2}
>+3::Send +{3}
>+4::Send +{4}
>+5::Send +{5}
>+6::Send +{6}
>+7::Send +{7}
>+8::Send +{8}
>+9::Send +{9}
>+0::Send +{0}

>+Space::Send ^{Space}

; move line up/down
>+w::Send !{up}
>+s::Send !{down}

; Shift + left/right
>+[::Send +{[}
>+]::Send +{]}

LWin::LAlt
LAlt::LWin