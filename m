Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8CE25BABD
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 08:02:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-QjvUdlJLNOmTGNKqsCa1kw-1; Thu, 03 Sep 2020 02:02:20 -0400
X-MC-Unique: QjvUdlJLNOmTGNKqsCa1kw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC5341084C89;
	Thu,  3 Sep 2020 06:02:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09F8F5C1C2;
	Thu,  3 Sep 2020 06:02:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51D2F180B656;
	Thu,  3 Sep 2020 06:02:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08362994004000 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 02:02:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C499BF1C99; Thu,  3 Sep 2020 06:02:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C00C7F41AB
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 06:02:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69C47101AA40
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 06:02:07 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-386-_-7ChPjKOXePjI2eqlu4HA-1; Thu, 03 Sep 2020 02:02:05 -0400
X-MC-Unique: _-7ChPjKOXePjI2eqlu4HA-1
Received: from [2001:4bb8:184:af1:c70:4a89:bc61:2] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDhzn-0007PA-BQ; Thu, 03 Sep 2020 05:41:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Sep 2020 07:41:04 +0200
Message-Id: <20200903054104.228829-10-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org, drbd-dev@tron.linbit.com
Subject: [dm-devel] [PATCH 9/9] vsprintf: use bd_partno in bdev_name
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

No need to go through the hd_struct to find the partition number.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/vsprintf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index afb9521ddf9197..14c9a6af1b239a 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -940,13 +940,13 @@ char *bdev_name(char *buf, char *end, struct block_device *bdev,
 
 	hd = bdev->bd_disk;
 	buf = string(buf, end, hd->disk_name, spec);
-	if (bdev->bd_part->partno) {
+	if (bdev->bd_partno) {
 		if (isdigit(hd->disk_name[strlen(hd->disk_name)-1])) {
 			if (buf < end)
 				*buf = 'p';
 			buf++;
 		}
-		buf = number(buf, end, bdev->bd_part->partno, spec);
+		buf = number(buf, end, bdev->bd_partno, spec);
 	}
 	return buf;
 }
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

