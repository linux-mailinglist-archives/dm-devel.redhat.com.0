Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EECCE273898
	for <lists+dm-devel@lfdr.de>; Tue, 22 Sep 2020 04:33:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600742006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+bZp8jpbThnGG4Rf9OC9MEbVRQkbEz18RZkUkI29sHA=;
	b=X37pWf3N/MZ+FCvt7plQmXFsGmUmfEAb3OJXJjeEgura8ZXP6Dbj+1uvQl+lbKWw//lUZ3
	0GGKUk9xKxHERho9GgK+v8IXgsXhSaUXx8sxqU3z2bXK5jzfgKllpbciRAZu0bf4b3JxBh
	OOmxfTvOBZNF9Tm/iz8+fSSDmRBVg/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-NNupckFzMr-_EkwCuG1U4g-1; Mon, 21 Sep 2020 22:33:23 -0400
X-MC-Unique: NNupckFzMr-_EkwCuG1U4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E62FF1017DCE;
	Tue, 22 Sep 2020 02:33:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BED6960BF4;
	Tue, 22 Sep 2020 02:33:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79F681888B4D;
	Tue, 22 Sep 2020 02:33:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08M2X4Wm017701 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 22:33:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2CFDAE7B0; Tue, 22 Sep 2020 02:33:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCB2FAE7C5
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 02:33:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 628A7186E144
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 02:33:02 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-383-RkGlBrrNO3KbtV0qWxA5NA-1; Mon, 21 Sep 2020 22:32:59 -0400
X-MC-Unique: RkGlBrrNO3KbtV0qWxA5NA-1
Received: by mail-qt1-f196.google.com with SMTP id n10so14419903qtv.3;
	Mon, 21 Sep 2020 19:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=FPyxJTEfNz4t6PoD6vTT7hbbizqhBOkxQ4lCpIxAUdw=;
	b=lotvtwQtx2GVBACWWMzyd1/7uB1xKxF4jtUherZsZ88iQbfMnIkWBGh/CJoeQY9pg8
	W5H93kIfHIJZ1kMMESRLS3ttdGP/bQH5B2QLll2Dvf4y9EAaKxFsvochPB9MvH7W4mn9
	ysVhsvBJEoRwhRU0AQSBZyNxWZlSfMGXv8/+4TfHNnSEliHd7M5XdrSSMv64u+OAWlxj
	WO0hskhScTapStEysoTJAgF0nC2G2SCrg9W13G0elk52D8L7MGY3PaDGsrRnZskL1FSN
	uSMdN4sc6QSDpcr5lr6tSR7KtrjRMpJEJk6wN/s2o2/wU53QNsJARZX+ZspClB0J+7Df
	GIuQ==
X-Gm-Message-State: AOAM532qfclAOrRV5rRqdLK/i1GgT+PzqW2eUIknU44UxliqvoCExZvX
	PXC816JaSiwIzjvzeejrOwc=
X-Google-Smtp-Source: ABdhPJwA7XzwPgQjajmIKJUINJYBRbVON+qScRpOurSH9hVDi4qKTD8l6xVe/lcnpeUv0u/RnRLQfA==
X-Received: by 2002:ac8:3fdd:: with SMTP id v29mr2599290qtk.383.1600741979177; 
	Mon, 21 Sep 2020 19:32:59 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	r24sm11240605qtm.70.2020.09.21.19.32.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Sep 2020 19:32:58 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 21 Sep 2020 22:32:49 -0400
Message-Id: <20200922023251.47712-5-snitzer@redhat.com>
In-Reply-To: <20200922023251.47712-1-snitzer@redhat.com>
References: <20200922023251.47712-1-snitzer@redhat.com>
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
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v3 4/6] block: allow 'chunk_sectors' to be
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It is possible, albeit more unlikely, for a block device to have a non
power-of-2 for chunk_sectors (e.g. 10+2 RAID6 with 128K chunk_sectors,
which results in a full-stripe size of 1280K. This causes the RAID6's
io_opt to be advertised as 1280K, and a stacked device _could_ then be
made to use a blocksize, aka chunk_sectors, that matches non power-of-2
io_opt of underlying RAID6 -- resulting in stacked device's
chunk_sectors being a non power-of-2).

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
index bb5636cc17b9..51d98a595943 100644
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
+	if (likely(is_power_of_2(chunk_sectors)))
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

