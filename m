Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D5AC728AFA6
	for <lists+dm-devel@lfdr.de>; Mon, 12 Oct 2020 10:09:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-vw1tJfjgMpOQoTz9Kq9Zeg-1; Mon, 12 Oct 2020 04:09:04 -0400
X-MC-Unique: vw1tJfjgMpOQoTz9Kq9Zeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AB1456B2D;
	Mon, 12 Oct 2020 08:08:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13E1555793;
	Mon, 12 Oct 2020 08:08:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35CF69231B;
	Mon, 12 Oct 2020 08:08:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 098IBoIE007378 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Oct 2020 14:11:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A351010A1458; Thu,  8 Oct 2020 18:11:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E46710A1451
	for <dm-devel@redhat.com>; Thu,  8 Oct 2020 18:11:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8461811E78
	for <dm-devel@redhat.com>; Thu,  8 Oct 2020 18:11:47 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-424-DA7bjC-ENbSArbvFUVRKZg-1; Thu, 08 Oct 2020 14:11:45 -0400
X-MC-Unique: DA7bjC-ENbSArbvFUVRKZg-1
Received: by mail-io1-f49.google.com with SMTP id y20so3102940iod.5
	for <dm-devel@redhat.com>; Thu, 08 Oct 2020 11:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=CSoXq+8L+uC2Fsay1hVylBa3yjr5bnHuLLVYJzuZ4aI=;
	b=W151989cu+vYAySPpEBtVq+ktn/Pq7mF/nDa1ybcZY8/dnuOZReNyr2DQl6JoQl8jt
	JD6kuE6KD2+XYL0OILY3NNpdG17S1Z0biBvNQhjLziImr2UZq6tQiZBx6bTrXFOXqSgO
	nc4ODMxCS489XyG02EQnW30cVDV/xQwI8NN6HHt4e0crrzhWoyGiveDh9jatrX8YJqhJ
	c9JBrIX8G8l7EuUQxJ4O/M/zdT/Jbr8IEfJEhtlBFKJfICMK2WjsMuQCbuEChXNrIBUp
	Ubb75ggU8aPKhcBn9/w80S2oV1r1wQXMmm+PwM2HUtcY20CA5qwF+yFEWVj4DI1OZlNI
	BVCA==
X-Gm-Message-State: AOAM533+pVOtV59VzIpLVbKl1s6vXm1j6/DVYBd0Q+XJYHoKTJHMuPQg
	LUDsnykM6peDCHFMZemWA3Ea5GExBtfKv3IV9OGsWtDWRO1D/sgI
X-Google-Smtp-Source: ABdhPJzVlut/DlArUd8JRiXjai5dHk1kcamlui+SCoUrieIyqKit4kOehyULHhdcXTviwgnXEt638LyGUxQgcYISjOA=
X-Received: by 2002:a6b:b208:: with SMTP id b8mr6973090iof.36.1602180703879;
	Thu, 08 Oct 2020 11:11:43 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 8 Oct 2020 23:41:32 +0530
Message-ID: <CA+G9fYtwisRJtN4ht=ApeWc1jWssDok-7y2wee6Z0kzMP-atKg@mail.gmail.com>
To: dm-devel@redhat.com, open list <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>, drbd-dev@tron.linbit.com,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
	<linux-ide@vger.kernel.org>, 
	linux-raid@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	lkft-triage@lists.linaro.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 12 Oct 2020 04:08:26 -0400
Cc: Jens Axboe <axboe@kernel.dk>, Song Liu <song@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Christoph Hellwig <hch@lst.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [dm-devel] [ Regressions ] linux next 20201008: blk_update_request:
 I/O error, dev sda,
 sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are two major regressions noticed on linux next tag 20201008.
I will bisect this problem and get back to you.

1) qemu_i386 and qemu_x86 boot failed due to mount rootfs failing [1].

        Starting Remount Root and Kernel File Systems...
[    1.750740] ata1.00: WARNING: zero len r/w req
[    1.751423] ata1.00: WARNING: zero len r/w req
[    1.752361] ata1.00: WARNING: zero len r/w req
[    1.753400] ata1.00: WARNING: zero len r/w req
[    1.754447] ata1.00: WARNING: zero len r/w req
[    1.755529] ata1.00: WARNING: zero len r/w req
[    1.756630] sd 0:0:0:0: [sda] tag#0 FAILED Result:
hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=0s
[    1.758622] sd 0:0:0:0: [sda] tag#0 CDB: Synchronize Cache(10) 35
00 00 00 00 00 00 00 00 00
[    1.760576] blk_update_request: I/O error, dev sda, sector 0 op
0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
[    1.761534] Buffer I/O error on dev sda, logical block 0, lost sync
page write
[    1.764158] EXT4-fs (sda): I/O error while writing superblock


2) the devices boot pass but mkfs failed on x86_64, i386, arm64
Juno-r2 devices [2].

mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG03ACA100_37O9KGL0F
[   72.159789] ata3.00: WARNING: zero len r/w req
[   72.164287] ata3.00: WARNING: zero len r/w req
[   72.168774] ata3.00: WARNING: zero len r/w req
[   72.168777] ata3.00: WARNING: zero len r/w req
[   72.168779] ata3.00: WARNING: zero len r/w req
[   72.168781] ata3.00: WARNING: zero len r/w req
[   72.168786] sd 2:0:0:0: [sda] tag#5 FAILED Result:
hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=0s
[   72.168788] sd 2:0:0:0: [sda] tag#5 CDB: Synchronize Cache(10) 35
00 00 00 00 00 00 00 00 00
[   72.168791] blk_update_request: I/O error, dev sda, sector 0 op
0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git commit: e4fb79c771fbe2e6fcb3cffa87d5823a9bbf3f10
  git describe: next-20201008
  make_kernelversion: 5.9.0-rc8
  kernel-config:
https://builds.tuxbuild.com/pOW-FELX2VUycejkuyiKZg/kernel.config


steps to reproduce:
--------------------------
1) qemu boot command:

/usr/bin/qemu-system-x86_64 -cpu host -enable-kvm -nographic -net
nic,model=virtio,macaddr=DE:AD:BE:EF:66:06 -net tap -m 1024 -monitor
none -kernel bzImage --append "root=/dev/sda  rootwait
console=ttyS0,115200" -hda
rpb-console-image-lkft-intel-corei7-64-20200723162342-41.rootfs.ext4
-m 4096 -smp 4 -nographic

2) boot x86_64 with linux next 20201008 tag kernel and attach SDD drive.

mkfs -t ext4 /dev/<drive-partition>

Full log links,
[1 ]https://lkft.validation.linaro.org/scheduler/job/1823906#L688
[2] https://lkft.validation.linaro.org/scheduler/job/1823938#L2065


-- 
Linaro LKFT
https://lkft.linaro.org

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

