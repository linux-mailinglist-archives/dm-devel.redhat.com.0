Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 27FDB266A64
	for <lists+dm-devel@lfdr.de>; Fri, 11 Sep 2020 23:55:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599861311;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ve9tv+htMe7IWlkk5nZ1PIkapWR0MfdkCZa9/36eYQw=;
	b=csBM/e3g8QOphIzNyj008J8iw8PvpHrbOIGCHgI5RoW4TrKiLOK5dUn2+lTIFtsdHXAyn6
	roK1DRKPPFs1B8DdAI1urKdN3Ttw4fhLhbo04KtzOQ8GnMT++YyhahsuG+4+z7W5Af37/c
	fmgv5L3yWBUt0UslN0GzGyzz0fOQiNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-Ehq3tmwCMgyePprU55vIJg-1; Fri, 11 Sep 2020 17:55:08 -0400
X-MC-Unique: Ehq3tmwCMgyePprU55vIJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D35D800470;
	Fri, 11 Sep 2020 21:55:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBFA360C07;
	Fri, 11 Sep 2020 21:55:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A46E8181A06C;
	Fri, 11 Sep 2020 21:55:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BLro79020443 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 17:53:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6CC7610A1424; Fri, 11 Sep 2020 21:53:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6841210A1422
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 21:53:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12C51101AA40
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 21:53:48 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-427-mbJw4fWDP2Sfht1GUlBhKg-1; Fri, 11 Sep 2020 17:53:46 -0400
X-MC-Unique: mbJw4fWDP2Sfht1GUlBhKg-1
Received: by mail-qv1-f65.google.com with SMTP id z18so5981310qvp.6;
	Fri, 11 Sep 2020 14:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=GRLBuD8wBJFxDc/w03BbrMXmSaW8vxwnTTNt5AMacZQ=;
	b=pogLtQ3kJvcOXUcjOU5cCSlTXr4YdqC0xoW56YUIEyIW2lCR3TulUBQqDX/bXEhaM8
	c1xH+3ilJuiqTH+HEk7Q7YDnF0MWbvN9cV1eQ/Tc53ENuPFetJOi7dh16npcnVcjMiPO
	Z3CfCg6KDRykTTaQrTnGoKYxebZBw2QBf9UtO6lV3H0aMB2CliC+x+TZulvLJAJCCcwJ
	GbIqaqVkxnqypl7z95y5dnBnvu25SYjObBtm530N6B0lUgxK1pui7BvDXV0rNP8wZBBA
	jPgBxut8iZXF5RH+imKvEUR165m7xfpcXtcxEloW7b03l0V/OOLJaQMzecyNzHhcM9xT
	0Tgw==
X-Gm-Message-State: AOAM5321RnzmScEZu3dgEmcPqNGblUMgwPMZSAxNTCmj8HQjoTzoyUix
	7zswCaEfkJ+Ix3MhlG3juuDUBbV5sxc=
X-Google-Smtp-Source: ABdhPJx27ClViUb7nTbJhj32Atvn5BloXIPBVOd8RavvWX13r9fIuwblDEfzORG3/z0J6FmmbPsPsA==
X-Received: by 2002:ad4:408f:: with SMTP id l15mr3987842qvp.4.1599861224845;
	Fri, 11 Sep 2020 14:53:44 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id g4sm3909063qth.30.2020.09.11.14.53.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Sep 2020 14:53:44 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Date: Fri, 11 Sep 2020 17:53:38 -0400
Message-Id: <20200911215338.44805-4-snitzer@redhat.com>
In-Reply-To: <20200911215338.44805-1-snitzer@redhat.com>
References: <20200911215338.44805-1-snitzer@redhat.com>
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
	Vijayendra Suman <vijayendra.suman@oracle.com>
Subject: [dm-devel] [PATCH 3/3] block: allow 'chunk_sectors' to be
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
---
 block/blk-settings.c   | 10 ++++------
 include/linux/blkdev.h | 12 +++++++++---
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index b09642d5f15e..e40a162cc946 100644
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
index 453a3d735d66..e72bcce22143 100644
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
+		chunk_sectors -= (offset & (chunk_sectors - 1));
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

