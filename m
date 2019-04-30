Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B18146CC
	for <lists+dm-devel@lfdr.de>; Mon,  6 May 2019 10:50:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6BC3300180F;
	Mon,  6 May 2019 08:50:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B12145D969;
	Mon,  6 May 2019 08:50:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 517CE3FB13;
	Mon,  6 May 2019 08:50:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UMbngE017616 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 18:37:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4625D4526; Tue, 30 Apr 2019 22:37:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F8CC18501
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 22:37:45 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E82E30832E3
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 22:37:44 +0000 (UTC)
Received: from mail-qk1-f200.google.com ([209.85.222.200])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hLbNe-00005E-K1
	for dm-devel@redhat.com; Tue, 30 Apr 2019 22:37:42 +0000
Received: by mail-qk1-f200.google.com with SMTP id 144so13218762qkf.12
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 15:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b1dA/K88cRsfc3q1FRXYfBBWD47UAImz8hgoBP+aK40=;
	b=n2ZuP2F71x/50IjK2gIWuZQLDy8U6RyIvStZLe+wTkVPC648d7e5ozkcaGujYo7aPu
	MInw9KMjluccOH31ipX/44whuoBBfhp2PjWQhfbuFKpmVwfy2np3I/hQlVk+SAP9IloR
	JNyYmXf2zkev1LZ0nOOLHDxgD0vQzwzLFojkpkc1fir3XZpSLyW4oCpPBRIeC5GWQ0fB
	0UaxLwdbJG2bGlCEqFcgd64v5WL9yAjH7vbUHlL+u45VU+Xo+HCYaMrRMr48Kwk3K6lZ
	ctafizgrxVljxlXf5pJ9qeTBdFPHqtzLIl1E0ski9aIIm6uBZTRs8PYeTnClwW+h2+zn
	Ol2w==
X-Gm-Message-State: APjAAAVSUSlQu4LWnJnuw3uDP2gUeQOuUo0j5wNekrHexDuHqCTEu8hK
	TuRhZBPS3miiSoitCGdk7Z39rhzuJpE2ilpAxxTBCBqlRtFNJYe+hZpjI5x6G4S/Ato9aKdHbMe
	jPAPScGXXNFWluCRbHA/pIKRt7UxYJA==
X-Received: by 2002:a05:620a:1403:: with SMTP id
	d3mr26776133qkj.167.1556663861773; 
	Tue, 30 Apr 2019 15:37:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIoZITo3gUQWU1LW4I5B24hDxGKDv1EkPpYq3UBpsD1YF4anXHLc6+3ffgyZeEz6P0EUJp3w==
X-Received: by 2002:a05:620a:1403:: with SMTP id
	d3mr26776110qkj.167.1556663861589; 
	Tue, 30 Apr 2019 15:37:41 -0700 (PDT)
Received: from localhost (201-13-157-136.dial-up.telesp.net.br.
	[201.13.157.136]) by smtp.gmail.com with ESMTPSA id
	p27sm22875764qte.25.2019.04.30.15.37.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 15:37:41 -0700 (PDT)
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To: linux-block@vger.kernel.org, linux-raid@vger.kernel.org
Date: Tue, 30 Apr 2019 19:37:22 -0300
Message-Id: <20190430223722.20845-2-gpiccoli@canonical.com>
In-Reply-To: <20190430223722.20845-1-gpiccoli@canonical.com>
References: <20190430223722.20845-1-gpiccoli@canonical.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Tue, 30 Apr 2019 22:37:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 30 Apr 2019 22:37:44 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -5 (RCVD_IN_DNSWL_HI) 91.189.89.112
	youngberry.canonical.com 91.189.89.112 youngberry.canonical.com
	<gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 May 2019 04:49:36 -0400
Cc: axboe@kernel.dk, kernel@gpiccoli.net,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	gpiccoli@canonical.com, stable@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, dm-devel@redhat.com,
	jay.vosburgh@canonical.com, gavin.guo@canonical.com
