Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE5C2D2FD0
	for <lists+dm-devel@lfdr.de>; Tue,  8 Dec 2020 17:37:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-av_aO6m7OzGe8eJ4oBg3XQ-1; Tue, 08 Dec 2020 11:37:41 -0500
X-MC-Unique: av_aO6m7OzGe8eJ4oBg3XQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 955D01005504;
	Tue,  8 Dec 2020 16:37:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DE455C1A1;
	Tue,  8 Dec 2020 16:37:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2738A4BB40;
	Tue,  8 Dec 2020 16:37:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8GbWES007910 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 11:37:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 612F82026D36; Tue,  8 Dec 2020 16:37:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CA2B2026D5D
	for <dm-devel@redhat.com>; Tue,  8 Dec 2020 16:37:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0DF5800962
	for <dm-devel@redhat.com>; Tue,  8 Dec 2020 16:37:28 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-179-qBJri_2LMYe9GeQht-H26A-1; Tue, 08 Dec 2020 11:37:26 -0500
X-MC-Unique: qBJri_2LMYe9GeQht-H26A-1
Received: from [2001:4bb8:188:f36:7a30:8a2b:aea3:231b] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfzI-0001Nu-He; Tue, 08 Dec 2020 16:37:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  8 Dec 2020 17:28:27 +0100
Message-Id: <20201208162829.2424563-5-hch@lst.de>
In-Reply-To: <20201208162829.2424563-1-hch@lst.de>
References: <20201208162829.2424563-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Sagi Grimberg <sagi@grimberg.me>, Mike Snitzer <snitzer@redhat.com>,
	Oleksii Kurochko <olkuroch@cisco.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Subject: [dm-devel] [PATCH 4/6] block: propagate BLKROSET on the whole
	device to all partitions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the policy so that a BLKROSET on the whole device also affects
partitions.  To quote Martin K. Petersen:

It's very common for database folks to twiddle the read-only state of
block devices and partitions. I know that our users will find it very
counter-intuitive that setting /dev/sda read-only won't prevent writes
to /dev/sda1.

The existing behavior is inconsistent in the sense that doing:

  # blockdev --setro /dev/sda
  # echo foo > /dev/sda1

permits writes. But:

  # blockdev --setro /dev/sda
  <something triggers revalidate>
  # echo foo > /dev/sda1

doesn't.

And a subsequent:

  # blockdev --setrw /dev/sda
  # echo foo > /dev/sda1

doesn't work either since sda1's read-only policy has been inherited
from the whole-disk device.

You need to do:

  # blockdev --rereadpt

after setting the whole-disk device rw to effectuate the same change on
the partitions, otherwise they are stuck being read-only indefinitely.

However, setting the read-only policy on a partition does *not* require
the revalidate step. As a matter of fact, doing the revalidate will blow
away the policy setting you just made.

So the user needs to take different actions depending on whether they
are trying to read-protect a whole-disk device or a partition. Despite
using the same ioctl. That is really confusing.

I have lost count how many times our customers have had data clobbered
because of ambiguity of the existing whole-disk device policy. The
current behavior violates the principle of least surprise by letting the
user think they write protected the whole disk when they actually
didn't.

Suggested-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 block/genhd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index d9f989c1514123..6e51ecb9280aca 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1656,8 +1656,7 @@ EXPORT_SYMBOL(set_disk_ro);
 
 int bdev_read_only(struct block_device *bdev)
 {
-	return bdev->bd_read_only ||
-		test_bit(GD_READ_ONLY, &bdev->bd_disk->state);
+	return bdev->bd_read_only || get_disk_ro(bdev->bd_disk);
 }
 EXPORT_SYMBOL(bdev_read_only);
 
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

