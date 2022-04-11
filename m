Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4304FC37F
	for <lists+dm-devel@lfdr.de>; Mon, 11 Apr 2022 19:34:12 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-ZVjHfxLdPo28BEy1R5LgpQ-1; Mon, 11 Apr 2022 13:34:10 -0400
X-MC-Unique: ZVjHfxLdPo28BEy1R5LgpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ABB4833967;
	Mon, 11 Apr 2022 17:34:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6635440EC004;
	Mon, 11 Apr 2022 17:34:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5B6E3194036A;
	Mon, 11 Apr 2022 17:34:03 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D661619466DF
 for <dm-devel@listman.corp.redhat.com>; Mon, 11 Apr 2022 17:34:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C434740BB05; Mon, 11 Apr 2022 17:34:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C09D540BAE6
 for <dm-devel@redhat.com>; Mon, 11 Apr 2022 17:34:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A56A386B8A0
 for <dm-devel@redhat.com>; Mon, 11 Apr 2022 17:34:01 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-w0cpRzqzPZyMyvERoXsxzw-1; Mon, 11 Apr 2022 13:34:00 -0400
X-MC-Unique: w0cpRzqzPZyMyvERoXsxzw-1
Received: by mail-qv1-f44.google.com with SMTP id b17so13782064qvf.12
 for <dm-devel@redhat.com>; Mon, 11 Apr 2022 10:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WDwpjxnaXnMZ7L/oCeYRvVxrGJTCBqxpXVhzEXP2jxw=;
 b=egyJAzK5DUjFeA/ay4MjlwKtwO7+69qo5gloBnBuTL6fbS3kmBb9DW8DxNEsBnes73
 HykQunjs6cm6XDbho5bFtyHGhAQZvrt/075Wfwr62NNSRJUZMmk+kxyWxPwTSxYN5mEW
 C0cGcovlEzBA7fBGTkueiVNuDB13fd3IKerHnw1KND03NUIVu8Fi+jx9OpMMu0FU7IPD
 x0HbCiVN8M5qTR3I3n2bbDxlPvKZjtYKaFQWCWx3Nxd3u3KqW+YaPiNLGpbp6WrlAAE/
 Yei9CR95j91t7WxG7LRwODsQUw45rGpt6ASspVAbGe3w1Gz9sIHHOxeheMAby5aKmWWt
 N2EQ==
X-Gm-Message-State: AOAM533Re4LM8Ix5YFDahcWxm6QDlBWsAwWbb3ryGwbPimqOh2dOoGg+
 f0/AJUCaVoupV9HS0a8UcTBw+V0=
X-Google-Smtp-Source: ABdhPJzYSYJVHqSt6oh9OPhZ8i6wED3jCrcze23zl3ItN1H0Y8TdIYC5OdPbTvUi+Ft4gwKM5nxVyQ==
X-Received: by 2002:a05:6214:daa:b0:441:7161:de4b with SMTP id
 h10-20020a0562140daa00b004417161de4bmr27795121qvh.48.1649698439658; 
 Mon, 11 Apr 2022 10:33:59 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
 [68.160.176.52]) by smtp.gmail.com with ESMTPSA id
 z145-20020a376597000000b0069c0669327bsm4313551qkb.95.2022.04.11.10.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 10:33:59 -0700 (PDT)
Date: Mon, 11 Apr 2022 13:33:58 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: linux-block@vger.kernel.org
Message-ID: <YlRmhlL8TtQow0W0@redhat.com>
References: <YkSK6mU1fja2OykG@redhat.com> <YkRM7Iyp8m6A1BCl@fedora>
 <YkUwmyrIqnRGIOHm@infradead.org> <YkVBjUy9GeSMbh5Q@fedora>
 <YkVxLN9p0t6DI5ie@infradead.org> <YlBX+ytxxeSj2neQ@redhat.com>
 <YlEWfc39+H+esrQm@infradead.org> <YlReKjjWhvTZjfg/@redhat.com>
 <YlRiUVFK+a0DwQhu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YlRiUVFK+a0DwQhu@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [dm-devel] [PATCH] block: remove redundant blk-cgroup init from
 __bio_clone
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
Cc: Christoph Hellwig <hch@infradead.org>, Dennis Zhou <dennis@kernel.org>,
 tj@kernel.org, axboe@kernel.dk, dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When bio_{alloc,init}_clone are passed a bdev, bio_init() will call
bio_associate_blkg() so the __bio_clone() work to initialize blkcg
isn't needed.

Signed-off-by: Mike Snitzer <snitzer@kernel.org>
---
 block/bio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 7892f1108ca6..6980f1b4b0f4 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -778,9 +778,6 @@ static int __bio_clone(struct bio *bio, struct bio *bio_src, gfp_t gfp)
 	bio->bi_ioprio = bio_src->bi_ioprio;
 	bio->bi_iter = bio_src->bi_iter;
 
-	bio_clone_blkg_association(bio, bio_src);
-	blkcg_bio_issue_init(bio);
-
 	if (bio_crypt_clone(bio, bio_src, gfp) < 0)
 		return -ENOMEM;
 	if (bio_integrity(bio_src) &&
-- 
2.30.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

