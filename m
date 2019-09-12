Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 44228B0EB5
	for <lists+dm-devel@lfdr.de>; Thu, 12 Sep 2019 14:15:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DE6E898106;
	Thu, 12 Sep 2019 12:15:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F3BB5DA8D;
	Thu, 12 Sep 2019 12:15:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A9DA83545;
	Thu, 12 Sep 2019 12:15:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8CCC3WQ008005 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 08:12:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56D6860E3E; Thu, 12 Sep 2019 12:12:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E07460C83
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 12:11:57 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC02730A76A9
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 12:11:55 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c10so7201976wmc.0
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 05:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8o57uZtLJ0lBg9i/hCPCvjLiYR3dcx/Zw85X7D+ZP64=;
	b=J+3v+6DOrLENnftQW065daMYonbhHNCp541mvkwXLEq2ddinUFVMhgoN/OWFKUqxVb
	Rlxo3J9K8w1fgM33nh01QwNvCmEc1aHzEyUPAbE5yKPfVyy8AojY81m17gy2qbxo/ziR
	TqkxuXmBET9Idb54badWX5emRpOIglH1fLEGduf+s1ICwL2t44N+tZy0HEx6XZEhBTaL
	xCmCRiMcu139nEeQlaxw88TnbzTlRTjN4iDfnJ4u5Ow64EYldDf8hJm2bDFU+ipB9URe
	OgM5DkOfIj7uJCkRB6KGUEWdsZBORJpdwtkEx0NykAhsqGXbJD7G7/s3xyDA6yUt4uIb
	afvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8o57uZtLJ0lBg9i/hCPCvjLiYR3dcx/Zw85X7D+ZP64=;
	b=mUQeXMGtleWx4nzi5rlJdVVNUSxJ7BQ/1KFIzJ/7Z+QTkG+onfKEFrOr2qtHSLHZXf
	2dfzEBRvVVtUROd1POI5yTLqyGBbC/oQ8f+Y5wiJQ3kTOlWjC52qLkEPauedIw1GR9ex
	12erfyH6KpzbB+4maHO17+gehHiJUiQPJxI8cO5l2GxIQx30F8fDGMpkDdrlFbBf8q74
	2tFRC7pN5Ick2giyCTLvZNirw99bDBCcztLE/1p5lBRPQOixmQ3US4kge0vHuX266laq
	7oLEj3C6hsC+WM5dpIXirUsuZV3VYM8hb1dn78KBGy4LQh9d2pJ0sNxas2KQ0k20NZ28
	ds2A==
X-Gm-Message-State: APjAAAXbdpCQOwwDSjkf/Off2x4piLHPyAax/XIjpE33rfQ312Or9upE
	a6EKvje01V8XamlNYhvbL+DR+B8SgQI=
X-Google-Smtp-Source: APXvYqxhZ9HXKUDgEjplv1RjtVRYDf4qCbUX2ZNQCTXKOS5T7tSpHb32ze2/j1G4sM7WeXcH2RO3rQ==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr7794938wml.35.1568290314377; 
	Thu, 12 Sep 2019 05:11:54 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	v8sm38636526wra.79.2019.09.12.05.11.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Sep 2019 05:11:53 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Thu, 12 Sep 2019 15:11:36 +0300
Message-Id: <20190912121137.26567-2-ntsironis@arrikto.com>
In-Reply-To: <20190912121137.26567-1-ntsironis@arrikto.com>
References: <20190912121137.26567-1-ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 12 Sep 2019 12:11:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Thu, 12 Sep 2019 12:11:56 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, ntsironis@arrikto.com, iliastsi@arrikto.com
Subject: [dm-devel] [PATCH 1/2] dm clone metadata: Rename md to cmd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Thu, 12 Sep 2019 12:15:13 +0000 (UTC)

Rename md to cmd to be consistent with dm-clone-metadata.c

Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-clone-metadata.h | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/md/dm-clone-metadata.h b/drivers/md/dm-clone-metadata.h
index 7b8063ea70c3..434bff08508b 100644
--- a/drivers/md/dm-clone-metadata.h
+++ b/drivers/md/dm-clone-metadata.h
@@ -29,24 +29,24 @@ struct dm_clone_metadata;
 /*
  * Set region status to hydrated.
  *
- * @md: The dm-clone metadata
+ * @cmd: The dm-clone metadata
  * @region_nr: The region number
  *
  * This function doesn't block, so it's safe to call it from interrupt context.
  */
-int dm_clone_set_region_hydrated(struct dm_clone_metadata *md, unsigned long region_nr);
+int dm_clone_set_region_hydrated(struct dm_clone_metadata *cmd, unsigned long region_nr);
 
 /*
  * Set status of all regions in the provided range to hydrated, if not already
  * hydrated.
  *
- * @md: The dm-clone metadata
+ * @cmd: The dm-clone metadata
  * @start: Starting region number
  * @nr_regions: Number of regions in the range
  *
  * This function doesn't block, so it's safe to call it from interrupt context.
  */
