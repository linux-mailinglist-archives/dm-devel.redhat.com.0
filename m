Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CE07E6FA81
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jul 2019 09:41:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C49462F8BE1;
	Mon, 22 Jul 2019 07:41:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 995EA100033F;
	Mon, 22 Jul 2019 07:41:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8C511800207;
	Mon, 22 Jul 2019 07:41:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6K9QKMO005517 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 20 Jul 2019 05:26:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B59E51F28; Sat, 20 Jul 2019 09:26:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65B5261102
	for <dm-devel@redhat.com>; Sat, 20 Jul 2019 09:26:18 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-oln040092070088.outbound.protection.outlook.com [40.92.70.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A50F985362
	for <dm-devel@redhat.com>; Sat, 20 Jul 2019 09:26:15 +0000 (UTC)
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
	(10.152.20.60) by DB5EUR03HT127.eop-EUR03.prod.protection.outlook.com
	(10.152.20.200) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18;
	Sat, 20 Jul 2019 09:26:14 +0000
Received: from VI1P191MB0014.EURP191.PROD.OUTLOOK.COM (10.152.20.53) by
	DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.2052.18 via Frontend Transport; Sat, 20 Jul 2019 09:26:13 +0000
Received: from VI1P191MB0014.EURP191.PROD.OUTLOOK.COM
	([fe80::88f3:1edc:e6fa:4ead]) by VI1P191MB0014.EURP191.PROD.OUTLOOK.COM
	([fe80::88f3:1edc:e6fa:4ead%7]) with mapi id 15.20.2094.013;
	Sat, 20 Jul 2019 09:26:13 +0000
From: =?iso-8859-1?Q?C=E9dric_Delmas?= <cedricde@outlook.fr>
To: "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: snapshot-origin with no snapshot may lead to BUG() in bio_split()
Thread-Index: AQHVPtXd6hciaGeZOEuQ/2U3g7tFtg==
Date: Sat, 20 Jul 2019 09:26:13 +0000
Message-ID: <VI1P191MB0014912D317079AAF7F3870BAECA0@VI1P191MB0014.EURP191.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:C6E95BED24E6A0C0EA5BD6689ACABE9604C5DADDDFCB815ED23A55C4A203BE2B;
	UpperCasedChecksum:FDC250E46960D3ACEA49504583E8EEB00750EF266BE1B68279A98B28F99A9FC9;
	SizeAsReceived:6760; Count:41
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [/ORzdZmsfGaYAs+QakBb//9vaZBDXJRwnjLHMJMSXkfskJNAhoFSWrIAHne9oNil]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
	SRVR:DB5EUR03HT127; 
x-ms-traffictypediagnostic: DB5EUR03HT127:
x-microsoft-antispam-message-info: dMiXw5VEG0PEin/Ibv4PUIAjItHAGpAejCGGkA8zvzf+p9vI9WWjB6JWlpGXsvBG6UoTJI6pqJBhV67A8StH8MoXQHGoQucSOgFBPkNQhaHRi+740goR4zHsClxm0sU0PFaa6wiJcx1AJU8QwlFYKxQuMYgESwC8e7SaAOBVUuqKxuYGb/KOqyugKmGYsabS
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c2895070-3f9b-46ff-41ea-08d70cf44f5e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2019 09:26:13.7934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT127
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Sat, 20 Jul 2019 09:26:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Sat, 20 Jul 2019 09:26:17 +0000 (UTC) for IP:'40.92.70.88'
	DOMAIN:'mail-oln040092070088.outbound.protection.outlook.com'
	HELO:'EUR03-AM5-obe.outbound.protection.outlook.com'
	FROM:'cedricde@outlook.fr' RCPT:''
X-RedHat-Spam-Score: -0.001  (FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 40.92.70.88
	mail-oln040092070088.outbound.protection.outlook.com
	40.92.70.88
	mail-oln040092070088.outbound.protection.outlook.com
	<cedricde@outlook.fr>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6K9QKMO005517
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Jul 2019 03:41:30 -0400
Subject: [dm-devel] snapshot-origin with no snapshot may lead to BUG() in
	bio_split()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 22 Jul 2019 07:41:53 +0000 (UTC)

Hello,

I encountered a bug while working with DM snapshot targets: having a snapsh=
ot-origin target with all snapshots removed may lead to BUG_ON(sectors <=3D=
 0) in function bio_split() (file block/bio.c).

/proc/version: Linux version 4.19.59 (root@test-dm) (gcc version 8.3.0 (Deb=
ian 8.3.0-6)) #1 SMP Fri Jul 19 15:26:13 CEST 2019
dmesg:
[  856.268151] ------------[ cut here ]------------
[  856.268154] kernel BUG at block/bio.c:1803!
[  856.268230] invalid opcode: 0000 [#1] SMP PTI
[  856.268294] CPU: 3 PID: 677 Comm: e2fsck Tainted: G            E     4.1=
9.59 #1
[  856.268373] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.1=
2.0-1 04/01/2014
[  856.268462] RIP: 0010:bio_split+0x7a/0x80
[  856.268526] Code: 41 8b 74 24 30 48 89 ef e8 63 ec ff ff c7 45 38 00 00 =
00 00 f6 45 15 04 74 08 66 41 81 4c 24 14 00 04 4c 89 e0 5b 5d 41 5c c3 <0f=
> 0b 0f 0b 66 90 66 66 66 66 90 41 56 45 31 f6 41 55 41 54 55 53
[  856.268866] RSP: 0018:ffffb274012aba58 EFLAGS: 00010246
[  856.268934] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff979a62d=
4ae90
[  856.269030] RDX: 0000000000600000 RSI: 0000000000000000 RDI: ffff979a348=
8c100
[  856.269108] RBP: ffff979a76068000 R08: ffff979a770489c0 R09: ffff979a356=
25858
[  856.269184] R10: 0000000000000000 R11: ffff979a35625858 R12: ffff979a348=
8c100
[  856.269261] R13: 0000000000000000 R14: ffffffffc076b580 R15: ffffb274012=
abe48
[  856.269339] FS:  00007fc6c6d76780(0000) GS:ffff979a77b80000(0000) knlGS:=
0000000000000000
[  856.269423] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  856.269492] CR2: 000055ff1b8b1278 CR3: 0000000235026002 CR4: 00000000000=
60ee0
[  856.269573] Call Trace:
[  856.269648]  __split_and_process_bio+0xe4/0x1a0 [dm_mod]
[  856.269724]  __dm_make_request.isra.37+0x3f/0xa0 [dm_mod]
[  856.269796]  generic_make_request+0x1a4/0x400
[  856.269861]  submit_bio+0x45/0x140
[  856.269919]  ? guard_bio_eod+0x32/0x100
[  856.269979]  submit_bh_wbc+0x163/0x190
[  856.270039]  __block_write_full_page+0x22b/0x440
[  856.270103]  ? touch_buffer+0x60/0x60
[  856.270162]  ? check_disk_change+0x60/0x60
[  856.270224]  __writepage+0x19/0x50
[  856.270282]  write_cache_pages+0x1e1/0x470
[  856.270343]  ? __wb_calc_thresh+0x130/0x130
[  856.270405]  ? __block_commit_write.isra.39+0x4c/0xa0
[  856.272244]  ? block_write_end+0x2f/0x80
[  856.272764]  ? iov_iter_copy_from_user_atomic+0xbe/0x310
[  856.273298]  ? blkdev_write_end+0x1d/0x80
[  856.273805]  ? balance_dirty_pages_ratelimited+0x1f5/0x3c0
[  856.274313]  generic_writepages+0x56/0x90
[  856.274823]  do_writepages+0x41/0xd0
[  856.275326]  ? blkdev_write_iter+0xb0/0x120
[  856.275826]  ? io_schedule_timeout+0x19/0x40
[  856.276319]  __filemap_fdatawrite_range+0xbe/0xf0
[  856.276806]  file_write_and_wait_range+0x4c/0xa0
[  856.277295]  blkdev_fsync+0x16/0x40
[  856.277768]  do_fsync+0x38/0x70
[  856.278237]  __x64_sys_fsync+0x10/0x20
[  856.278700]  do_syscall_64+0x55/0xf0
[  856.279156]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  856.279617] RIP: 0033:0x7fc6c6e8b214
[  856.280075] Code: 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f =
1f 44 00 00 48 8d 05 e9 f4 0c 00 8b 00 85 c0 75 13 b8 4a 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 3c c3 0f 1f 00 53 89 fb 48 83 ec 10 e8 24 55
[  856.281131] RSP: 002b:00007fffd9870c18 EFLAGS: 00000246 ORIG_RAX: 000000=
000000004a
[  856.282181] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fc6c6e=
8b214
[  856.282690] RDX: 0000000000000000 RSI: 000055ff1b8ab130 RDI: 00000000000=
00003
[  856.283179] RBP: 000055ff1b8ab130 R08: 0000000000000000 R09: 000055ff1b8=
ad2c4
[  856.283663] R10: 00007fc6c7011200 R11: 0000000000000246 R12: 00000000000=
00200
[  856.284129] R13: 000055ff1b8ad2e0 R14: 0000000000000000 R15: 000055ff1b8=
aaef0
[  856.284583] Modules linked in: dm_snapshot(E) dm_bufio(E) dm_mod(E) loop=
(E) kvm_intel(E) kvm(E) irqbypass(E) crct10dif_pclmul(E) crc32_pclmul(E) gh=
ash_clmulni_intel(E) pcbc(E) snd_pcm(E) aesni_intel(E) bochs_drm(E) snd_tim=
er(E) aes_x86_64(E) crypto_simd(E) ttm(E) snd(E) cryptd(E) glue_helper(E) 9=
pnet_virtio(E) joydev(E) evdev(E) soundcore(E) drm_kms_helper(E) sg(E) hid_=
generic(E) serio_raw(E) 9pnet(E) pcspkr(E) virtio_balloon(E) iTCO_wdt(E) iT=
CO_vendor_support(E) drm(E) qemu_fw_cfg(E) button(E) virtio_rng(E) rng_core=
(E) ip_tables(E) x_tables(E) autofs4(E) usbhid(E) hid(E) ext4(E) crc32c_gen=
eric(E) crc16(E) mbcache(E) jbd2(E) fscrypto(E) sr_mod(E) cdrom(E) virtio_b=
lk(E) virtio_console(E) virtio_net(E) net_failover(E) failover(E) ahci(E) l=
ibahci(E) libata(E) xhci_pci(E) crc32c_intel(E) xhci_hcd(E)
[  856.288356]  scsi_mod(E) psmouse(E) lpc_ich(E) i2c_i801(E) usbcore(E) vi=
rtio_pci(E) virtio_ring(E) virtio(E)
[  856.289169] ---[ end trace 54a02b5e2590a1fe ]---


Environment:
- Kernel version: 4.19.59 (same problem with versions 5.2.1, latest 4.19 fr=
om Debian Buster and latest 4.9 from Debian Stretch)
- Distribution: Debian 10
- Software versions:
GNU Make            	4.2.1
Binutils            	2.31.1
Util-linux          	2.33.1
Mount               	2.33.1
Module-init-tools   	26
E2fsprogs           	1.44.5
Linux C Library     	2.28
Dynamic linker (ldd)	2.28
Linux C++ Library   	6.0.25
Procps              	3.3.15
Kbd                 	2.0.4
Console-tools       	2.0.4
Sh-utils            	8.30
Udev                	241
Modules Loaded      	9pnet 9pnet_virtio aesni_intel aes_x86_64 ahci autofs4=
 bochs_drm button cdrom crc16 crc32c_generic crc32c_intel crc32_pclmul crct=
10dif_pclmul cryptd crypto_simd drm drm_kms_helper evdev ext4 failover fscr=
ypto ghash_clmulni_intel glue_helper hid hid_generic i2c_i801 ip_tables irq=
bypass iTCO_vendor_support iTCO_wdt jbd2 joydev kvm kvm_intel libahci libat=
a lpc_ich mbcache net_failover pcbc pcspkr psmouse qemu_fw_cfg rng_core scs=
i_mod serio_raw sg snd snd_pcm snd_timer soundcore sr_mod ttm usbcore usbhi=
d virtio virtio_balloon virtio_blk virtio_console virtio_net virtio_pci vir=
tio_ring virtio_rng xhci_hcd xhci_pci x_tables


Steps to reproduce:
truncate -s 500M origin.bin
truncate -s 50M snapshot.bin
losetup /dev/loop0 origin.bin
losetup /dev/loop1 snapshot.bin
mkfs.ext4 /dev/loop0
dmsetup create snap --table "0 $(blockdev --getsz /dev/loop0) snapshot /dev=
/loop0 /dev/loop1 N 256"
dmsetup create orig --table "0 $(blockdev --getsz /dev/loop0) snapshot-orig=
in /dev/loop0"
# use /dev/mapper/snap and /dev/mapper/orig then unmount them
dmsetup suspend orig
dmsetup remove snap
dmsetup resume orig
e2fsck /dev/mapper/orig
# BUG in bio_split()

Steps to reproduce (the express way):
truncate -s 500M origin.bin
losetup /dev/loop0 origin.bin
mkfs.ext4 /dev/loop0
dmsetup create orig --table "0 $(blockdev --getsz /dev/loop0) snapshot-orig=
in /dev/loop0"
e2fsck /dev/mapper/orig
# BUG in bio_split()


I looked at the code and to my opinion the problem comes from function orig=
in_map (file drivers/md/dm-snap.c). In the following code:

static int origin_map(struct dm_target *ti, struct bio *bio)
{
	struct dm_origin *o =3D ti->private;
	unsigned available_sectors;
...
	available_sectors =3D o->split_boundary -
		((unsigned)bio->bi_iter.bi_sector & (o->split_boundary - 1));

	if (bio_sectors(bio) > available_sectors)
		dm_accept_partial_bio(bio, available_sectors);
...

when there is no snapshot, split_boundary is 0 so available_sectors gets an=
 invalid value.
The problem no more appears if the function origin_map early exits using th=
e following patch:
--- a/drivers/md/dm-snap.c      2019-07-14 08:11:23.000000000 +0200
+++ b/drivers/md/dm-snap.c      2019-07-19 17:50:15.876000000 +0200
@@ -2328,6 +2328,9 @@ static int origin_map(struct dm_target *
        if (bio_data_dir(bio) !=3D WRITE)
                return DM_MAPIO_REMAPPED;
 =

+       if (unlikely(!o->split_boundary))
+               return do_origin(o->dev, bio);
+
        available_sectors =3D o->split_boundary -
                ((unsigned)bio->bi_iter.bi_sector & (o->split_boundary - 1)=
);
 =


Best regards,

C=E9dric Delmas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
