;*****************************************************************************
;* cpu-64.asm: h264 encoder library
;*****************************************************************************
;* Copyright (C) 2003-2008 x264 project
;*
;* Authors: Laurent Aimar <fenrir@via.ecp.fr>
;*
;* This program is free software; you can redistribute it and/or modify
;* it under the terms of the GNU General Public License as published by
;* the Free Software Foundation; either version 2 of the License, or
;* (at your option) any later version.
;*
;* This program is distributed in the hope that it will be useful,
;* but WITHOUT ANY WARRANTY; without even the implied warranty of
;* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;* GNU General Public License for more details.
;*
;* You should have received a copy of the GNU General Public License
;* along with this program; if not, write to the Free Software
;* Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111, USA.
;*****************************************************************************

%include "x86inc.asm"

SECTION .text

;-----------------------------------------------------------------------------
; int x264_cpu_cpuid( int op, int *eax, int *ebx, int *ecx, int *edx )
;-----------------------------------------------------------------------------
cglobal x264_cpu_cpuid
    firstpush rbx
    pushreg   rbx
    endprolog

    mov     r10,   r3
    mov     r11,   r2
    mov     r9,    r1
%ifdef WIN64
    mov     r8,    [rsp+40+8]
%endif

    mov     eax,   r0d
    cpuid

    mov     [r9],  eax
    mov     [r11], ebx
    mov     [r10], ecx
    mov     [r8],  edx

    pop     rbx
    ret
    endfunc

;-----------------------------------------------------------------------------
; void x264_emms( void )
;-----------------------------------------------------------------------------
cglobal x264_emms
    emms
    ret

