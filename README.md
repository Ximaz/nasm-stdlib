# NASM stdlib
This repository is for learning purposes only ! It's just a project that aims to make me discover the assembly language's world by doing my own stdlib, which might be the greatest thing to do when you're trying to learn a programming language. It's obviously not a secured library. I'm doing it for myself, and sharing it to  you to get some help if needed, and some contribution to make me learn new things.

If you also want to discover this world, then you can try to do the same at home and inspire you from/copy this repository.

# Compilation
You need to have [NASM](https://www.nasm.us/) installed __INTo your machine, because it's the tool I'm going to use to compile my assembly files. You also need to have [make](https://www.gnu.org/software/make/) installed, because it's the tool I'm going to use to compile and link everything. Once done, you can clone this repository and type ``make re`` in a prompt to compile and remove temp files. A binary should still be visible, ``main``. You can launch it. It must acts like the ``main.asm`` program descibes it's behaviour.

# Resources
[kupala](https://www.youtube.com/channel/UCw1SYd_8Gr7aAkA_o4hotBg) : [x86_64 Linux Assembly](https://www.youtube.com/watch?v=VQAKkuLL31g&list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn) (Tutorials playlist)

# Issues

- [File permissions do not apply when creating a file (WSL)](https://superuser.com/questions/451475/chmod-doesnt-work/1688715#1688715)

Workaround :
```conf
# /etc/wsl.conf
[automount]
options = "metadata"
```

<hr>

- [Non null-terminated string reading standard input (Assembly Language)](https://stackoverflow.com/questions/71940358/non-null-terminated-string-reading-standard-input-assembly-language?noredirect=1#comment127121577_71940358)

Workaround :
```
I didn't notice that the stdin call returned the read bytes __INTo rax, which is what I need to put a termination byte.
Since the string contains the \n, I had to decrement it before puting the null byte at the \n position.
```

<hr>
