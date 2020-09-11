Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DD708266A62
	for <lists+dm-devel@lfdr.de>; Fri, 11 Sep 2020 23:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599861302;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zaGQkLFrvV1fAW9eUwXEAdXed/z/nVhVd2bV9g7hMr8=;
	b=Rqm5nr31xgy3Y9/anqEH8f2G7W91O+X4t80FwA8g/MIfKTQIAKxuuHmeIP/uqHDiww9EM6
	5pJFDa9giWeOnX9es0X5JUlAuQX96jeGDZNUf57z1ldOLG+OuOmtpWIv52H01tHitd3ymA
	qtxhMKYhRG7GFTgM30lCa/vDzdoVHEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-vZFIo83iMJmNQbRy-Gpong-1; Fri, 11 Sep 2020 17:54:59 -0400
X-MC-Unique: vZFIo83iMJmNQbRy-Gpong-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF4461007388;
	Fri, 11 Sep 2020 21:54:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67C7081C46;
	Fri, 11 Sep 2020 21:54:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF0C8181A06B;
	Fri, 11 Sep 2020 21:54:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BLrnXP020433 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 17:53:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ABB122141826; Fri, 11 Sep 2020 21:53:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6B142141824
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 21:53:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41402858282
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 21:53:48 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-75-zDSc6ENZM3mjJwm6ptDOPQ-1; Fri, 11 Sep 2020 17:53:44 -0400
X-MC-Unique: zDSc6ENZM3mjJwm6ptDOPQ-1
Received: by mail-qk1-f196.google.com with SMTP id o16so11354868qkj.10;
	Fri, 11 Sep 2020 14:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=3JOgHWrldpIIP/5kC09ZNfXwFYBRhpOv4PWXdWSWudc=;
	b=niJlmKZLlivy36nA5Kd5q5cVCLBD/oeRg2DhR1/PsQv8MoUNx5L39E6tyF9imLnKay
	4RaB0RWCgVrRtUXD7oUkfbaHicPpW2UV+7DPqu8s/tDWOB/VuOfxs08Vu11WY+ACZsc0
	V0jNTVcickCEvEEOpCPwkRG530fk0PD0TyovrpZRgnyd+dOT18c15Vx/cnkUdEC9Fr6g
	y1x7u0RRdn4/fwssqzAFNuYOv1Dx3FQfQJoIvST4geiN7eVcGb44iyyL9fc7LpMb33VJ
	8Q50q96QnNDtJvpIppcW/mHZDGyhn62VEdqT5CqLA/bBB8/Q9miwuQEyFXH9c14D1Vat
	lZnA==
X-Gm-Message-State: AOAM533l6bkgmNAIiO5fW+IBMBsFWH0iXgXoSl2xLhxaHsXHImWVJcBH
	DAEh6/w+iWh8xy/yiVbR26yUdyqEj50=
X-Google-Smtp-Source: ABdhPJx7MKEr+LuZWIHg7NFl50A/Y56dMJDfL7XBuz9M7ApQj9c84lidLRLcRoK2btAIhIspKOVKJg==
X-Received: by 2002:a37:6301:: with SMTP id x1mr3361585qkb.323.1599861223287; 
	Fri, 11 Sep 2020 14:53:43 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	g12sm4043625qke.90.2020.09.11.14.53.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Sep 2020 14:53:42 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Date: Fri, 11 Sep 2020 17:53:37 -0400
Message-Id: <20200911215338.44805-3-snitzer@redhat.com>
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
Subject: [dm-devel] [PATCH 2/3] block: use lcm_not_zero() when stacking
	chunk_sectors
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Like 'io_opt', blk_stack_limits() should stack 'chunk_sectors' using
lcm_not_zero() rather than min_not_zero() -- otherwise the final
'chunk_sectors' could result in sub-optimal alignment of IO to
component devices in the IO stack.

Also, if 'chunk_sectors' isn't a multiple of 'physical_block_size'
then it is a bug in the driver and the device should be flagged as
'misaligned'.

Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 block/blk-settings.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 76a7e03bcd6c..b09642d5f15e 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -534,6 +534,7 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 
 	t->io_min = max(t->io_min, b->io_min);
 	t->io_opt = lcm_not_zero(t->io_opt, b->io_opt);
+	t->chunk_sectors = lcm_not_zero(t->chunk_sectors, b->chunk_sectors);
 
 	/* Physical block size a multiple of the logical block size? */
 	if (t->physical_block_size & (t->logical_block_size - 1)) {
@@ -556,6 +557,13 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 		ret = -1;
 	}
 
+	/* chunk_sectors a multiple of the physical block size? */
+	if (t->chunk_sectors & (t->physical_block_size - 1)) {
+		t->chunk_sectors = 0;
+		t->misaligned = 1;
+		ret = -1;
+	}
+
 	t->raid_partial_stripes_expensive =
 		max(t->raid_partial_stripes_expensive,
 		    b->raid_partial_stripes_expensive);
@@ -594,10 +602,6 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 			t->discard_granularity;
 	}
 
-	if (b->chunk_sectors)
-		t->chunk_sectors = min_not_zero(t->chunk_sectors,
-						b->chunk_sectors);
-
 	t->zoned = max(t->zoned, b->zoned);
 	return ret;
 }
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

