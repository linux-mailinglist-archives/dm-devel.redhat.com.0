Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 44CA91BE20A
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 17:07:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588172878;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5dFfQLSuxBQqAbqxvLBvc6VewjCjGvTj7bNMTnWGA4Y=;
	b=X3wrtoUOL7WF4H+a9g0KrKL2o/3yr+At7KA3JZsznBm5V2ex605TPt+rIlGNI0b+Q8XzUG
	LfBhciT1J5/EvR2LBKZA6S8zdwD2zjbdu/kXHMpWVNz+aE91RxHcqqUrYRNKgJ+KRfFLdS
	9oT+eK67GKqWN8vSUr7HAuoYJ7RyXLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-tdSMMoAgMRKe8rjlB3GEJQ-1; Wed, 29 Apr 2020 11:07:38 -0400
X-MC-Unique: tdSMMoAgMRKe8rjlB3GEJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00518800C78;
	Wed, 29 Apr 2020 15:07:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AB8C5C1BE;
	Wed, 29 Apr 2020 15:07:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3245C4CAA7;
	Wed, 29 Apr 2020 15:07:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TF7G0A014266 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 11:07:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D04D4605CB; Wed, 29 Apr 2020 15:07:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from o.ww.redhat.com (unknown [10.40.193.136])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 640A7605F7;
	Wed, 29 Apr 2020 15:07:10 +0000 (UTC)
From: heinzm@redhat.com
To: dm-devel@redhat.com, snitzer@redhat.com
Date: Wed, 29 Apr 2020 17:07:09 +0200
Message-Id: <dff475cd16489080bb229af9bb45c0d67480b8be.1588172814.git.heinzm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm ebs: fix bio->bi_status assignment
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Heinz Mauelshagen <heinzm@redhat.com>

Assign blk_status_t to bi_status properly in __ebs_process_bios()
on error (flaw found by static checker).

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
---
 drivers/md/dm-ebs-target.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
index 97703c31771f..c9c66d6b1e56 100644
--- a/drivers/md/dm-ebs-target.c
+++ b/drivers/md/dm-ebs-target.c
@@ -210,7 +210,8 @@ static void __ebs_process_bios(struct work_struct *ws)
 			r = __ebs_discard_bio(ec, bio);
 		}
 
-		bio->bi_status = r;
+		if (r < 0)
+			bio->bi_status = BLK_STS_IOERR;
 	}
 
 	/*
-- 
2.25.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

