Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C21FD4E595C
	for <lists+dm-devel@lfdr.de>; Wed, 23 Mar 2022 20:46:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648064767;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bGVOfQxPLAj6faJTL8ZT1uWsS1Z+Oja+0y9i0fdjZuY=;
	b=hx77hhHYXPhsFAAF8Vii8LQN5OikaHB2lq6cl3wMQStMtSxM2NQRGMNcHuSN1TG6U6z+Aw
	ED2HZ8urhXeKnftVIETWZ74shgRRFZBEP1XM6IYy/658201jqyQEO94siBSpcxT+ZCIKsy
	ausxNSqEYVcRFaa7m0pE410ioxlbn10=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-78SzNDM5NFSgthmNcFRPog-1; Wed, 23 Mar 2022 15:45:38 -0400
X-MC-Unique: 78SzNDM5NFSgthmNcFRPog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77EA03C163E7;
	Wed, 23 Mar 2022 19:45:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B08281400E70;
	Wed, 23 Mar 2022 19:45:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C3B211940359;
	Wed, 23 Mar 2022 19:45:29 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 62E611949763
 for <dm-devel@listman.corp.redhat.com>; Wed, 23 Mar 2022 19:45:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 536AFC27D99; Wed, 23 Mar 2022 19:45:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FB03C27D86
 for <dm-devel@redhat.com>; Wed, 23 Mar 2022 19:45:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34D2C185A79C
 for <dm-devel@redhat.com>; Wed, 23 Mar 2022 19:45:28 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-TphXfXMkOEedxd-vP4RzhQ-1; Wed, 23 Mar 2022 15:45:26 -0400
X-MC-Unique: TphXfXMkOEedxd-vP4RzhQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 207-20020a3706d8000000b0067b322bef9eso1697870qkg.3
 for <dm-devel@redhat.com>; Wed, 23 Mar 2022 12:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=lSw1myUul/JfBJxzMKk7S5towi4LjKVp/1Za72ezB54=;
 b=T0XF+Lj6yyb1vaAOeB/BR3rcTSVTuNNkreOWXpYvbBGAxyIF0VdQlxZDcRAXYifnJB
 tEbXjysA5R7hQsaTM51rDJMnE3AjU/W5QY0t2DSr8fn64/KlVmxoWH3J5BnKIBwyHPKb
 yd4wYSKwX8zRjk+OxOLVTUGyIJkM7d2Gx4k47EaDaLxCEN+IZzh/DNGvEr14hbUCis24
 ESKXLDP9PicgnPo3nWc9O2sgrKI7WXUkpQDlw4jzIMlSMkF9QleE9Rer2qZ8ApkHxeym
 83E7+RpUI2+kYW68UqZ/r0+3qEPSsSSM64zyqNeo8svs59A2HPy3uxuudjk169Qd3jqE
 VXVQ==
X-Gm-Message-State: AOAM532HkHtZLy14fm09+ZzhX0swgIW9Ks4ssadUc2ufQb8U0OJ9eyrg
 nhDB2VD2slS9NMREMiy/nFL9GNREDAJBnW4OfOm3DmWc+jWGMIslFW5Hw9Z0fuVJTZPlNJ1u5A9
 +h/3V83CSV41egQ==
X-Received: by 2002:a05:620a:4442:b0:67d:b94a:8c6a with SMTP id
 w2-20020a05620a444200b0067db94a8c6amr1061908qkp.569.1648064725984; 
 Wed, 23 Mar 2022 12:45:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx47UcAziqxaHCmQSZ1SIf9p3IFNqdEceNYCt1DNIo6G+Q2WNX/DpF1yfSQSseo4kE6sbUbPQ==
X-Received: by 2002:a05:620a:4442:b0:67d:b94a:8c6a with SMTP id
 w2-20020a05620a444200b0067db94a8c6amr1061900qkp.569.1648064725765; 
 Wed, 23 Mar 2022 12:45:25 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
 [68.160.176.52]) by smtp.gmail.com with ESMTPSA id
 r11-20020ae9d60b000000b0067e5308d664sm545584qkk.92.2022.03.23.12.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 12:45:25 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
X-Google-Original-From: Mike Snitzer <snitzer@kernel.org>
To: axboe@kernel.dk
Date: Wed, 23 Mar 2022 15:45:20 -0400
Message-Id: <20220323194524.5900-1-snitzer@kernel.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [dm-devel] [PATCH v2 0/4] block/dm: use BIOSET_PERCPU_CACHE from
 bio_alloc_bioset
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
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com, hch@lst.de,
 ming.lei@redhat.com
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jens,

I ran with your suggestion and DM now sees a ~7% improvement in hipri
bio polling with io_uring (using dm-linear on null_blk, IOPS went from
900K to 966K).

Christoph,

I tried to address your review of the previous set. Patch 1 and 2 can
obviously be folded but I left them split out for review purposes.
Feel free to see if these changes are meaningful for nvme's use.
Happy for either you to take on iterating on these block changes
further or you letting me know what changes you'd like made.

Thanks,
Mike

v2: add REQ_ALLOC_CACHE and move use of bio_alloc_percpu_cache to
    bio_alloc_bioset

Mike Snitzer (4):
  block: allow BIOSET_PERCPU_CACHE use from bio_alloc_clone
  block: allow BIOSET_PERCPU_CACHE use from bio_alloc_bioset
  dm: enable BIOSET_PERCPU_CACHE for dm_io bioset
  dm: conditionally enable BIOSET_PERCPU_CACHE for bio-based dm_io bioset

 block/bio.c               | 67 +++++++++++++++++++++++++++++++----------------
 block/blk.h               |  7 -----
 drivers/md/dm-table.c     | 11 +++++---
 drivers/md/dm.c           | 10 +++----
 drivers/md/dm.h           |  4 +--
 include/linux/bio.h       |  9 +++++++
 include/linux/blk_types.h |  4 ++-
 7 files changed, 71 insertions(+), 41 deletions(-)

-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