-int dm_clone_cond_set_range(struct dm_clone_metadata *md, unsigned long start,
+int dm_clone_cond_set_range(struct dm_clone_metadata *cmd, unsigned long start,
 			    unsigned long nr_regions);
 
 /*
@@ -69,12 +69,12 @@ struct dm_clone_metadata *dm_clone_metadata_open(struct block_device *bdev,
 /*
  * Free the resources related to metadata management.
  */
-void dm_clone_metadata_close(struct dm_clone_metadata *md);
+void dm_clone_metadata_close(struct dm_clone_metadata *cmd);
 
 /*
  * Commit dm-clone metadata to disk.
  */
-int dm_clone_metadata_commit(struct dm_clone_metadata *md);
+int dm_clone_metadata_commit(struct dm_clone_metadata *cmd);
 
 /*
  * Reload the in core copy of the on-disk bitmap.
@@ -93,18 +93,18 @@ int dm_clone_metadata_commit(struct dm_clone_metadata *md);
  * dm_clone_set_region_hydrated() and dm_clone_cond_set_range() refuse to touch
  * the region bitmap, after calling dm_clone_metadata_set_read_only().
  */
-int dm_clone_reload_in_core_bitset(struct dm_clone_metadata *md);
+int dm_clone_reload_in_core_bitset(struct dm_clone_metadata *cmd);
 
 /*
  * Check whether dm-clone's metadata changed this transaction.
  */
-bool dm_clone_changed_this_transaction(struct dm_clone_metadata *md);
+bool dm_clone_changed_this_transaction(struct dm_clone_metadata *cmd);
 
 /*
  * Abort current metadata transaction and rollback metadata to the last
  * committed transaction.
  */
-int dm_clone_metadata_abort(struct dm_clone_metadata *md);
+int dm_clone_metadata_abort(struct dm_clone_metadata *cmd);
 
 /*
  * Switches metadata to a read only mode. Once read-only mode has been entered
@@ -115,44 +115,44 @@ int dm_clone_metadata_abort(struct dm_clone_metadata *md);
  *   dm_clone_cond_set_range()
  *   dm_clone_metadata_abort()
  */
-void dm_clone_metadata_set_read_only(struct dm_clone_metadata *md);
-void dm_clone_metadata_set_read_write(struct dm_clone_metadata *md);
+void dm_clone_metadata_set_read_only(struct dm_clone_metadata *cmd);
+void dm_clone_metadata_set_read_write(struct dm_clone_metadata *cmd);
 
 /*
  * Returns true if the hydration of the destination device is finished.
  */
-bool dm_clone_is_hydration_done(struct dm_clone_metadata *md);
+bool dm_clone_is_hydration_done(struct dm_clone_metadata *cmd);
 
 /*
  * Returns true if region @region_nr is hydrated.
  */
-bool dm_clone_is_region_hydrated(struct dm_clone_metadata *md, unsigned long region_nr);
+bool dm_clone_is_region_hydrated(struct dm_clone_metadata *cmd, unsigned long region_nr);
 
 /*
  * Returns true if all the regions in the range are hydrated.
  */
-bool dm_clone_is_range_hydrated(struct dm_clone_metadata *md,
+bool dm_clone_is_range_hydrated(struct dm_clone_metadata *cmd,
 				unsigned long start, unsigned long nr_regions);
 
 /*
  * Returns the number of hydrated regions.
  */
-unsigned long dm_clone_nr_of_hydrated_regions(struct dm_clone_metadata *md);
+unsigned long dm_clone_nr_of_hydrated_regions(struct dm_clone_metadata *cmd);
 
 /*
  * Returns the first unhydrated region with region_nr >= @start
  */
-unsigned long dm_clone_find_next_unhydrated_region(struct dm_clone_metadata *md,
+unsigned long dm_clone_find_next_unhydrated_region(struct dm_clone_metadata *cmd,
 						   unsigned long start);
 
 /*
  * Get the number of free metadata blocks.
  */
-int dm_clone_get_free_metadata_block_count(struct dm_clone_metadata *md, dm_block_t *result);
+int dm_clone_get_free_metadata_block_count(struct dm_clone_metadata *cmd, dm_block_t *result);
 
 /*
  * Get the total number of metadata blocks.
  */
-int dm_clone_get_metadata_dev_size(struct dm_clone_metadata *md, dm_block_t *result);
+int dm_clone_get_metadata_dev_size(struct dm_clone_metadata *cmd, dm_block_t *result);
 
 #endif /* DM_CLONE_METADATA_H */
-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
