Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2A73071BE
	for <lists+dm-devel@lfdr.de>; Thu, 28 Jan 2021 09:40:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-9yXzXEuBPFuizz2mZe0Ndg-1; Thu, 28 Jan 2021 03:39:22 -0500
X-MC-Unique: 9yXzXEuBPFuizz2mZe0Ndg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFED580A5CE;
	Thu, 28 Jan 2021 08:39:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AC5E72171;
	Thu, 28 Jan 2021 08:39:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E2C21809CA6;
	Thu, 28 Jan 2021 08:39:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10S7DYaB007487 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 Jan 2021 02:13:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 04E79ED145; Thu, 28 Jan 2021 07:13:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3CAAED154
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 07:13:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AFD482DFE1
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 07:13:31 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-566-gU1Bh6TvOrqxvJ3IGzBwVQ-1; Thu, 28 Jan 2021 02:13:25 -0500
X-MC-Unique: gU1Bh6TvOrqxvJ3IGzBwVQ-1
IronPort-SDR: IaHuwqLJ/0F0TvFH7x7QYMJd5uv6w1TmFx2qqRp5wXduu4eV0uFWTzIwkizVat2JemebER4peu
	qFIvW++kpwIHR5Slt7RDvosdRMQ7gxq3FQK84AFd6+4pxJIRUyK3ArCZjWrKI5nfq+H2L3gO8q
	5d46yWX67/6z7NLrbWZgEgPWzbUvfCH/cEoqnOEU2GLfmAUUEXhaRnGFaLva4+MmwQcL1H0x4R
	50ZzHWlC6wVnO7vYvN5IUTVjJCYWlVZ+dcbY5l5gNXoIQBIMu2BlbLZB8JnUvrsCq5LxQOflNB
	8hY=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="262548983"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:15:18 +0800
IronPort-SDR: GsOdW0uJpM/JWpZStofHXBGEJfp95+5md8ALDpC+B8+bgkQq1yddz8yWNEZ9cdLkr1tsgSupGu
	SwgsSguCdRdhPp91gMqRY7WtnDEOACUTe66JH8PHH+3tcFiwKrDkzR0xDUJnrdS2PnBKT7abQR
	VK4Eg6yDznX/n9D+vrEDDp02FGTyJVXiPoe5+/WTVIgUcBBkM6RHUeLpigJCJ/qJKYyt4kO/A2
	mMdscUJ2575TSDy8JqGN8/5Tpjpg00QydMV0jR68VnF9os6m1H31LcMEABXA8iTuiQgKPMAPmp
	1ixzjwox2BUj28N7HrBhhWHm
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:55:41 -0800
IronPort-SDR: S7K4kJLXzJBN+TtdhPMN6TP/Dffs+zSa3G/de5+S1/PIJxe5GMDYhILg7ObwZaeQtAx8NJxvkl
	nIc5LC+mPpv7TI+pptGOuvqvgXc2tzfVFCEyc5+LFgl+ipYQILMS5NCsDr+0Wgl54XSWETlfzh
	gHkg4ZggWJkUuTGFtq5ayNdqurKZ4tOlkNjJtnTH4tbAn7NSWqg+Ok++T//Bdn23FoUZxk+NbJ
	AQUU7LKb9NmxAxDMj2VCc1ROkgf8sOKgTR+MW0zxXzuua4VhN6N1CvrlPe6fa6RhDqhXPf7MuT
	aTA=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:23 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@tron.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:10 -0800
Message-Id: <20210128071133.60335-12-chaitanya.kulkarni@wdc.com>
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 28 Jan 2021 03:38:55 -0500
Cc: shaggy@kernel.org, sergey.senozhatsky.work@gmail.com, snitzer@redhat.com,
	tiwai@suse.de, djwong@kernel.org, gustavoars@kernel.org,
	joseph.qi@linux.alibaba.com, pavel@ucw.cz,
	alex.shi@linux.alibaba.com, hch@lst.de, agk@redhat.com,
	naohiro.aota@wdc.com, sagi@grimberg.me, mark@fasheh.com,
	osandov@fb.com, ebiggers@kernel.org, ngupta@vflare.org,
	len.brown@intel.com, chaitanya.kulkarni@wdc.com,
	konrad.wilk@oracle.com, ming.lei@redhat.com,
	viro@zeniv.linux.org.uk, jefflexu@linux.alibaba.com,
	jaegeuk@kernel.org, konishi.ryusuke@gmail.com,
	bvanassche@acm.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	tytso@mit.edu, akpm@linux-foundation.org,
	martin.petersen@oracle.com, rjw@rjwysocki.net,
	philipp.reisner@linbit.com, minchan@kernel.org, tj@kernel.org,
	lars.ellenberg@linbit.com, jth@kernel.org,
	asml.silence@gmail.com, jlbec@evilplan.org, roger.pau@citrix.com
Subject: [dm-devel] [RFC PATCH 11/34] nvmet: use bio_new in
	nvmet_bdev_execute_rw
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/nvme/target/io-cmd-bdev.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index bf6e0ac9ad28..f5fd93a796a6 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -225,6 +225,7 @@ static int nvmet_bdev_alloc_bip(struct nvmet_req *req, struct bio *bio,
 
 static void nvmet_bdev_execute_rw(struct nvmet_req *req)
 {
+	struct block_device *bdev = req->ns->bdev;
 	int sg_cnt = req->sg_cnt;
 	struct bio *bio;
 	struct scatterlist *sg;
@@ -265,7 +266,7 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *req)
 	} else {
 		bio = bio_alloc(GFP_KERNEL, min(sg_cnt, BIO_MAX_PAGES));
 	}
-	bio_set_dev(bio, req->ns->bdev);
+	bio_set_dev(bio, bdev);
 	bio->bi_iter.bi_sector = sector;
 	bio->bi_private = req;
 	bio->bi_end_io = nvmet_bio_done;
@@ -290,11 +291,7 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *req)
 				}
 			}
 
-			bio = bio_alloc(GFP_KERNEL, min(sg_cnt, BIO_MAX_PAGES));
-			bio_set_dev(bio, req->ns->bdev);
-			bio->bi_iter.bi_sector = sector;
-			bio->bi_opf = op;
-
+			bio = bio_new(bdev, sector, op, 0, sg_cnt, GFP_KERNEL);
 			bio_chain(bio, prev);
 			submit_bio(prev);
 		}
-- 
2.22.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

