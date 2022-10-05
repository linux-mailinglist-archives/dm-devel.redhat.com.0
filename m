Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1DE5F6175
	for <lists+dm-devel@lfdr.de>; Thu,  6 Oct 2022 09:13:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665040425;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oy0OQwDL7/ElFLNHypPn9PAn5xl+9LCXeiFaNtak3Jg=;
	b=WrItDzsY1C7EARYa4vsHr7ztGHc+SjM1U+NxLheJ4j4cZyF2Zem/D5WbtTLoHT/jhig2ie
	O0WVM/D7FV0JMqJCbhzSIvnAWDb3xnMDVmJisNYsn8nL0TLiIEV7cLWqDo/Ohr5fwQgHTO
	xk36XjmAz0byeIhTeaf6Vkb9apV6Yws=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-0iukITeKNHi_Hxcpg1XikA-1; Thu, 06 Oct 2022 03:13:42 -0400
X-MC-Unique: 0iukITeKNHi_Hxcpg1XikA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB6DF101A52A;
	Thu,  6 Oct 2022 07:13:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3580C15BA4;
	Thu,  6 Oct 2022 07:13:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E99DB1947B85;
	Thu,  6 Oct 2022 07:13:32 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 01E2F1946A4E
 for <dm-devel@listman.corp.redhat.com>; Wed,  5 Oct 2022 18:04:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9AEAFC04482; Wed,  5 Oct 2022 18:04:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93ABAC15BBD
 for <dm-devel@redhat.com>; Wed,  5 Oct 2022 18:04:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC1B73802BBE
 for <dm-devel@redhat.com>; Wed,  5 Oct 2022 18:04:00 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-568-kv5ug_ztNyi5XzOnL02ZcA-1; Wed, 05 Oct 2022 14:03:58 -0400
X-MC-Unique: kv5ug_ztNyi5XzOnL02ZcA-1
Received: by mail-pl1-f171.google.com with SMTP id l4so633812plb.8;
 Wed, 05 Oct 2022 11:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j+XlP7a4AbJnWW0mvkyBXtZwa/N1Rx2itITpw13S/3I=;
 b=LrBWttt2VDh0H/zeumzv7z4R2WlTLf+COaEXevPJ31ycynmX1BBmDbdrPnczpUIIbH
 wZiZ7Z90BsX54Ii8KXEWdVJ5CjrV86R4t6rxAxjlIfq9EIWGHQ8VArS4tWYl73hGlXiI
 8mb5WFa0kMh/7UJWfeGZe5R/OupiQ7sdkwtUYDJaB2My4pFX0RM3lWv0ZFg2nAjJs0Wp
 9kj9OayxMOwpnFHNZDcoTHj/CbnOyxMF4z8r9by80i51mQU5/Y54Y0qxoMAV4O069bqS
 ZQp416vkNkAYfiSH9A3n1slsyecQ3sy3PkH7Xu8WxImiTJaHP0NYqxEET1SFwjEgH8qx
 a4AQ==
X-Gm-Message-State: ACrzQf0kbRyahRISgtwBu7HAf28QlV6taa3+3dpQyRkyXkwabJOW9CIo
 0/bQWES4lNBbdBC7WtkYpyA=
X-Google-Smtp-Source: AMsMyM7R2vC6Qn5IEDHgIQVREy/czJWxFA0KW9eqPauuVPkuyU3SUmM3xBqqup3gi735DjAFHPyrow==
X-Received: by 2002:a17:90b:3e83:b0:20a:f3dd:3e2e with SMTP id
 rj3-20020a17090b3e8300b0020af3dd3e2emr3106527pjb.191.1664993037711; 
 Wed, 05 Oct 2022 11:03:57 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-241-145.hsd1.ca.comcast.net.
 [67.174.241.145]) by smtp.gmail.com with ESMTPSA id
 y17-20020a170903011100b001788494b764sm10674639plc.231.2022.10.05.11.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 11:03:56 -0700 (PDT)
From: Yang Shi <shy828301@gmail.com>
To: mgorman@techsingularity.net, agk@redhat.com, snitzer@kernel.org,
 dm-devel@redhat.com, akpm@linux-foundation.org
Date: Wed,  5 Oct 2022 11:03:40 -0700
Message-Id: <20221005180341.1738796-4-shy828301@gmail.com>
In-Reply-To: <20221005180341.1738796-1-shy828301@gmail.com>
References: <20221005180341.1738796-1-shy828301@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Thu, 06 Oct 2022 07:13:31 +0000
Subject: [dm-devel] [PATCH 3/4] md: dm-crypt: move crypt_free_buffer_pages
 ahead
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
Cc: linux-block@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With moving crypt_free_buffer_pages() before crypt_alloc_buffer(), we
don't need an extra declaration anymore.

Signed-off-by: Yang Shi <shy828301@gmail.com>
---
 drivers/md/dm-crypt.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 159c6806c19b..85ac1f9b37ae 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1639,7 +1639,16 @@ static blk_status_t crypt_convert(struct crypt_config *cc,
 	return 0;
 }
 
-static void crypt_free_buffer_pages(struct crypt_config *cc, struct bio *clone);
+static void crypt_free_buffer_pages(struct crypt_config *cc, struct bio *clone)
+{
+	struct bio_vec *bv;
+	struct bvec_iter_all iter_all;
+
+	bio_for_each_segment_all(bv, clone, iter_all) {
+		BUG_ON(!bv->bv_page);
+		mempool_free(bv->bv_page, &cc->page_pool);
+	}
+}
 
 /*
  * Generate a new unfragmented bio with the given size
@@ -1707,17 +1716,6 @@ static struct bio *crypt_alloc_buffer(struct dm_crypt_io *io, unsigned size)
 	return clone;
 }
 
-static void crypt_free_buffer_pages(struct crypt_config *cc, struct bio *clone)
-{
-	struct bio_vec *bv;
-	struct bvec_iter_all iter_all;
-
-	bio_for_each_segment_all(bv, clone, iter_all) {
-		BUG_ON(!bv->bv_page);
-		mempool_free(bv->bv_page, &cc->page_pool);
-	}
-}
-
 static void crypt_io_init(struct dm_crypt_io *io, struct crypt_config *cc,
 			  struct bio *bio, sector_t sector)
 {
-- 
2.26.3

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

