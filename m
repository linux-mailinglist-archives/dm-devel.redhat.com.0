Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1016D25BAC4
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 08:03:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-YAQ5yWTmPKKQdQ3CdJsUmw-1; Thu, 03 Sep 2020 02:03:00 -0400
X-MC-Unique: YAQ5yWTmPKKQdQ3CdJsUmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8FD7425DC;
	Thu,  3 Sep 2020 06:02:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98BD35D6C4;
	Thu,  3 Sep 2020 06:02:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43A3C1800BB2;
	Thu,  3 Sep 2020 06:02:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08362DvQ004025 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 02:02:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 26E28202450A; Thu,  3 Sep 2020 06:02:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F1C5200AE6D
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 06:02:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B158185A78B
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 06:02:09 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-469-58HrFHgjOrWiBcEKupC6EQ-1; Thu, 03 Sep 2020 02:02:07 -0400
X-MC-Unique: 58HrFHgjOrWiBcEKupC6EQ-1
Received: from [2001:4bb8:184:af1:c70:4a89:bc61:2] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDhzl-0007Ox-8y; Thu, 03 Sep 2020 05:41:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Sep 2020 07:41:02 +0200
Message-Id: <20200903054104.228829-8-hch@lst.de>
In-Reply-To: <20200903054104.228829-1-hch@lst.de>
References: <20200903054104.228829-1-hch@lst.de>
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
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org, drbd-dev@tron.linbit.com
Subject: [dm-devel] [PATCH 7/9] target/iblock: fix holder printing in
	iblock_show_configfs_dev_params
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

bd_contains is never NULL for an open block device.  In addition ibd_bd
is always set to a block device that was exclusively opened by the
target code, so the holder is guranteed to be ib_dev as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/target/target_core_iblock.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index 1c181d31f4c872..f2bd2e207e0b36 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -611,9 +611,8 @@ static ssize_t iblock_show_configfs_dev_params(struct se_device *dev, char *b)
 	bl += sprintf(b + bl, "        ");
 	if (bd) {
 		bl += sprintf(b + bl, "Major: %d Minor: %d  %s\n",
-			MAJOR(bd->bd_dev), MINOR(bd->bd_dev), (!bd->bd_contains) ?
-			"" : (bd->bd_holder == ib_dev) ?
-			"CLAIMED: IBLOCK" : "CLAIMED: OS");
+			MAJOR(bd->bd_dev), MINOR(bd->bd_dev),
+			"CLAIMED: IBLOCK");
 	} else {
 		bl += sprintf(b + bl, "Major: 0 Minor: 0\n");
 	}
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

