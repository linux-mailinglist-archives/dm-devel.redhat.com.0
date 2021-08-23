Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8D93F52FF
	for <lists+dm-devel@lfdr.de>; Mon, 23 Aug 2021 23:45:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-Cme3dAn5NPGCxsUKpkYCgw-1; Mon, 23 Aug 2021 17:45:42 -0400
X-MC-Unique: Cme3dAn5NPGCxsUKpkYCgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72CE4108292B;
	Mon, 23 Aug 2021 21:45:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FC1019C59;
	Mon, 23 Aug 2021 21:45:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 196394BB7C;
	Mon, 23 Aug 2021 21:45:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17NLIrH8019314 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Aug 2021 17:18:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D5F8CBDC5F; Mon, 23 Aug 2021 21:18:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2077BDC58
	for <dm-devel@redhat.com>; Mon, 23 Aug 2021 21:18:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34DCB1066558
	for <dm-devel@redhat.com>; Mon, 23 Aug 2021 21:18:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-252-22ySlIt_NquRAzHRl6GdFg-1; Mon, 23 Aug 2021 17:18:47 -0400
X-MC-Unique: 22ySlIt_NquRAzHRl6GdFg-1
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mIGZa-000Zjc-Fg; Mon, 23 Aug 2021 20:29:34 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, martin.petersen@oracle.com, jejb@linux.ibm.com,
	kbusch@kernel.org, sagi@grimberg.me, adrian.hunter@intel.com,
	beanhuo@micron.com, ulf.hansson@linaro.org, avri.altman@wdc.com,
	swboyd@chromium.org, agk@redhat.com, snitzer@redhat.com,
	josef@toxicpanda.com
Date: Mon, 23 Aug 2021 13:29:30 -0700
Message-Id: <20210823202930.137278-11-mcgrof@kernel.org>
In-Reply-To: <20210823202930.137278-1-mcgrof@kernel.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
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
X-Mailman-Approved-At: Mon, 23 Aug 2021 17:45:12 -0400
Cc: linux-block@vger.kernel.org, bvanassche@acm.org, linux-scsi@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, ming.lei@redhat.com,
	hch@infradead.org, dm-devel@redhat.com, nbd@other.debian.org,
	Christoph Hellwig <hch@lst.de>, Luis Chamberlain <mcgrof@kernel.org>
Subject: [dm-devel] [PATCH 10/10] nbd: add error handling support for
	add_disk()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index c38317979f74..95f84c9b31f2 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1730,10 +1730,14 @@ static int nbd_dev_add(int index)
 	disk->fops = &nbd_fops;
 	disk->private_data = nbd;
 	sprintf(disk->disk_name, "nbd%d", index);
-	add_disk(disk);
+	err = add_disk(disk);
+	if (err)
+		goto out_err_disk;
 	nbd_total_devices++;
 	return index;
 
+out_err_disk:
+	blk_cleanup_disk(disk);
 out_free_idr:
 	idr_remove(&nbd_index_idr, index);
 out_free_tags:
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

