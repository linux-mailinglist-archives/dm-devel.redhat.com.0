Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5326E8AB2
	for <lists+dm-devel@lfdr.de>; Thu, 20 Apr 2023 08:57:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681973842;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=os1hbude9J0T+iHrqHE24VyZe+Tu9d/zGaEoSXtAddc=;
	b=cOLaMtWeWr/hVHt7b0Gj2SzEAYvQ1zj3V6A8AUQH10jyf+7vKZSBl785b+Sptc/GPsH7K9
	DYk6Ff6vJHkq8I87BKalzsUkuOiYAV4okkS0X8NEmz65AnizW22OHGZLWx2Wcc9EYujSzv
	5m+05Op3Y57brRpR6n9ton4vTWjfFT8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-AKlweDVRMxeXgWFvk6EUHQ-1; Thu, 20 Apr 2023 02:57:19 -0400
X-MC-Unique: AKlweDVRMxeXgWFvk6EUHQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 102061C0897C;
	Thu, 20 Apr 2023 06:57:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6D9940BC79D;
	Thu, 20 Apr 2023 06:57:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 497AC19472C4;
	Thu, 20 Apr 2023 06:57:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4FA4319465A0
 for <dm-devel@listman.corp.redhat.com>; Wed, 19 Apr 2023 14:11:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3534C4020BF0; Wed, 19 Apr 2023 14:11:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D1244020BEE
 for <dm-devel@redhat.com>; Wed, 19 Apr 2023 14:11:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10FC4884343
 for <dm-devel@redhat.com>; Wed, 19 Apr 2023 14:11:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-kNBuI6VvOdKNRGWS0NdxGg-1; Wed, 19 Apr 2023 10:10:55 -0400
X-MC-Unique: kNBuI6VvOdKNRGWS0NdxGg-1
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-2f4214b430aso2104060f8f.0; 
 Wed, 19 Apr 2023 07:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681913453; x=1684505453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u8TpFiJZXriCSIuX4H6qm/DmnDRMN3dAYFyNsYcZw7Y=;
 b=hbnuk549EyXP8tNoWBZBq9eNjvlzhUEu5XCHwzhS0KGSOf00sV0e1briFBdv8392EE
 O/tUnTwcwKoav8m95e01R/vUORXbUDp3X26uxAe7P9sX3XfvqT5ILYWVC1EPcW8g1KZ4
 Er7oVeUDwHctTPRgj95b/pncwj6TvGm91ESRJeDCdLvTf0YzLnL7MGN3BZTdXOQ2g0zD
 mWLtGrTjqIh5I8xNrJnRwILam1Zm/dJ8sD/PFkKi7Mbc8IXoMUVqzqiFijuwEu/fHKZY
 0Er0nNprPpEPopvrUuZABYpRPG+LBsQZuGrcfNBonsC/S4zD29RlgjA+9bggGSlAS1Dj
 a9cQ==
X-Gm-Message-State: AAQBX9eLjUt5aPKzq4EbRku6knhlsuAMr8WPf7XeVu+zbTTlvWNSvq9F
 PO/W2JqaPPI5TI+mt8TCloc=
X-Google-Smtp-Source: AKy350YTktz+btoYf/lfmIpjxtv9Fic8XsjroznIk6ubZ5/gLPCuphxcjC60RHARQGdGgdBUYUfVfA==
X-Received: by 2002:adf:e58a:0:b0:2ef:1c8c:1113 with SMTP id
 l10-20020adfe58a000000b002ef1c8c1113mr5538098wrm.9.1681913453067; 
 Wed, 19 Apr 2023 07:10:53 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-204.dynamic.mnet-online.de. [62.216.205.204])
 by smtp.googlemail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm7612089wrv.58.2023.04.19.07.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:10:52 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: axboe@kernel.dk
Date: Wed, 19 Apr 2023 16:09:25 +0200
Message-Id: <20230419140929.5924-16-jth@kernel.org>
In-Reply-To: <20230419140929.5924-1-jth@kernel.org>
References: <20230419140929.5924-1-jth@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Thu, 20 Apr 2023 06:57:04 +0000
Subject: [dm-devel] [PATCH v3 15/19] md: check for failure when adding pages
 in alloc_behind_master_bio
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, linux-mm@kvack.org,
 dm-devel@redhat.com, hch@lst.de, agruenba@redhat.com,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, willy@infradead.org,
 cluster-devel@redhat.com, kch@nvidia.com, snitzer@kernel.org,
 ming.lei@redhat.com, linux-block@vger.kernel.org, rpeterso@redhat.com,
 dsterba@suse.com, linux-raid@vger.kernel.org, damien.lemoal@wdc.com,
 song@kernel.org, johannes.thumshirn@wdc.com, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Johannes Thumshirn <johannes.thumshirn@wdc.com>

alloc_behind_master_bio() can possibly add multiple pages to a bio, but it
is not checking for the return value of bio_add_page() if adding really
succeeded.

Check if the page adding succeeded and if not bail out.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/md/raid1.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 68a9e2d9985b..8283ef177f6c 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -1147,7 +1147,10 @@ static void alloc_behind_master_bio(struct r1bio *r1_bio,
 		if (unlikely(!page))
 			goto free_pages;
 
-		bio_add_page(behind_bio, page, len, 0);
+		if (!bio_add_page(behind_bio, page, len, 0)) {
+			free_page(page);
+			goto free_pages;
+		}
 
 		size -= len;
 		i++;
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

