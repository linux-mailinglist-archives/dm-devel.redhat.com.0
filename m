Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 53BE3273896
	for <lists+dm-devel@lfdr.de>; Tue, 22 Sep 2020 04:33:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600742006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+pIpm2jqjFSlPMOzwCpeHiXysWkQfY1eKnOttkqRF/k=;
	b=CMFui7/7WA3nm/lczvayypkCd6HE8D7CYcExSO5tkjTG+W2M62D00WVJp+1eLEVYvLiTCB
	y1L/OboJinJqbHP7QpDE5wgj3LxRaNozj2mfVdZD+Wv3Y8NpzRvNvDYLGOMtjhjh1xtPrZ
	9yX9+pn85zoehpqAZO+k5R8uOsJ55os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-DovRgHGdPY-w-gmS9sHxkQ-1; Mon, 21 Sep 2020 22:33:23 -0400
X-MC-Unique: DovRgHGdPY-w-gmS9sHxkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E7DC9CC0E;
	Tue, 22 Sep 2020 02:33:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0814760BFA;
	Tue, 22 Sep 2020 02:33:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 635BA8C7D1;
	Tue, 22 Sep 2020 02:33:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08M2X4NC017695 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 22:33:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AFC4A2157F23; Tue, 22 Sep 2020 02:33:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAA242166B28
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 02:33:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E9D68007D9
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 02:33:04 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-126-8AVSRNuIPNuC2bjkxJqW5A-1; Mon, 21 Sep 2020 22:33:02 -0400
X-MC-Unique: 8AVSRNuIPNuC2bjkxJqW5A-1
Received: by mail-qv1-f65.google.com with SMTP id j10so8705041qvk.11;
	Mon, 21 Sep 2020 19:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=NtWlq/47WlrxDfVxu0B44CPpyCD9vao2Nu3MMDC0MmU=;
	b=r6gJhv7Zxz+9hlZVqW3D9BRT2mnUs9qPf9uoEdvaoPF1ybKDHzmSGAp4+NT+yJuCA4
	bvwMXZK/ZIMC0KF2v183Z9YVVZ30ao7pC79mgJJtL7P8C3bHkexdzdiDLHclpyy7U86f
	bizPikSlJ7u2bfigqrdOh1yTgw2jJVey62lV9YIiyfovWfKJfXbf7yJBxG0sgh3KSjG1
	JigdRdGTC0KNOM+Znnn4kpVbJQp8q2Ac87wel3GGLQhRxWAEOCIkhsj1hD96Lb0anR3a
	fao1thUgMxpr+dr9xAAO0ZPc1cU8xHwQ8vKDXzqZ0r/NT8wbQltJEGzusnU5IFTO1xwx
	F3vQ==
X-Gm-Message-State: AOAM530DT9FjUYunk5sZPvvD3/n2yua8DrOJ+dwYPlOts/iAlDkZkjhq
	oWF9IW337nK64n7VVKQdRVM=
X-Google-Smtp-Source: ABdhPJwstwVK6opMvdpCo+BnKDX6pHoZtowyEX6H2tPqAhqWRAaCcm28GxGYEq4JsEtXWaht8CgOYw==
X-Received: by 2002:a0c:d443:: with SMTP id r3mr3613860qvh.20.1600741981873;
	Mon, 21 Sep 2020 19:33:01 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	m10sm11779149qti.46.2020.09.21.19.33.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Sep 2020 19:33:01 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 21 Sep 2020 22:32:51 -0400
Message-Id: <20200922023251.47712-7-snitzer@redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v3 6/6] dm: change max_io_len() to use
	blk_max_size_offset()
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

Using blk_max_size_offset() enables DM core's splitting to impose
ti->max_io_len (via q->limits.chunk_sectors) and also fallback to
respecting q->limits.max_sectors if chunk_sectors isn't set.

Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 6ed05ca65a0f..3982012b1309 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1051,22 +1051,18 @@ static sector_t max_io_len_target_boundary(sector_t sector, struct dm_target *ti
 static sector_t max_io_len(sector_t sector, struct dm_target *ti)
 {
 	sector_t len = max_io_len_target_boundary(sector, ti);
-	sector_t offset, max_len;
+	sector_t max_len;
 
 	/*
 	 * Does the target need to split even further?
+	 * - q->limits.chunk_sectors reflects ti->max_io_len so
+	 *   blk_max_size_offset() provides required splitting.
+	 * - blk_max_size_offset() also respects q->limits.max_sectors
 	 */
-	if (ti->max_io_len) {
-		offset = dm_target_offset(ti, sector);
-		if (unlikely(ti->max_io_len & (ti->max_io_len - 1)))
-			max_len = sector_div(offset, ti->max_io_len);
-		else
-			max_len = offset & (ti->max_io_len - 1);
-		max_len = ti->max_io_len - max_len;
-
-		if (len > max_len)
-			len = max_len;
-	}
+	max_len = blk_max_size_offset(dm_table_get_md(ti->table)->queue,
+				      dm_target_offset(ti, sector));
+	if (len > max_len)
+		len = max_len;
 
 	return len;
 }
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

