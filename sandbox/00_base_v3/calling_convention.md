# Calling Convention


| ABI Name |              Description           | Saver  |
|----------|------------------------------------|--------|
|  ra      | Return address                     | CALLER |
|  t0      | Alternate link register (C)        | CALLER |
|  t1-t2   | Temporary register (t0: ?)         | CALLER |
|  t3-t6   | Temporary registers                | CALLER |
|  a0-a1   | Function arguments / Return values | CALLER |
|  a2-a7   | Function arguments                 | CALLER |
|  sp      | Stack pointer                      | CALLEE |
|  s0/fp   | Frame pointer                      | CALLEE |
|  s1      | Callee-saved register              | CALLEE |
|  s2-s11  | Callee-saved registers             | CALLEE |
