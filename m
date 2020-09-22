Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 680CF27389D
	for <lists+dm-devel@lfdr.de>; Tue, 22 Sep 2020 04:33:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600742019;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mre3SuWwiF2yalwiZD/XOjbrPAzbSP156QdAIHUi0t0=;
	b=NV3WAjkFzjBNUIFiuwuI7Hr6kSbNuT/SfCjOUKKesIbkCSm9D3+DCnPeyPi+0mqIaxI5B0
	lpDcHsRYXFoD0OvvKQuxGOlKMF0dnVCNo8JqUFg4+K6UY0CZmSD/nmfgH2CALiyoqM6vh9
	/QQyeTtmCLVgQDl8ODtgKlZMTtAnQ4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-GQEU7dSqNWKBpJVbnUaNzA-1; Mon, 21 Sep 2020 22:33:33 -0400
X-MC-Unique: GQEU7dSqNWKBpJVbnUaNzA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BCA29CC09;
	Tue, 22 Sep 2020 02:33:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67BC75577B;
	Tue, 22 Sep 2020 02:33:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2F691888B4F;
	Tue, 22 Sep 2020 02:33:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08M2XOuc017757 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 22:33:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA0D6202450E; Tue, 22 Sep 2020 02:33:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1363201E730
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 02:33:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 246B785828E
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 02:33:22 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-305-JWJNa2opOI66bbYFyUpb4Q-1; Mon, 21 Sep 2020 22:32:56 -0400
X-MC-Unique: JWJNa2opOI66bbYFyUpb4Q-1
Received: by mail-qk1-f194.google.com with SMTP id q5so17636504qkc.2;
	Mon, 21 Sep 2020 19:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=bWaXIov8TtAl/0XsAvHxYfnPFbq37XOvCLuYhpc0zL0=;
	b=eA0tQLgeJ89jlEQVpbLDYjYluVxbbjXreM8T+kO5sxl/rmgpG46RjY1O0+mcv2iuFg
	4k7s78GL/BJBYAGd9yvNFfiB824znuCFD+TozF+KY8XXzGnhIFwjtgXxREIa9kmfmBvt
	u0+5kIUuF8iDZaFeJWpoowiZ9s9MBvXl2gFMqgSzb5uJtL270Edij59zdxS2O/XYyYah
	+tYfYygQl8jKYWOTOGRiBv5+IZpzsVNHK1Rd9A1FMyXrrFxTSASaZ0OvB8pxs/hS+sKO
	KMcYnn2P2dVhcKM4KC+DfUug6GhUUfAwaN6A2vdQTvIMhEENYdlAJXDgey9iN4wXv3cD
	t4Xg==
X-Gm-Message-State: AOAM532zgM9P3NLNZPTCh/kP8b/S5SFdyw0mZAdy0bNvJDaKqFZBYFiA
	i1ZwsE3EJKgV0OW3+4M7MhHvJ007S46fMA==
X-Google-Smtp-Source: ABdhPJy6JO/cMS6eyzyES62A6ssN7ZfRrD419Tdfay1OexLN53AAgSYU1/Gv5s6SDuBxiWcxprI+gQ==
X-Received: by 2002:a37:c09:: with SMTP id 9mr2892321qkm.471.1600741976270;
	Mon, 21 Sep 2020 19:32:56 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	m6sm10685774qkh.106.2020.09.21.19.32.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Sep 2020 19:32:55 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 21 Sep 2020 22:32:47 -0400
Message-Id: <20200922023251.47712-3-snitzer@redhat.com>
In-Reply-To: <20200922023251.47712-1-snitzer@redhat.com>
References: <20200922023251.47712-1-snitzer@redhat.com>
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
Subject: [dm-devel] [PATCH v3 2/6] dm: fix comment in dm_process_bio()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Refer to the correct function (->submit_bio instead of ->queue_bio).
Also, add details about why using blk_queue_split() isn't needed for
dm_wq_work()'s call to dm_process_bio().

Fixes: c62b37d96b6eb ("block: move ->make_request_fn to struct block_device_operations")
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index d948cd522431..6ed05ca65a0f 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1744,9 +1744,11 @@ static blk_qc_t dm_process_bio(struct mapped_device *md,
 	}
 
 	/*
-	 * If in ->queue_bio we need to use blk_queue_split(), otherwise
+	 * If in ->submit_bio we need to use blk_queue_split(), otherwise
 	 * queue_limits for abnormal requests (e.g. discard, writesame, etc)
 	 * won't be imposed.
+	 * If called from dm_wq_work() for deferred bio processing, bio
+	 * was already handled by following code with previous ->submit_bio.
 	 */
 	if (current->bio_list) {
 		if (is_abnormal_io(bio))
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

