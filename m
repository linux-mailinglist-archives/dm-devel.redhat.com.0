Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B004146C8
	for <lists+dm-devel@lfdr.de>; Mon,  6 May 2019 10:50:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0188F6698A;
	Mon,  6 May 2019 08:50:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C74DA60C44;
	Mon,  6 May 2019 08:50:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B32718089CB;
	Mon,  6 May 2019 08:50:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UMbd63017609 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 18:37:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9381781741; Tue, 30 Apr 2019 22:37:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E50181764
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 22:37:37 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20D9E30832E1
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 22:37:36 +0000 (UTC)
Received: from mail-qt1-f197.google.com ([209.85.160.197])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hLbNW-0008Vm-5g
	for dm-devel@redhat.com; Tue, 30 Apr 2019 22:37:34 +0000
Received: by mail-qt1-f197.google.com with SMTP id g28so14729814qtk.7
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 15:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VgoSZsdwFw8Q/prYgcdaWGqbAEOq+PelG6nqt2UwOVY=;
	b=lBWKtmZEfY9aW9OfZjmz36FVd8oC/dmZJmZetZt93dVNGstZhjxz7wFxo5gwTNoU7h
	lTTLgMPPv6/h8IwY4dC92WG+sPO6Rzp/pq/Og3vIeD6Yp1FwF+BzuiBLjU7AtQPcsK8p
	QLqWAWMP5Da81lUEtrqPVcMNs+yvX4UnM+aStdb0Vy8sLtlW24O0lju82yXUAeVHv4f4
	aXq5AETCS821Cp3R57PRo6eK6vgT1jCD4wFHN94VgZzzpV09nX5dsvD1iJQxN0bTE0EK
	ol+H3R8gNF57tAB0P8IhqyXoPY8GtmiyBg6zRkZdaHdC5rA4FPQfImnHma4yRoBFxyYB
	3ySQ==
X-Gm-Message-State: APjAAAXDAtC2xTX0ecvnYj/J/25HE6Kqsa50AI31D+XXcItVS9I5rQBo
	H9vRywKw6a6HQQ8au+fVrLy3F4cm9P0Dlh9ta1IoXGIpoXldwZEpCawZ3Q95lfNnxJNQDxcJYoU
	ytVBgXCJVpVHuBUc2/nApd/nxAazMKw==
X-Received: by 2002:aed:3f4b:: with SMTP id q11mr34249840qtf.18.1556663853357; 
	Tue, 30 Apr 2019 15:37:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw7vhTwhHnYlyqaq5Oxv0tWjuUfEQp4eI6S7cAWJxIbExGQPqR5pZAAY0sniOUMh/U6GpLBmA==
X-Received: by 2002:aed:3f4b:: with SMTP id q11mr34249822qtf.18.1556663853180; 
	Tue, 30 Apr 2019 15:37:33 -0700 (PDT)
Received: from localhost (201-13-157-136.dial-up.telesp.net.br.
	[201.13.157.136]) by smtp.gmail.com with ESMTPSA id
	l15sm10369506qti.12.2019.04.30.15.37.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 15:37:32 -0700 (PDT)
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To: linux-block@vger.kernel.org, linux-raid@vger.kernel.org
Date: Tue, 30 Apr 2019 19:37:21 -0300
Message-Id: <20190430223722.20845-1-gpiccoli@canonical.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Tue, 30 Apr 2019 22:37:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 30 Apr 2019 22:37:36 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -5 (RCVD_IN_DNSWL_HI) 91.189.89.112
	youngberry.canonical.com 91.189.89.112 youngberry.canonical.com
	<gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 May 2019 04:49:36 -0400
Cc: axboe@kernel.dk, kernel@gpiccoli.net, Bart Van Assche <bvanassche@acm.org>,
	gpiccoli@canonical.com, stable@vger.kernel.org,
	dm-devel@redhat.com, jay.vosburgh@canonical.com, gavin.guo@canonical.com
Subject: [dm-devel] [PATCH 1/2] block: Fix a NULL pointer dereference in
	generic_make_request()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 06 May 2019 08:50:33 +0000 (UTC)

Commit 37f9579f4c31 ("blk-mq: Avoid that submitting a bio concurrently
with device removal triggers a crash") introduced a NULL pointer
dereference in generic_make_request(). The patch sets q to NULL and
enter_succeeded to false; right after, there's an 'if (enter_succeeded)'
which is not taken, and then the 'else' will dereference q in
blk_queue_dying(q).

This patch just moves the 'q = NULL' to a point in which it won't trigger
the oops, although the semantics of this NULLification remains untouched.

A simple test case/reproducer is as follows:
a) Build kernel v5.1-rc7 with CONFIG_BLK_CGROUP=n.

b) Create a raid0 md array with 2 NVMe devices as members, and mount it
with an ext4 filesystem.

c) Run the following oneliner (supposing the raid0 is mounted in /mnt):
(dd of=/mnt/tmp if=/dev/zero bs=1M count=999 &); sleep 0.3;
echo 1 > /sys/block/nvme0n1/device/device/remove
(whereas nvme0n1 is the 2nd array member)

This will trigger the following oops:

BUG: unable to handle kernel NULL pointer dereference at 0000000000000078
PGD 0 P4D 0
Oops: 0000 [#1] SMP PTI
RIP: 0010:generic_make_request+0x32b/0x400
Call Trace:
 submit_bio+0x73/0x140
 ext4_io_submit+0x4d/0x60
 ext4_writepages+0x626/0xe90
 do_writepages+0x4b/0xe0
[...]

This patch has no functional changes and preserves the md/raid0 behavior
when a member is removed before kernel v4.17.

Cc: Bart Van Assche <bvanassche@acm.org>
Cc: stable@vger.kernel.org # v4.17
Fixes: 37f9579f4c31 ("blk-mq: Avoid that submitting a bio concurrently with device removal triggers a crash")
Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
---
 block/blk-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index a55389ba8779..e21856a7f3fa 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1076,7 +1076,6 @@ blk_qc_t generic_make_request(struct bio *bio)
 				flags = BLK_MQ_REQ_NOWAIT;
 			if (blk_queue_enter(q, flags) < 0) {
 				enter_succeeded = false;
-				q = NULL;
 			}
 		}
 
@@ -1108,6 +1107,7 @@ blk_qc_t generic_make_request(struct bio *bio)
 				bio_wouldblock_error(bio);
 			else
 				bio_io_error(bio);
+			q = NULL;
 		}
 		bio = bio_list_pop(&bio_list_on_stack[0]);
 	} while (bio);
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