Subject: [dm-devel] [PATCH 2/2] md/raid0: Do not bypass blocking queue
	entered for raid0 bios
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 06 May 2019 08:50:51 +0000 (UTC)

Commit cd4a4ae4683d ("block: don't use blocking queue entered for
recursive bio submits") introduced the flag BIO_QUEUE_ENTERED in order
split bios bypass the blocking queue entering routine and use the live
non-blocking version. It was a result of an extensive discussion in
a linux-block thread[0], and the purpose of this change was to prevent
a hung task waiting on a reference to drop.

Happens that md raid0 split bios all the time, and more important,
it changes their underlying device to the raid member. After the change
introduced by this flag's usage, we experience various crashes if a raid0
member is removed during a large write. This happens because the bio
reaches the live queue entering function when the queue of the raid0
member is dying.

A simple reproducer of this behavior is presented below:
a) Build kernel v5.1-rc7 with CONFIG_BLK_DEV_THROTTLING=y.

b) Create a raid0 md array with 2 NVMe devices as members, and mount it
with an ext4 filesystem.

c) Run the following oneliner (supposing the raid0 is mounted in /mnt):
(dd of=/mnt/tmp if=/dev/zero bs=1M count=999 &); sleep 0.3;
echo 1 > /sys/block/nvme0n1/device/device/remove
(whereas nvme0n1 is the 2nd array member)

This will trigger the following warning/oops:

------------[ cut here ]------------
no blkg associated for bio on block-device: nvme0n1
WARNING: CPU: 9 PID: 184 at ./include/linux/blk-cgroup.h:785
generic_make_request_checks+0x4dd/0x690
[...]
BUG: unable to handle kernel NULL pointer dereference at 0000000000000155
PGD 0 P4D 0
Oops: 0000 [#1] SMP PTI
RIP: 0010:blk_throtl_bio+0x45/0x970
[...]
Call Trace:
 generic_make_request_checks+0x1bf/0x690
 generic_make_request+0x64/0x3f0
 raid0_make_request+0x184/0x620 [raid0]
 ? raid0_make_request+0x184/0x620 [raid0]
 ? blk_queue_split+0x384/0x6d0
 md_handle_request+0x126/0x1a0
 md_make_request+0x7b/0x180
 generic_make_request+0x19e/0x3f0
 submit_bio+0x73/0x140
[...]

This patch changes raid0 driver to fallback to the "old" blocking queue
entering procedure, by clearing the BIO_QUEUE_ENTERED from raid0 bios.
This prevents the crashes and restores the regular behavior of raid0
arrays when a member is removed during a large write.

[0] https://marc.info/?l=linux-block&m=152638475806811

Cc: Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: stable@vger.kernel.org # v4.18
Fixes: cd4a4ae4683d ("block: don't use blocking queue entered for recursive bio submits")
Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
---
 drivers/md/raid0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index f3fb5bb8c82a..d5bdc79e0835 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -547,6 +547,7 @@ static void raid0_handle_discard(struct mddev *mddev, struct bio *bio)
 			trace_block_bio_remap(bdev_get_queue(rdev->bdev),
 				discard_bio, disk_devt(mddev->gendisk),
 				bio->bi_iter.bi_sector);
+		bio_clear_flag(bio, BIO_QUEUE_ENTERED);
 		generic_make_request(discard_bio);
 	}
 	bio_endio(bio);
@@ -602,6 +603,7 @@ static bool raid0_make_request(struct mddev *mddev, struct bio *bio)
 				disk_devt(mddev->gendisk), bio_sector);
 	mddev_check_writesame(mddev, bio);
 	mddev_check_write_zeroes(mddev, bio);
+	bio_clear_flag(bio, BIO_QUEUE_ENTERED);
 	generic_make_request(bio);
 	return true;
 }
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
