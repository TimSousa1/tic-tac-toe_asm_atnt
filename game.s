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

buf: .zero 1
buf_size: .int 1

.text
_start:
    # not safe! only one byte will be read
    user_input:
        mov sys_read, %eax
        mov stdin_fd, %edi
        mov $buf, %rsi
        mov buf_size, %edx
        syscall

    print_test:
        mov sys_write, %eax
        mov stdout_fd, %edi
        mov $buf, %esi
        mov buf_size, %edx
        syscall

    exit:
        mov sys_exit, %eax
        mov success, %edi
        syscall
