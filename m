Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 529D5195882
	for <lists+dm-devel@lfdr.de>; Fri, 27 Mar 2020 15:05:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585317925;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZJ3h39xT9xHRh7rK/GqVFKzJU1XV2gpRfiaAB8LBknc=;
	b=emhpmQmz3Vh8dL8w16dU6uR3RyVZk3a4MdYBE7VkeyHxWBEPHtwp6inxphCjFkmgrm2JdQ
	3b0bRQAoT9a7y+LfOy09gqJNt4MrSk0Buu4Ep2rdAGlTWTbHA5c0l3nrHfW5AB1NTFnrjG
	PARdTVfmxMQsGt5og7W1gx30oeC1fEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-rl3HOWmmNkyEj_T-0PFjKw-1; Fri, 27 Mar 2020 10:05:23 -0400
X-MC-Unique: rl3HOWmmNkyEj_T-0PFjKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61596DBBA;
	Fri, 27 Mar 2020 14:05:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D12DE4DA2A;
	Fri, 27 Mar 2020 14:05:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F03A8A056;
	Fri, 27 Mar 2020 14:05:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RE2qGv007394 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 10:02:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E457A2166B2D; Fri, 27 Mar 2020 14:02:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E07182166B2C
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 14:02:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5AE68F7850
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 14:02:51 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-54-KOr7VC66MtmjuzfouVuRNQ-1; Fri, 27 Mar 2020 10:02:49 -0400
X-MC-Unique: KOr7VC66MtmjuzfouVuRNQ-1
Received: by mail-pf1-f195.google.com with SMTP id 23so4563643pfj.1
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 07:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0m7ChndtR/eINjBLLkxaAY+V07LwwtZJQ4kPgtgER5o=;
	b=M0p6nphFKDROmHytWYKb6uKPs4oLrC5jilPh6amrVvCWHr1wPIavLI17e8+VnxNSlN
	DzyV6eR3tmU5af2APigR4xdgAfkAxzDy1uLrPOBgZahuY7Sx3j3bycIkb/Gx0CfZySxm
	2ozVHrAtFEVZuDYOsGUFHiCmfVVGSt+QBReQWHu9SHTGg7Nk+Gy1rVddfjYdeLov7rx5
	oZIwQJ1xcT15GR1Bg8GMnpXqFijVbnS+D+4tL/BqD4TDATSAduhh3UIr5TxUbNWRE7a3
	wmxiGIaCiuwMcE7jch4xk03SEpe1FCmrG+AZv6MuO2to68ZkB1TefCacZxybCoVGdmsh
	vMrA==
X-Gm-Message-State: ANhLgQ3fK/DDfrTp/WoGW/9LLMm8G68GI5UunrAcempQzFuGmM051Sk6
	XWACyZpO5WgMNqSnEOL6gbKU+Q==
X-Google-Smtp-Source: ADFU+vumPBnDmuhJ4RaYTscuoCw+QpxIgO8n9S3BBJjZNvahgAablPUwiOgh5MFib+vx1PKNQ+5x5g==
X-Received: by 2002:a63:e141:: with SMTP id h1mr13615045pgk.129.1585317767022; 
	Fri, 27 Mar 2020 07:02:47 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id l5sm3963399pgt.10.2020.03.27.07.02.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Mar 2020 07:02:46 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com
Date: Fri, 27 Mar 2020 16:01:11 +0200
Message-Id: <20200327140111.7798-5-ntsironis@arrikto.com>
In-Reply-To: <20200327140111.7798-1-ntsironis@arrikto.com>
References: <20200327140111.7798-1-ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02RE2qGv007394
X-loop: dm-devel@redhat.com
Cc: ntsironis@arrikto.com
Subject: [dm-devel] [PATCH 4/4] dm clone metadata: Fix return type of
	dm_clone_nr_of_hydrated_regions()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm_clone_nr_of_hydrated_regions() returns the number of regions that
have been hydrated so far. In order to do so it employs bitmap_weight().

Until now, the return type of dm_clone_nr_of_hydrated_regions() was
unsigned long.

Because bitmap_weight() returns an int, in case BITS_PER_LONG == 64 and
the return value of bitmap_weight() is 2^31 (the maximum allowed number
of regions for a device), the result is sign extended from 32 bits to 64
bits and an incorrect value is displayed, in the status output of
dm-clone, as the number of hydrated regions.

Fix this by having dm_clone_nr_of_hydrated_regions() return an unsigned
int.

Fixes: 7431b7835f55 ("dm: add clone target")
Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-clone-metadata.c | 2 +-
 drivers/md/dm-clone-metadata.h | 2 +-
 drivers/md/dm-clone-target.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-clone-metadata.c b/drivers/md/dm-clone-metadata.c
index 199e7af00858..17712456fa63 100644
--- a/drivers/md/dm-clone-metadata.c
+++ b/drivers/md/dm-clone-metadata.c
@@ -656,7 +656,7 @@ bool dm_clone_is_range_hydrated(struct dm_clone_metadata *cmd,
 	return (bit >= (start + nr_regions));
 }
 
-unsigned long dm_clone_nr_of_hydrated_regions(struct dm_clone_metadata *cmd)
+unsigned int dm_clone_nr_of_hydrated_regions(struct dm_clone_metadata *cmd)
 {
 	return bitmap_weight(cmd->region_map, cmd->nr_regions);
 }
diff --git a/drivers/md/dm-clone-metadata.h b/drivers/md/dm-clone-metadata.h
index 14af1ebd853f..d848b8799c07 100644
--- a/drivers/md/dm-clone-metadata.h
+++ b/drivers/md/dm-clone-metadata.h
@@ -156,7 +156,7 @@ bool dm_clone_is_range_hydrated(struct dm_clone_metadata *cmd,
 /*
  * Returns the number of hydrated regions.
  */
-unsigned long dm_clone_nr_of_hydrated_regions(struct dm_clone_metadata *cmd);
+unsigned int dm_clone_nr_of_hydrated_regions(struct dm_clone_metadata *cmd);
 
 /*
  * Returns the first unhydrated region with region_nr >= @start
diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index ca5020c58f7c..5ce96ddf1ce1 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -1473,7 +1473,7 @@ static void clone_status(struct dm_target *ti, status_type_t type,
 			goto error;
 		}
 
-		DMEMIT("%u %llu/%llu %llu %lu/%lu %u ",
+		DMEMIT("%u %llu/%llu %llu %u/%lu %u ",
 		       DM_CLONE_METADATA_BLOCK_SIZE,
 		       (unsigned long long)(nr_metadata_blocks - nr_free_metadata_blocks),
 		       (unsigned long long)nr_metadata_blocks,
-- 
2.11.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

