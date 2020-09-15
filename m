Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BD82526AA78
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 19:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600190673;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J0+ul44p5YhR9+e72QmAqe6pM+yKbyaxEW+jGryepwA=;
	b=dnFcGflaAa38igyaiF4E0Zvx+cAFcqzLXiRhxBwNphB98dhW94bJyejXkUEAJvedRSzGLk
	6IBeXwHW0z5ex1MGrJk+Hz+D7JujwqRCMBOwQVb1DTXlD6i1DgfQdXP0E798UfkW3cNENh
	jkkBYDHfO6ehMVH37+BEte/fIZ/dmRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-UxsnPAybNQGZfxKEEaM-Gg-1; Tue, 15 Sep 2020 13:24:30 -0400
X-MC-Unique: UxsnPAybNQGZfxKEEaM-Gg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF02281CB02;
	Tue, 15 Sep 2020 17:24:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83F9F78801;
	Tue, 15 Sep 2020 17:24:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C16A344A56;
	Tue, 15 Sep 2020 17:24:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FHOAKJ003159 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 13:24:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25F452028CCE; Tue, 15 Sep 2020 17:24:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2078A2024508
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 17:24:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B53C18AE953
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 17:24:08 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-505-dGRcVo93MvOVwFQ0nchU5g-1; Tue, 15 Sep 2020 13:24:00 -0400
X-MC-Unique: dGRcVo93MvOVwFQ0nchU5g-1
Received: by mail-qk1-f195.google.com with SMTP id w16so5046232qkj.7;
	Tue, 15 Sep 2020 10:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=Kx5MVQ6xbvL7SHYiOkls0hYmmDYxo6c0riPFgM+lrnY=;
	b=bNpiX433UEtqGSDNygk5k/Xh4qPqOEn/f4nwRlH97+BuKl0vx9r1n3m5F9fDXN1xrX
	aKH6mOY67vUkJALLM59Jy4mv0spprH3BsOl0cR+8Vl6JfqNTbZ3+Cf15RH4Wy7Eea2Fn
	XqH50KElb34s3EIWE26Yiyn58RKhFsLeeCMostiyzDBH9w54hlHeO2DqBU4eRMTb2+V9
	foBpHoTPq3yraDnahmgH5CiwwwdSYafS4LjNbCllD+stMWv1HCE4AYYR4hdg/Of14cjh
	CrlKnzEikOclUOIZmpGpW+rNRVuI6Yuje1oJ8YKabmgS3ZZpQ2zsjdKklGPUSLnjh24Y
	wgrw==
X-Gm-Message-State: AOAM532vf23rXsgviD2SpYFuB7g2kKdTlpAFq6oLCxYIW7Pf6TwDaXDR
	irF4Su0OpDSDOjy1dTHEsE3XbrEnzcY=
X-Google-Smtp-Source: ABdhPJzKaUpJoi0KDI4Qkd/096qDGqB8xHMUklj32DH+7MIkhoQilpcZPSpn/qOUshcAtyBcNDuOPw==
X-Received: by 2002:a05:620a:13f6:: with SMTP id
	h22mr19848092qkl.9.1600190640218; 
	Tue, 15 Sep 2020 10:24:00 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	g18sm16371219qtu.69.2020.09.15.10.23.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Sep 2020 10:23:59 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 15 Sep 2020 13:23:54 -0400
Message-Id: <20200915172357.83215-2-snitzer@redhat.com>
In-Reply-To: <20200915172357.83215-1-snitzer@redhat.com>
References: <20200915172357.83215-1-snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v2 1/4] block: use lcm_not_zero() when stacking
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-settings.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 76a7e03bcd6c..b2e1a929a6db 100644
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
+	if ((t->chunk_sectors << 9) & (t->physical_block_size - 1)) {
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

