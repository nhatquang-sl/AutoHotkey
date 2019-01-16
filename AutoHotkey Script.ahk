SetCapsLockState AlwaysOff

; CapsLock+I/K/J/L to Up/Down/Left/Right
CapsLock & i::Send {up}
CapsLock & k::Send {down}
CapsLock & j::Send {left}
CapsLock & l::Send {right}

CapsLock & o::Send ^{right}
CapsLock & u::Send ^{left}

CapsLock & p::Send {End}
CapsLock & y::Send {Home}

;CapsLock + f to Delete, CapsLock + d to Backspace
CapsLock & f::Send {Delete}
CapsLock & d::Send {Backspace}

CapsLock & r::Send ^{Delete}
CapsLock & e::Send ^{Backspace}

CapsLock & .::Send ^{.}

CapsLock & z::Send ^{z}
CapsLock & x::Send ^{x}
CapsLock & c::Send ^{c}


CapsLock & 1::Send +{1}
CapsLock & 2::Send +{2}
CapsLock & 3::Send +{3}
CapsLock & 4::Send +{4}
CapsLock & 5::Send +{5}
CapsLock & 6::Send +{6}
CapsLock & 7::Send +{7}
CapsLock & 8::Send +{8}
CapsLock & 9::Send +{9}
CapsLock & 0::Send +{0}

CapsLock & Space::Send ^{Space}

; move line up/down
CapsLock & w::Send !{up}
CapsLock & s::Send !{down}

; Shift + left/right
CapsLock & [::Send +{[}
CapsLock & ]::Send +{]}

LWin::LAlt
LAlt::LWin