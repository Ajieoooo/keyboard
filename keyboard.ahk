SetCapsLockState, AlwaysOff

capslock := 0

*CapsLock:: capslock := A_TickCount

*CapsLock Up::
    ;ToolTip % A_PriorKey
    if (A_PriorKey = "CapsLock" && (A_TickCount - capslock) < 500)
    {
        if GetKeyState("CapsLock", "T") = 0
            SetCapsLockState, Off
        else
            SetCapsLockState, AlwaysOff
    }
    capslock := 0
    return

CapsAction(action)
{
    SendInput, % "{Blind}{" action "}"
}

#if capslock
    $*p::CapsAction("BS")
    $*z::CapsAction("Esc")
    $*i::CapsAction("Home")
    $*o::CapsAction("End")
    $*h::CapsAction("Left")
    $*j::CapsAction("Down")
    $*k::CapsAction("Up")
    $*l::CapsAction("Right")
    $*u::CapsAction("PgUp")
    $*n::CapsAction("PgDn")
    m::SendInput {Shift Down}{Insert}{Shift Up}
    ,::SendInput {Alt Down}{Insert}{Alt Up}
    $f::^+1
    $r::^+2
    $*d::+F10
    $*q::!F4
#if

semicolon := 0

$;::
    semicolon := A_TickCount
    SendInput, {LCtrl Down}
    return

$; UP::
    SendInput, {LCtrl Up}
    ;ToolTip % A_PriorKey
    if (A_PriorKey = ";" && (A_TickCount - semicolon) < 500)
    {
        SendInput,;
    }
    semicolon := 0
    return
