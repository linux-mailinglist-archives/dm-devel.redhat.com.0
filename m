Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42499612B8B
	for <lists+dm-devel@lfdr.de>; Sun, 30 Oct 2022 17:11:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667146262;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xeHxZjva7+6zjY2XY7Q1On5mylD620MtuLXZriIDsUs=;
	b=cwLJsUkSvWW5QZA7JSj0+jh/yw+ldcF3a3vSQtBQnC9BpkbMaypRKFeHbM334uCpOptCIN
	qTg8K3/HlJkXb6epKHCuDxbZLvgvNTReo7hOFJ/T0Tlya1VMtrSIiNNkc2hgUBaC6CGW1i
	zhLjlD1z2+7hfQ6U6lgf2DzM8xOqDEk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-zgHed4izM7WRtezHZDWtgg-1; Sun, 30 Oct 2022 12:10:30 -0400
X-MC-Unique: zgHed4izM7WRtezHZDWtgg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70162858282;
	Sun, 30 Oct 2022 16:10:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F28C639D6A;
	Sun, 30 Oct 2022 16:10:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AD91A19465A3;
	Sun, 30 Oct 2022 16:10:27 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 944DE1946589
 for <dm-devel@listman.corp.redhat.com>; Sun, 30 Oct 2022 16:10:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 78F0E40C6F9F; Sun, 30 Oct 2022 16:10:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 716F840C6F75
 for <dm-devel@redhat.com>; Sun, 30 Oct 2022 16:10:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 568FC85A59D
 for <dm-devel@redhat.com>; Sun, 30 Oct 2022 16:10:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-eacA6EOCOFyBjcYGpFQkuw-1; Sun, 30 Oct 2022 12:10:07 -0400
X-MC-Unique: eacA6EOCOFyBjcYGpFQkuw-1
Received: from 213-225-37-80.nat.highway.a1.net ([213.225.37.80]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1opAHk-00HVnk-8O; Sun, 30 Oct 2022 15:31:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>
Date: Sun, 30 Oct 2022 16:31:14 +0100
Message-Id: <20221030153120.1045101-3-hch@lst.de>
In-Reply-To: <20221030153120.1045101-1-hch@lst.de>
References: <20221030153120.1045101-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH 2/7] dm: remove free_table_devices
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-block@vger.kernel.org, Yu Kuai <yukuai1@huaweicloud.com>,
 dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

free_table_devices just warns and frees all table_device structures when
the target removal did not remove them.  This should never happen, but
if it did, just freeing the structure without deleting them from the
list or cleaning up the resources would not help at all.  So just WARN on
a non-empty list instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 95a1ee3d314eb..19d25bf997be4 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -833,19 +833,6 @@ void dm_put_table_device(struct mapped_device *md, struct dm_dev *d)
 	mutex_unlock(&md->table_devices_lock);
 }
 
-static void free_table_devices(struct list_head *devices)
-{
-	struct list_head *tmp, *next;
-
-	list_for_each_safe(tmp, next, devices) {
-		struct table_device *td = list_entry(tmp, struct table_device, list);
-
-		DMWARN("dm_destroy: %s still exists with %d references",
-		       td->dm_dev.name, refcount_read(&td->count));
-		kfree(td);
-	}
-}
-
 /*
  * Get the geometry associated with a dm device
  */
@@ -2122,7 +2109,7 @@ static void free_dev(struct mapped_device *md)
 
 	cleanup_mapped_device(md);
 
-	free_table_devices(&md->table_devices);
+	WARN_ON_ONCE(!list_empty(&md->table_devices));
 	dm_stats_cleanup(&md->stats);
 	free_minor(minor);
 
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

