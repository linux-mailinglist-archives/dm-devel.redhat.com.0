Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD3F300747
	for <lists+dm-devel@lfdr.de>; Fri, 22 Jan 2021 16:30:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-J5K8s0gcOLe-JtHKznG24g-1; Fri, 22 Jan 2021 10:30:13 -0500
X-MC-Unique: J5K8s0gcOLe-JtHKznG24g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ED87107ACE6;
	Fri, 22 Jan 2021 15:30:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 793F460C66;
	Fri, 22 Jan 2021 15:30:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 27E5F4BB7B;
	Fri, 22 Jan 2021 15:30:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MFQ9kt028585 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 10:26:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BC43AEE84E; Fri, 22 Jan 2021 15:26:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3CB5EE847
	for <dm-devel@redhat.com>; Fri, 22 Jan 2021 15:26:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C8DD101A564
	for <dm-devel@redhat.com>; Fri, 22 Jan 2021 15:26:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-247-dUf_8jAfM7Gwg0elE4IJPQ-1; Fri, 22 Jan 2021 10:26:03 -0500
X-MC-Unique: dUf_8jAfM7Gwg0elE4IJPQ-1
Received: by mail-wm1-f50.google.com with SMTP id o10so6880766wmc.1
	for <dm-devel@redhat.com>; Fri, 22 Jan 2021 07:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=d2K/uftEBOdNh1oU3xJTqBSBYuXel+NGzXuIYHjfeSw=;
	b=B8RvEr+578dEPQGl9E/eHFlt4kAI3IQN7ATE/dzPZwPVY10gNf9K4a69swqhmJHp9y
	Bfp6HaWlbTH3aGXmHvv2OE99FqtX72puQaqSHVIXQMtxVXwNf2UbC8VkmH2CE1Ip4iTu
	3FNoDA19rFjOEr1UQQTbTAuB4Zq5INqfLt003Wj6B6h7reqZ/36G22LLByfy1nvxuwlJ
	03wiT+mIciVp/TLiMXizHbADaoTkTF7YQq/hCOmyP2lGFhtVwRsYF5iWavAHNr6hl/RP
	+PGeht3ev5CQezQLlxrSW574MC1EE6DRBlO1iIYpTuEgc1E+AfvhSlaGv/quI96/aknI
	COBw==
X-Gm-Message-State: AOAM533QjmmzDR7bbVlcPoTpDsmYGifbES1MswfKRlKjTBohgElxjdQA
	BN11Uq9759smj24AMPSR+lxHJw==
X-Google-Smtp-Source: ABdhPJwgdEiFuXsGFLtcyRd7rXwNT2D48qv4ZDbzRZwGyWTZ83whwjPJv8yCjHfxmTT7NXw4Qt8KRQ==
X-Received: by 2002:a1c:7413:: with SMTP id p19mr4359391wmc.39.1611329162836; 
	Fri, 22 Jan 2021 07:26:02 -0800 (PST)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	r1sm12685159wrl.95.2021.01.22.07.26.01
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jan 2021 07:26:01 -0800 (PST)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Fri, 22 Jan 2021 17:25:54 +0200
Message-Id: <20210122152556.24822-3-ntsironis@arrikto.com>
In-Reply-To: <20210122152556.24822-1-ntsironis@arrikto.com>
References: <20210122152556.24822-1-ntsironis@arrikto.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: ejt@redhat.com, ntsironis@arrikto.com
Subject: [dm-devel] [PATCH 2/4] dm era: Fix bitset memory leaks
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Deallocate the memory allocated for the in-core bitsets when destroying
the target and in error paths.

Fixes: eec40579d84873 ("dm: add era target")
Cc: stable@vger.kernel.org # v3.15+
Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-era-target.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/md/dm-era-target.c b/drivers/md/dm-era-target.c
index 52e3f63335d3..ffbbd8740253 100644
--- a/drivers/md/dm-era-target.c
+++ b/drivers/md/dm-era-target.c
@@ -47,6 +47,7 @@ struct writeset {
 static void writeset_free(struct writeset *ws)
 {
 	vfree(ws->bits);
+	ws->bits = NULL;
 }
 
 static int setup_on_disk_bitset(struct dm_disk_bitset *info,
@@ -810,6 +811,8 @@ static struct era_metadata *metadata_open(struct block_device *bdev,
 
 static void metadata_close(struct era_metadata *md)
 {
+	writeset_free(&md->writesets[0]);
+	writeset_free(&md->writesets[1]);
 	destroy_persistent_data_objects(md);
 	kfree(md);
 }
@@ -847,6 +850,7 @@ static int metadata_resize(struct era_metadata *md, void *arg)
 	r = writeset_alloc(&md->writesets[1], *new_size);
 	if (r) {
 		DMERR("%s: writeset_alloc failed for writeset 1", __func__);
+		writeset_free(&md->writesets[0]);
 		return r;
 	}
 
@@ -857,6 +861,8 @@ static int metadata_resize(struct era_metadata *md, void *arg)
 			    &value, &md->era_array_root);
 	if (r) {
 		DMERR("%s: dm_array_resize failed", __func__);
+		writeset_free(&md->writesets[0]);
+		writeset_free(&md->writesets[1]);
 		return r;
 	}
 
-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

