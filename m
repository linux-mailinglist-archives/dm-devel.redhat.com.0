Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD5C6E8AC6
	for <lists+dm-devel@lfdr.de>; Thu, 20 Apr 2023 08:58:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681973882;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2D3PSV1qfEUdSFFqm87NE/fCs98qXzZK1xfz2RFtPEI=;
	b=EOpOPPX6x//syyCj+8KN3GfTupo5qvv5IBNWJCxX6qgveCeQDW17ETy3XAzyTyZsP7fPQH
	k3MsjY432FdX29balolbE5q4ZBbeAgvwkV0rK/L1B65TZflGRf78syMAT3UuDBl/JG76y0
	DL7R6UiNF17WUsHkjeT3SIk9gxlwW9I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-XWvxB91MPGK3ZeKXovCYLw-1; Thu, 20 Apr 2023 02:57:19 -0400
X-MC-Unique: XWvxB91MPGK3ZeKXovCYLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BF881C08DA5;
	Thu, 20 Apr 2023 06:57:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7EF36C1603B;
	Thu, 20 Apr 2023 06:57:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4779B1946A5A;
	Thu, 20 Apr 2023 06:57:09 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CE21519465A0
 for <dm-devel@listman.corp.redhat.com>; Wed, 19 Apr 2023 14:10:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A294440C2064; Wed, 19 Apr 2023 14:10:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AB4A40C201F
 for <dm-devel@redhat.com>; Wed, 19 Apr 2023 14:10:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62839101A551
 for <dm-devel@redhat.com>; Wed, 19 Apr 2023 14:10:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-EwQE2SfkNbiLZ3mjbSPoVg-1; Wed, 19 Apr 2023 10:10:47 -0400
X-MC-Unique: EwQE2SfkNbiLZ3mjbSPoVg-1
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-3f16b99b936so20277535e9.3; 
 Wed, 19 Apr 2023 07:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681913445; x=1684505445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tjFYGcD8nQN9rifaEDTZAqJ2yu2mzhO8AAh5DrpkTqw=;
 b=CoNFo65lIPubr37voK8q6WmzBYyMzefw2AEQok8AoWjcgDsi45tQQeU5wooUEqju40
 ajH71sBixihHiBCk2UgsaNOP/oRW+bbH1MPUGwNQ9Ve2aQOY83MGIOEwD4buEGybzGc7
 FNuRdbR3okI+CAafYKcm7X/E9L3lsEEqrBwRQ66ZsaxKsSX6TObU9yKesQqpD0V4z93X
 qcLKani4cls521kYd76zeX0gb/GoZI7HUc8TGhUPwlnvuM2yf1S6qLN5B83bWosRHP+z
 vSbIcq8fr1JUf4JpNwz4A/RKQHogWwbaeetQ3omL0kYPWDPOZO//ccBiKLXBTEvCSavh
 bBiw==
X-Gm-Message-State: AAQBX9ctTC8TO3jz/DaKhULSW/UAq0wlY4iE5VGAn1TggR26TjYgjPB4
 AgT0vsHjLKghvziCxtETYmI=
X-Google-Smtp-Source: AKy350aGGEQ7SWmnov97mBi05fDjNbcA0jBUqTYCskx4hlxP5WN71pxTOnLMeDvsnGyrkEzM33OnpA==
X-Received: by 2002:adf:fdd1:0:b0:2ef:c0cf:c72b with SMTP id
 i17-20020adffdd1000000b002efc0cfc72bmr5153952wrs.29.1681913445555; 
 Wed, 19 Apr 2023 07:10:45 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-204.dynamic.mnet-online.de. [62.216.205.204])
 by smtp.googlemail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm7612089wrv.58.2023.04.19.07.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:10:44 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: axboe@kernel.dk
Date: Wed, 19 Apr 2023 16:09:21 +0200
Message-Id: <20230419140929.5924-12-jth@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Thu, 20 Apr 2023 06:57:04 +0000
Subject: [dm-devel] [PATCH v3 11/19] gfs: use __bio_add_page for adding
 single page to bio
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Johannes Thumshirn <johannes.thumshirn@wdc.com>

The GFS superblock reading code uses bio_add_page() to add a page to a
newly created bio. bio_add_page() can fail, but the return value is never
checked.

Use __bio_add_page() as adding a single page to a newly created bio is
guaranteed to succeed.

This brings us a step closer to marking bio_add_page() as __must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 fs/gfs2/ops_fstype.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 6de901c3b89b..e0cd0d43b12f 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -254,7 +254,7 @@ static int gfs2_read_super(struct gfs2_sbd *sdp, sector_t sector, int silent)
 
 	bio = bio_alloc(sb->s_bdev, 1, REQ_OP_READ | REQ_META, GFP_NOFS);
 	bio->bi_iter.bi_sector = sector * (sb->s_blocksize >> 9);
-	bio_add_page(bio, page, PAGE_SIZE, 0);
+	__bio_add_page(bio, page, PAGE_SIZE, 0);
 
 	bio->bi_end_io = end_bio_io_page;
 	bio->bi_private = page;
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

