.globl _start

.data
sys_read: .int 0
sys_write: .int 1
sys_exit: .int 60

stdin_fd: .int 0
stdout_fd: .int 1

success: .int 0
error: .int 1

msg: .ascii "crazy!\n"
len = . - msg

.text
_start:
    print_test:
        mov sys_write, %eax
        mov stdout_fd, %edi
        mov $msg, %esi
        mov $len, %edx
        syscall
    exit:
        mov sys_exit, %eax
        mov success, %edi
        syscall
