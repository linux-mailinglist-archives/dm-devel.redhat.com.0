Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 174944892B8
	for <lists+dm-devel@lfdr.de>; Mon, 10 Jan 2022 08:55:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641801349;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ow8IOCarsCDfu3QEUf4cSGpLtVFckeW9fftoym13QUo=;
	b=F8dVuIxkbzt2rmSBqyl5bIfPSBsqs40s6/vsT5JLKW8WBDy2gTr1a27TVh0hTpILY4ohgT
	B6mz93tsoh5RcapGrsiwdIEZZmixt0R7ctOY/Hlb6Ol8umhMnnWWd75wqZf6wq5ha6ihRB
	l+OiCIf3wnigbpTdlM7TVzMQHDBjCyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-WXfKfFeONMap9gN1r3mT8A-1; Mon, 10 Jan 2022 02:55:45 -0500
X-MC-Unique: WXfKfFeONMap9gN1r3mT8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D48E93E743;
	Mon, 10 Jan 2022 07:55:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADB2070D44;
	Mon, 10 Jan 2022 07:55:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1FCA4BB7C;
	Mon, 10 Jan 2022 07:55:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20A7r0jG015350 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Jan 2022 02:53:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B1351694DE; Mon, 10 Jan 2022 07:53:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-24.pek2.redhat.com [10.72.8.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72BCB694D9;
	Mon, 10 Jan 2022 07:52:28 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>
Date: Mon, 10 Jan 2022 15:51:41 +0800
Message-Id: <20220110075141.389532-3-ming.lei@redhat.com>
In-Reply-To: <20220110075141.389532-1-ming.lei@redhat.com>
References: <20220110075141.389532-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, lining <lining2020x@163.com>,
	Tejun Heo <tj@kernel.org>, Chunguang Xu <brookxu@tencent.com>
Subject: [dm-devel] [PATCH 2/2] dm: use resubmit_bio_noacct to submit split
	bio
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

lining reported that blk-throttle iops limit doesn't work correctly
for dm-thin. Turns out it is same issue with the one addressed by commit
4f1e9630afe6 ("blk-throtl: optimize IOPS throttle for large IO scenarios").

So use the new added block layer API for addressing the same issue.

Reported-by: lining <lining2020x@163.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Chunguang Xu <brookxu@tencent.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/md/dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 280918cdcabd..8a58379e737c 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1562,7 +1562,7 @@ static void __split_and_process_bio(struct mapped_device *md,
 
 			bio_chain(b, bio);
 			trace_block_split(b, bio->bi_iter.bi_sector);
-			submit_bio_noacct(bio);
+			resubmit_bio_noacct(bio);
 		}
 	}
 
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

