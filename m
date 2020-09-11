Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C2003266A63
	for <lists+dm-devel@lfdr.de>; Fri, 11 Sep 2020 23:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599861304;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3c2tEYLR03kFzrQWAY1tES0XjtMpsb3AIcezL5RoMI4=;
	b=FLVl7hPSddNXZHtWOhKIA1ukQQXD+Rr8DZy6/0MrfXLPOJwTyneFPVyPwaCOa2v9qgbUQm
	ymMJWWU6ToP+xCBw2dksHunp2AKU/YCx6pxg48ML5SYBoHfJkanvU8kobigRrY5neYfOFF
	KqNI+k7nQtVkU5X+omcur9PWc+RmWD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-BPESpt2dMr-wKhkSlGtc2g-1; Fri, 11 Sep 2020 17:55:02 -0400
X-MC-Unique: BPESpt2dMr-wKhkSlGtc2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48D39100747B;
	Fri, 11 Sep 2020 21:54:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2859A60C04;
	Fri, 11 Sep 2020 21:54:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA0EF79DBA;
	Fri, 11 Sep 2020 21:54:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BLrn8E020432 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 17:53:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ABBF52141827; Fri, 11 Sep 2020 21:53:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A764B2141825
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 21:53:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEA5B80121C
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 21:53:46 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-571-7S8VvYTNN66tPvKMekFr9g-1; Fri, 11 Sep 2020 17:53:42 -0400
X-MC-Unique: 7S8VvYTNN66tPvKMekFr9g-1
Received: by mail-qt1-f193.google.com with SMTP id g3so9085762qtq.10;
	Fri, 11 Sep 2020 14:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=p0AgwegfJk6uZfD0nMSn2ocvdLTNtvY1TgQDTCc+R4g=;
	b=TLci1lha7E2eYQv0LFD6Eg80USf83b/xR1de79ewodQa/TsgxQ7bF7QFjqFlTXw2jV
	7wrYkSP3L6xaY72R0k1JwnXVKSNM8gvscaT3IanCUBZnHrwHeeHY8fchLfBTuG9U7ijk
	Y1eCMwz2/vQjL/YNyzMTuOOwEQKhyf8nwPNp217qHH1UI2g5bbmVhHNz7+AvCqV+5s7B
	RS6Fpu0r8Tc2bK0CAxtCAoduBuJBTnPQhZ1SBn89ZOnDVjNyZVN6QHzpCYFO8mdyMGNN
	GwPcKuusNP+gye2VA5LT4UdQ7z/YTsA7YB/EMY++Tm9Dqm9Ln52VhoUfdwTHjfU/itix
	OOyA==
X-Gm-Message-State: AOAM533Zcf9gQnGA+37MuIAC4v+dJ4RNlzMgu/P+ZeV1QFRhD/b2htLc
	VMsfs0EajSV6P1ACeap55Np2vaYW6JQ=
X-Google-Smtp-Source: ABdhPJxS62mFnmJmeEU6DtwZij4rhz+l6eaC1J9f8aEST+av5WDf61y6CcNxX10pGo483sQiSfl21w==
X-Received: by 2002:aed:2555:: with SMTP id w21mr4007348qtc.132.1599861221854; 
	Fri, 11 Sep 2020 14:53:41 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	g203sm4551960qkb.51.2020.09.11.14.53.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Sep 2020 14:53:41 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Date: Fri, 11 Sep 2020 17:53:36 -0400
Message-Id: <20200911215338.44805-2-snitzer@redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>
Subject: [dm-devel] [PATCH 1/3] block: fix blk_rq_get_max_sectors() to flow
	more carefully
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

blk_queue_get_max_sectors() has been trained for REQ_OP_WRITE_SAME and
REQ_OP_WRITE_ZEROES yet blk_rq_get_max_sectors() didn't call it for
those operations.

Also, there is no need to avoid blk_max_size_offset() if
'chunk_sectors' isn't set because it falls back to 'max_sectors'.

Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 include/linux/blkdev.h | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index bb5636cc17b9..453a3d735d66 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1070,17 +1070,24 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
 						  sector_t offset)
 {
 	struct request_queue *q = rq->q;
+	int op;
+	unsigned int max_sectors;
 
 	if (blk_rq_is_passthrough(rq))
 		return q->limits.max_hw_sectors;
 
-	if (!q->limits.chunk_sectors ||
-	    req_op(rq) == REQ_OP_DISCARD ||
-	    req_op(rq) == REQ_OP_SECURE_ERASE)
-		return blk_queue_get_max_sectors(q, req_op(rq));
+	op = req_op(rq);
+	max_sectors = blk_queue_get_max_sectors(q, op);
 
-	return min(blk_max_size_offset(q, offset),
-			blk_queue_get_max_sectors(q, req_op(rq)));
+	switch (op) {
+	case REQ_OP_DISCARD:
+	case REQ_OP_SECURE_ERASE:
+	case REQ_OP_WRITE_SAME:
+	case REQ_OP_WRITE_ZEROES:
+		return max_sectors;
+	}
+
+	return min(blk_max_size_offset(q, offset), max_sectors);
 }
 
 static inline unsigned int blk_rq_count_bios(struct request *rq)
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

