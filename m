Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7F819587F
	for <lists+dm-devel@lfdr.de>; Fri, 27 Mar 2020 15:05:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585317922;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r0Tq6EXS+ah/FVxdyzBgA27Xk4dBUaab0aiNZIo3dPg=;
	b=IQHkuZqANUVKEVuX3kxTduIwbatI5lMdR+kwGxWpUsrlrBqA4+iBXFHjCudHf3fqiypXF2
	5EHBT1G0mScppTZxoFZcTrsTeDt6Eywbj1KSZNdPFKGyUqQJl478rLX2j4IzYy8PPJAtsp
	t66CJq13CN/KMusiT9/pEE/ygAiVzZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-97ctvU77NIuOqNrFUm6_Xw-1; Fri, 27 Mar 2020 10:05:19 -0400
X-MC-Unique: 97ctvU77NIuOqNrFUm6_Xw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C994A801A02;
	Fri, 27 Mar 2020 14:05:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97F1F5DA7D;
	Fri, 27 Mar 2020 14:05:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EED8918089CD;
	Fri, 27 Mar 2020 14:05:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RE2mMZ007378 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 10:02:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1BE21006B14; Fri, 27 Mar 2020 14:02:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE02610073A5
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 14:02:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15E98101A55F
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 14:02:45 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-368-fRZ4F8gqNKuL10k6WioyDw-1; Fri, 27 Mar 2020 10:02:43 -0400
X-MC-Unique: fRZ4F8gqNKuL10k6WioyDw-1
Received: by mail-pg1-f194.google.com with SMTP id k5so2405446pga.2
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 07:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rW3ignUIeOl2OnTc6gMdisGesKp/nH9u+goPdHkYQgo=;
	b=RTxlFVDZPkCQ7XGX5FVXbX5+66HfLrpjpwHkBlwNOeMU8drfKeXJk7RorR5o7hnpXY
	fJ/5a0FT0ateClMmPtzeSsbH18PlWBZuM4Z2Ra0QYu6ztME9b/7SLxNoUJs+xPV7RCf9
	dflTgJ1y8GrmVdIH1GzH151LU6jEWUQUYDUUIliN6etGplcxAfnFaJq6/mTsOiIy4480
	pFvShrtV9mtIogdh2C1YAa5JZsP90bPQspzOZSqQYPZSym7mouDZ0YjrttUKnlaGFlW1
	oQReO+oIg8HnneJAy+E9yBjz1jn6X+e0lg8N0Aa2QJauJjbkgylUr0dZXh91yGks45Sd
	pI6Q==
X-Gm-Message-State: ANhLgQ21fFNaIAmJkvX6KuwBsk1Cw1ktlZZ22e6o8cB8FLiIFzkq9JAL
	t3UQypFPu5RCz28JKm5sFxqKaA==
X-Google-Smtp-Source: ADFU+vvF46UoCT2g7L8jezEAr5ZP+s0gICkQMIVugwgY9CYj3yw+MC6WF65e3cJpbugLkAu0dgl0ng==
X-Received: by 2002:a62:cdcc:: with SMTP id
	o195mr14883361pfg.323.1585317758488; 
	Fri, 27 Mar 2020 07:02:38 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id l5sm3963399pgt.10.2020.03.27.07.02.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Mar 2020 07:02:37 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com
Date: Fri, 27 Mar 2020 16:01:09 +0200
Message-Id: <20200327140111.7798-3-ntsironis@arrikto.com>
In-Reply-To: <20200327140111.7798-1-ntsironis@arrikto.com>
References: <20200327140111.7798-1-ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02RE2mMZ007378
X-loop: dm-devel@redhat.com
Cc: ntsironis@arrikto.com
Subject: [dm-devel] [PATCH 2/4] dm clone: Add overflow check for number of
	regions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add overflow check for clone->nr_regions variable, which holds the
number of regions of the target.

The overflow can occur with sufficiently large devices, if BITS_PER_LONG
== 32. E.g., if the region size is 8 sectors (4K), the overflow would
occur for device sizes > 34359738360 sectors (~16TB).

This could result in multiple device sectors wrongly mapping to the same
region number, due to the truncation from 64 bits to 32 bits, which
would lead to data corruption.

Fixes: 7431b7835f55 ("dm: add clone target")
Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-clone-target.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index 022dddcad647..6ee85fb3388a 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -1790,6 +1790,7 @@ static int copy_ctr_args(struct clone *clone, int argc, const char **argv, char
 static int clone_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 {
 	int r;
+	sector_t nr_regions;
 	struct clone *clone;
 	struct dm_arg_set as;
 
@@ -1831,7 +1832,16 @@ static int clone_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		goto out_with_source_dev;
 
 	clone->region_shift = __ffs(clone->region_size);
-	clone->nr_regions = dm_sector_div_up(ti->len, clone->region_size);
+	nr_regions = dm_sector_div_up(ti->len, clone->region_size);
+
+	/* Check for overflow */
+	if (nr_regions != (unsigned long)nr_regions) {
+		ti->error = "Too many regions. Consider increasing the region size";
+		r = -EOVERFLOW;
+		goto out_with_source_dev;
+	}
+
+	clone->nr_regions = nr_regions;
 
 	r = validate_nr_regions(clone->nr_regions, &ti->error);
 	if (r)
-- 
2.11.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

