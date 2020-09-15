Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4791F26AA77
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 19:24:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600190671;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g1k3XW6myxTdloksNrXuTwEwx6BnY6wV21Xu/4CpTGg=;
	b=MCVymlXS7ty2uVPcbJMwOEWNZfEWdJerWXtYwfV0B+Yu7NU5Rvs08GC9UjAff09c2vKzFr
	Ed7/L/SOaC4JLbyoi68WS+BaSlhS3Agc7ZNGk2f0oPD2NdxsHxMZ+o8llk0yUQM01ZIZoB
	bJM2Ud2DzMaKn1GrAIGI99d2IhKQ31w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-NyJClU7mMuKOD73hdt1AhQ-1; Tue, 15 Sep 2020 13:24:29 -0400
X-MC-Unique: NyJClU7mMuKOD73hdt1AhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BE9719273D8;
	Tue, 15 Sep 2020 17:24:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84D7B19728;
	Tue, 15 Sep 2020 17:24:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4429183D021;
	Tue, 15 Sep 2020 17:24:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FHO8mU003146 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 13:24:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDAB6110E9AE; Tue, 15 Sep 2020 17:24:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E975D110E9AD
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 17:24:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 850C9800161
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 17:24:05 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-375-y6_LLa_XPxeFHlVmI4pJTA-1; Tue, 15 Sep 2020 13:24:02 -0400
X-MC-Unique: y6_LLa_XPxeFHlVmI4pJTA-1
Received: by mail-qt1-f196.google.com with SMTP id g3so3764662qtq.10;
	Tue, 15 Sep 2020 10:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=ZeX8V7Gb+jyRqRtlgs7NF1BRzrZm/6v3hKPdNUeahLM=;
	b=rvvZhudrILQDQRW4zR15nodiMlcp4o6N//4uY05AlPmHUPOTneKlBbwAIf6+GLbRj1
	UXCrZXywYOYNYS36TJP8WLV6VPxKmsnCBo2UWr6bn+T6vDrYWpnU83rJfG+Wlo3OWEA7
	8PFYlJCnDJOqANNQRAqyCW9fQYTIO7Q4fqr+z3ioA+IlPn/tp9eKOhCliUPXhUC3Hj0k
	os7V9SPiwf4NXLHq41cDvr6e/VHAQQURsCeDAH8lIS3wbnhghJHYeb5N10zuX6Frq3HR
	D2POSs8HpGZPGmih9VZhtlkDmewriL2ir30EMyBYJcqOyUjj6hSi7G/MU8tlM4YTMsV6
	q3dw==
X-Gm-Message-State: AOAM5324QZgg1VQ9EZ7HU3LsmbU7Xw+ixr7GZQHAJMkwAdZU+ykLhUuo
	U70Nf956Hsw52bdSX+zaB7A=
X-Google-Smtp-Source: ABdhPJxrNthacXH+fyYZJ5rnayPOSYCU9MD/k5XzuTD8OsypSir6w5+0Cqu7Ydt5jXOHJtWRCM82aA==
X-Received: by 2002:ac8:3704:: with SMTP id o4mr17825222qtb.330.1600190641615; 
	Tue, 15 Sep 2020 10:24:01 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	z2sm17349244qkg.40.2020.09.15.10.24.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Sep 2020 10:24:01 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 15 Sep 2020 13:23:55 -0400
Message-Id: <20200915172357.83215-3-snitzer@redhat.com>
In-Reply-To: <20200915172357.83215-1-snitzer@redhat.com>
References: <20200915172357.83215-1-snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v2 2/4] block: allow 'chunk_sectors' to be
	non-power-of-2
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It is possible for a block device to use a non power-of-2 for chunk
size which results in a full-stripe size that is also a non
power-of-2.

Update blk_queue_chunk_sectors() and blk_max_size_offset() to
accommodate drivers that need a non power-of-2 chunk_sectors.

Signed-off-by: Mike Snitzer <snitzer@redhat.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-settings.c   | 10 ++++------
 include/linux/blkdev.h | 12 +++++++++---
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index b2e1a929a6db..5ea3de48afba 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -172,15 +172,13 @@ EXPORT_SYMBOL(blk_queue_max_hw_sectors);
  *
  * Description:
  *    If a driver doesn't want IOs to cross a given chunk size, it can set
- *    this limit and prevent merging across chunks. Note that the chunk size
- *    must currently be a power-of-2 in sectors. Also note that the block
- *    layer must accept a page worth of data at any offset. So if the
- *    crossing of chunks is a hard limitation in the driver, it must still be
- *    prepared to split single page bios.
+ *    this limit and prevent merging across chunks. Note that the block layer
+ *    must accept a page worth of data at any offset. So if the crossing of
+ *    chunks is a hard limitation in the driver, it must still be prepared
+ *    to split single page bios.
  **/
 void blk_queue_chunk_sectors(struct request_queue *q, unsigned int chunk_sectors)
 {
-	BUG_ON(!is_power_of_2(chunk_sectors));
 	q->limits.chunk_sectors = chunk_sectors;
 }
 EXPORT_SYMBOL(blk_queue_chunk_sectors);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index bb5636cc17b9..bbfbda33e993 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1059,11 +1059,17 @@ static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
 static inline unsigned int blk_max_size_offset(struct request_queue *q,
 					       sector_t offset)
 {
-	if (!q->limits.chunk_sectors)
+	unsigned int chunk_sectors = q->limits.chunk_sectors;
+
+	if (!chunk_sectors)
 		return q->limits.max_sectors;
 
-	return min(q->limits.max_sectors, (unsigned int)(q->limits.chunk_sectors -
-			(offset & (q->limits.chunk_sectors - 1))));
+	if (is_power_of_2(chunk_sectors))
+		chunk_sectors -= offset & (chunk_sectors - 1);
+	else
+		chunk_sectors -= sector_div(offset, chunk_sectors);
+
+	return min(q->limits.max_sectors, chunk_sectors);
 }
 
 static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

