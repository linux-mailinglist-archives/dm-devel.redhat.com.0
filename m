Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 435E123A1B5
	for <lists+dm-devel@lfdr.de>; Mon,  3 Aug 2020 11:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596446744;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gVMjMI/DNQVVaRRts9Uo8EHlfKbA5MGCaAmhwol4TG4=;
	b=VpnNWVAS7ZpXBZDKQDoH4LBHN947u8z65Rg9mJhpgFitlHcbwM5B0c5H5E7BvkotHqPvce
	kbkM5S7ab6gz3KzotGFqIMdYzMcKF68H/It6skBvPubzxKF35FFu1/ej52uXe2KlY1mIWR
	sr5U4rP+Ae3tDr7gy5OrXOD23UWbgjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-0ZlRMWL7PiuLqZRQ-CgwAA-1; Mon, 03 Aug 2020 05:25:41 -0400
X-MC-Unique: 0ZlRMWL7PiuLqZRQ-CgwAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23784100AA21;
	Mon,  3 Aug 2020 09:25:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FB6919C58;
	Mon,  3 Aug 2020 09:25:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEDF11809554;
	Mon,  3 Aug 2020 09:25:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06VMkw0K031826 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jul 2020 18:46:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31B6B1D3; Fri, 31 Jul 2020 22:46:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost.localdomain.com (ovpn-112-36.rdu2.redhat.com
	[10.10.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1069D5C22A;
	Fri, 31 Jul 2020 22:46:48 +0000 (UTC)
From: John Dorminy <jdorminy@redhat.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com
Date: Fri, 31 Jul 2020 18:46:45 -0400
Message-Id: <20200731224645.89483-1-jdorminy@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 03 Aug 2020 05:22:05 -0400
Cc: John Dorminy <jdorminy@redhat.com>
Subject: [dm-devel] [PATCH] dm-ebs: Fix incorrect checking for REQ_OP_FLUSH.
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

REQ_OP_FLUSH was being treated as a flag, but the operation
part of bio->bi_opf must be treated as a whole. Change to
accessing the operation part via bio_op(bio) and checking
for equality.

Signed-off-by: John Dorminy <jdorminy@redhat.com>
---
 drivers/md/dm-ebs-target.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
index 44451276f128..cb85610527c2 100644
--- a/drivers/md/dm-ebs-target.c
+++ b/drivers/md/dm-ebs-target.c
@@ -363,7 +363,7 @@ static int ebs_map(struct dm_target *ti, struct bio *bio)
 	bio_set_dev(bio, ec->dev->bdev);
 	bio->bi_iter.bi_sector = ec->start + dm_target_offset(ti, bio->bi_iter.bi_sector);
 
-	if (unlikely(bio->bi_opf & REQ_OP_FLUSH))
+	if (unlikely(bio_op(bio) == REQ_OP_FLUSH))
 		return DM_MAPIO_REMAPPED;
 	/*
 	 * Only queue for bufio processing in case of partial or overlapping buffers
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

