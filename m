Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD157615C6F
	for <lists+dm-devel@lfdr.de>; Wed,  2 Nov 2022 07:49:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667371756;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O+t55UUyblDk/hWSX+j+wsueAGYQX+p/zMEB5D1CQmE=;
	b=gYMgPp+K8UVcNNcPmmAxq8eTvhZhzS9ctcz98Q2M2H+0Bxz46rgrKEXUB0vUeLCWKekNAi
	qP6j+cyhM4QpzAJZhj8U4XHdlrlswS2SarVyTtBe97rSZkRWhwt2w50sKQOR8Lmvg7hjim
	A+ySV8XL9fBWXx1fZ/nTdsmxqeEg8oA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-zVzXeSCCOCWk7PS1OSkgeg-1; Wed, 02 Nov 2022 02:49:12 -0400
X-MC-Unique: zVzXeSCCOCWk7PS1OSkgeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEFD1185A78F;
	Wed,  2 Nov 2022 06:49:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D3E2141511F;
	Wed,  2 Nov 2022 06:49:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 905FC1946A48;
	Wed,  2 Nov 2022 06:49:02 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8D2661946594
 for <dm-devel@listman.corp.redhat.com>; Wed,  2 Nov 2022 06:49:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4D7F01415122; Wed,  2 Nov 2022 06:49:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 465FF141511F
 for <dm-devel@redhat.com>; Wed,  2 Nov 2022 06:49:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F424185A78F
 for <dm-devel@redhat.com>; Wed,  2 Nov 2022 06:49:00 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-EGf9qolpPsaVrAhDMlPPkg-1; Wed, 02 Nov 2022 02:48:57 -0400
X-MC-Unique: EGf9qolpPsaVrAhDMlPPkg-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 426096732D; Wed,  2 Nov 2022 07:48:54 +0100 (CET)
Date: Wed, 2 Nov 2022 07:48:54 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>
Message-ID: <20221102064854.GA8950@lst.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [dm-devel] [PATCH 8/7] block: don't claim devices that are not live
 in bd_link_disk_holder
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For gendisk that are not live or their partitions, the bd_holder_dir
pointer is not valid and the kobject might not have been allocated
yet or freed already.  Check that the disk is live before creating the
linkage and error out otherwise.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/holder.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/block/holder.c b/block/holder.c
index a8c355b9d0806..a8806bbed2112 100644
--- a/block/holder.c
+++ b/block/holder.c
@@ -66,6 +66,11 @@ int bd_link_disk_holder(struct block_device *bdev, struct gendisk *disk)
 		return -EINVAL;
 
 	mutex_lock(&disk->open_mutex);
+	/* bd_holder_dir is only valid for live disks */
+	if (!disk_live(bdev->bd_disk)) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
 
 	WARN_ON_ONCE(!bdev->bd_holder);
 
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

