Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B8A211D2742
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 08:10:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589436634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ztZhMDpawZt/0FD/5/L6amBQr/OCQg4VkCWF+aEUPHc=;
	b=gW14CR1QodS3EpfsdRr0w6mjm6EHm5wT+L1M3ArzErh3+i3ooqSTad40ZXIjyWf5Ti6xcv
	ydyLPubziN6D7uv6VFTzpsAOzA6HWGS466ru/H2QqhjgeKO312CblmeS8aAEV/srg/A/75
	yx00MOjYjIlEMRWyTZTxbQMRgPNHjUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-b9joEmWNOOiyjxAMaopZ4g-1; Thu, 14 May 2020 02:10:32 -0400
X-MC-Unique: b9joEmWNOOiyjxAMaopZ4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08E50106B245;
	Thu, 14 May 2020 06:10:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC8FA5C1BE;
	Thu, 14 May 2020 06:10:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E50B4CAB0;
	Thu, 14 May 2020 06:10:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E6AN4W028320 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 02:10:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB209103CB2; Thu, 14 May 2020 06:10:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A78B813BBA2
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:10:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65FC680028C
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:10:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-194-GOJyTsLGP1eKKr-X22zbCA-1;
	Thu, 14 May 2020 02:09:35 -0400
X-MC-Unique: GOJyTsLGP1eKKr-X22zbCA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 02FC2ACFA;
	Thu, 14 May 2020 06:09:36 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Thu, 14 May 2020 08:09:29 +0200
Message-Id: <20200514060929.85469-3-hare@suse.de>
In-Reply-To: <20200514060929.85469-1-hare@suse.de>
References: <20200514060929.85469-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 2/2] dm-zoned: remove spurious newlines from
	debugging messages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

DMDEBUG will already add a newline to the logging messages, so we
shouldn't be adding it to the message itself.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-reclaim.c | 4 ++--
 drivers/md/dm-zoned-target.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 39ea0d5d4706..4bfa61540b9c 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -405,7 +405,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 
 	ret = dmz_flush_metadata(zrc->metadata);
 	if (ret) {
-		DMDEBUG("(%s): Metadata flush for zone %u failed, err %d\n",
+		DMDEBUG("(%s): Metadata flush for zone %u failed, err %d",
 			dmz_metadata_label(zmd), rzone->id, ret);
 		return ret;
 	}
@@ -493,7 +493,7 @@ static void dmz_reclaim_work(struct work_struct *work)
 
 	ret = dmz_do_reclaim(zrc);
 	if (ret) {
-		DMDEBUG("(%s): Reclaim error %d\n",
+		DMDEBUG("(%s): Reclaim error %d",
 			dmz_metadata_label(zmd), ret);
 		if (!dmz_check_dev(zmd))
 			return;
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index ea43f6892ced..a3d572da70ad 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -515,7 +515,7 @@ static void dmz_flush_work(struct work_struct *work)
 	/* Flush dirty metadata blocks */
 	ret = dmz_flush_metadata(dmz->metadata);
 	if (ret)
-		DMDEBUG("(%s): Metadata flush failed, rc=%d\n",
+		DMDEBUG("(%s): Metadata flush failed, rc=%d",
 			dmz_metadata_label(dmz->metadata), ret);
 
 	/* Process queued flush requests */
@@ -679,7 +679,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 	/* Now ready to handle this BIO */
 	ret = dmz_queue_chunk_work(dmz, bio);
 	if (ret) {
-		DMDEBUG("(%s): BIO op %d, can't process chunk %llu, err %i\n",
+		DMDEBUG("(%s): BIO op %d, can't process chunk %llu, err %i",
 			dmz_metadata_label(zmd),
 			bio_op(bio), (u64)dmz_bio_chunk(zmd, bio),
 			ret);
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

