Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C34086872F3
	for <lists+dm-devel@lfdr.de>; Thu,  2 Feb 2023 02:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675301059;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DB6mudiOMvsoQg44WZB4z31+0sTS3tcci93fLuDBBVY=;
	b=AzfNdluZ+4FsvWVsEVjMfssVZCUFDxlR9zfVs90TYKu3A2RH4FWf7nUM3AvXsne36z98YA
	I1ClDHLcOo+vhqonpS6n7pDIi7OR/RAk+ttCN/BI2DyI2tesdSCyCUB7rxr9Ilmy3hdyud
	5/KpbdgtjbzFYftG3LMqHl1T/GA8NB8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-T3utx8sCP-qci23cmV2nRw-1; Wed, 01 Feb 2023 20:24:18 -0500
X-MC-Unique: T3utx8sCP-qci23cmV2nRw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59D7C29AA2CC;
	Thu,  2 Feb 2023 01:24:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83228404BEC0;
	Thu,  2 Feb 2023 01:24:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 66B2619465BA;
	Thu,  2 Feb 2023 01:24:08 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B3FF0194658F
 for <dm-devel@listman.corp.redhat.com>; Thu,  2 Feb 2023 01:24:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 969B6492B00; Thu,  2 Feb 2023 01:24:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F196492C3E
 for <dm-devel@redhat.com>; Thu,  2 Feb 2023 01:24:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 704C929AA3B6
 for <dm-devel@redhat.com>; Thu,  2 Feb 2023 01:24:06 +0000 (UTC)
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-1r6q9t_6NhaC1ot4XvI0LQ-1; Wed, 01 Feb 2023 20:24:04 -0500
X-MC-Unique: 1r6q9t_6NhaC1ot4XvI0LQ-1
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-4c8e781bc0aso5962377b3.22
 for <dm-devel@redhat.com>; Wed, 01 Feb 2023 17:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qi6CRUcIqoMhsE8Npcv6LrLCHd/yXBQ/syl5x+jj8cQ=;
 b=Le6dxl3WDTVmWK7IzuyoK5B+c0JhcrIahrIbqDNaRANsAvuA3FwwE8lwuDy4b0f4M1
 sqy+inOEqUUwrEwOzL4PsIGI0mQbnjYqHEvwbVsbmL71Ggkg//nkX72P4rV8Dq1fX8h9
 w/RtHRkJ0zB3dblK2ZthmXJPDafJq76SdXTkO3MzhFqQoVg9toh4B7S1UCE1UEBw7jPX
 78tmjU+n1p7MdayBtekz6lGcXL6aA3qMqMNjZDvLDGKrFEbHJW4J5KLUnnpK5q0kHlPJ
 EQqxVduENnifcNWiMfPw+SYu0UzU5d3J+pcBlBJLH7ZyXisDTUbz1IP1JE7C9oj28/Yl
 KpDA==
X-Gm-Message-State: AO0yUKUf0cyiqPQmHjKbvs4Xj/pU/LOYp64b/lHfzyaxuuiARoGTYp8z
 atfy8Znj9BuZRFWR517a+qsDag2Ahg==
X-Google-Smtp-Source: AK7set8RhiyeXAE+GXAwyzjDa8iVaPFqHfOlnWvgUjqh4AUtSCVY1X5GDAfnNtzuqKjOavRKMvxPYg8kKg==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a05:6902:1815:b0:855:fafc:7424
 with SMTP id
 cf21-20020a056902181500b00855fafc7424mr10ybb.11.1675301043864; Wed, 01 Feb
 2023 17:24:03 -0800 (PST)
Date: Wed,  1 Feb 2023 17:23:48 -0800
Mime-Version: 1.0
Message-ID: <20230202012348.885402-1-nhuck@google.com>
From: Nathan Huckleberry <nhuck@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [dm-devel] [PATCH] dm-verity: Remove WQ_UNBOUND.
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
Cc: Mike Snitzer <snitzer@kernel.org>, linux-kernel@vger.kernel.org,
 Nathan Huckleberry <nhuck@google.com>, Eric Biggers <ebiggers@kernel.org>,
 dm-devel@redhat.com, Sami Tolvanen <samitolvanen@google.com>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Setting WQ_UNBOUND increases scheduler latency on ARM64.  This is likely
due to the asymmetric architecture of ARM64 processors.

I've been unable to reproduce the results that claim WQ_UNBOUND gives a
performance boost on x86-64.

This flag is causing performance issues for multiple subsystems within
Android.  Notably, the same slowdown exists for decompression with
EROFS.

| open-prebuilt-camera  | WQ_UNBOUND | ~WQ_UNBOUND   |
|-----------------------|------------|---------------|
| verity wait time (us) | 11746      | 119 (-98%)    |
| erofs wait time (us)  | 357805     | 174205 (-51%) |

| sha256 ramdisk random read | WQ_UNBOUND    | ~WQ_UNBOUND |
|----------------------------|-----------=---|-------------|
| arm64 (accelerated)        | bw=42.4MiB/s  | bw=212MiB/s |
| arm64 (generic)            | bw=16.5MiB/s  | bw=48MiB/s  |
| x86_64 (generic)           | bw=233MiB/s   | bw=230MiB/s |

Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/md/dm-verity-target.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index ccf5b852fbf7..020fd2341025 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -1399,8 +1399,8 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 		goto bad;
 	}
 
-	/* WQ_UNBOUND greatly improves performance when running on ramdisk */
-	wq_flags = WQ_MEM_RECLAIM | WQ_UNBOUND;
+	wq_flags = WQ_MEM_RECLAIM;
+
 	/*
 	 * Using WQ_HIGHPRI improves throughput and completion latency by
 	 * reducing wait times when reading from a dm-verity device.
-- 
2.39.1.456.gfc5497dd1b-goog

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

