Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 15574112D36
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 15:07:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575468455;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c4f1kxGNaqNH4SLpCsDxfJkMjSGoeIijyAdZtI4+BSw=;
	b=QrfxXg2cewPTcWwzhNj6lagUyuVFREWFF2PDgGzNd1NMlbGRQgGDn45WRWeqg4wIpMNXvH
	P9WttiOHhHtAg8Z0wpw3iUqs97m5BGijz2h2kacmxUU4BxDWfcRoSN5AvdAdddOetk7fGu
	5KgdZ0K4kOeX7mqgKi7b3agGidcegLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-54fKtEXDNdW78PVC4hZ0ow-1; Wed, 04 Dec 2019 09:07:33 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3763802B81;
	Wed,  4 Dec 2019 14:07:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93B8A19C69;
	Wed,  4 Dec 2019 14:07:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41D1818089C8;
	Wed,  4 Dec 2019 14:07:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4E7BT1006878 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 09:07:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2649A2026D67; Wed,  4 Dec 2019 14:07:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 214FE2026D68
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 14:07:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6426185B0B1
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 14:07:08 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-383-aFYrLxDuOG-yHCknbcToRQ-1; Wed, 04 Dec 2019 09:07:04 -0500
Received: by mail-lj1-f195.google.com with SMTP id e10so8260108ljj.6
	for <dm-devel@redhat.com>; Wed, 04 Dec 2019 06:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2RpnrFCFR6N50EhDrGlni6CocyYnr33aVI9CHVRmkT0=;
	b=TxEr3yvMemHCbPAJvULoTaBWjGT2V0mpSZi2G2MjOPBlQIShlyK4WTytEsZ2vpPsCs
	+Ou6Ji9Lq1BOcrMcmNKyPXO7ghqH8jJc46JxD647hQFq9dlSHxtWZh8PDE+OFw5y/S5+
	Swgwu9lp7yllizMFDCkdPZgGsTrUyukO4cm2/fsfTMXXvwPj8/qYT25/UrvwMUBCiW8A
	Be6EHasJ3bmyrvCvcr7pxUgZmBfy/Sd096AZubhvJhCUWVNVWVHOwzrtNaiw+DZ5TX0u
	PVgMp6WGL3J1AZwwdhFW8oEuAFk1OSvy4TSUsNnSkckWgaDVX0ktUg2ymUUXbfGoCwAz
	sR6w==
X-Gm-Message-State: APjAAAUAAeYUOEyeyIraehLum3UCzBSkFSUzHTVK+zfh3i5iWIFuKDG6
	RxV0yQ/K/RqbMSsd7LFbQGVJ+w==
X-Google-Smtp-Source: APXvYqwwra2W3KLdl8GmJZAwG6qbUHEkG2TsLgNiLkcuZGuSFk9q3fJO0MRXuAM2R2KlEaUIV0YR9w==
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr1859978ljj.85.1575468423110; 
	Wed, 04 Dec 2019 06:07:03 -0800 (PST)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	i19sm3335533ljj.24.2019.12.04.06.07.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2019 06:07:02 -0800 (PST)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Wed,  4 Dec 2019 16:06:53 +0200
Message-Id: <20191204140654.26214-3-ntsironis@arrikto.com>
In-Reply-To: <20191204140654.26214-1-ntsironis@arrikto.com>
References: <20191204140654.26214-1-ntsironis@arrikto.com>
X-MC-Unique: aFYrLxDuOG-yHCknbcToRQ-1
X-MC-Unique: 54fKtEXDNdW78PVC4hZ0ow-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB4E7BT1006878
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, ntsironis@arrikto.com, iliastsi@arrikto.com
Subject: [dm-devel] [PATCH 2/3] dm clone metadata: Use a two phase commit
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Split the metadata commit in two parts:

1. dm_clone_metadata_pre_commit(): Prepare the current transaction for
   committing. After this is called, all subsequent metadata updates,
   done through either dm_clone_set_region_hydrated() or
   dm_clone_cond_set_range(), will be part of the next transaction.

2. dm_clone_metadata_commit(): Actually commit the current transaction
   to disk and start a new transaction.

This is required by the following commit. It allows dm-clone to flush
the destination device after step (1) to ensure that all freshly
hydrated regions, for which we are updating the metadata, are properly
written to non-volatile storage and won't be lost in case of a crash.

Fixes: 7431b7835f55 ("dm: add clone target")
Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-clone-metadata.c | 46 +++++++++++++++++++++++++++++++++---------
 drivers/md/dm-clone-metadata.h | 17 ++++++++++++++++
 drivers/md/dm-clone-target.c   |  7 ++++++-
 3 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/md/dm-clone-metadata.c b/drivers/md/dm-clone-metadata.c
index ee870a425ab8..c05b12110456 100644
--- a/drivers/md/dm-clone-metadata.c
+++ b/drivers/md/dm-clone-metadata.c
@@ -127,6 +127,9 @@ struct dm_clone_metadata {
 	struct dirty_map dmap[2];
 	struct dirty_map *current_dmap;
 
+	/* Protected by lock */
+	struct dirty_map *committing_dmap;
+
 	/*
 	 * In core copy of the on-disk bitmap to save constantly doing look ups
 	 * on disk.
@@ -511,6 +514,7 @@ static int dirty_map_init(struct dm_clone_metadata *cmd)
 	}
 
 	cmd->current_dmap = &cmd->dmap[0];
+	cmd->committing_dmap = NULL;
 
 	return 0;
 }
@@ -775,15 +779,17 @@ static int __flush_dmap(struct dm_clone_metadata *cmd, struct dirty_map *dmap)
 	return 0;
 }
 
-int dm_clone_metadata_commit(struct dm_clone_metadata *cmd)
+int dm_clone_metadata_pre_commit(struct dm_clone_metadata *cmd)
 {
-	int r = -EPERM;
+	int r = 0;
 	struct dirty_map *dmap, *next_dmap;
 
 	down_write(&cmd->lock);
 
-	if (cmd->fail_io || dm_bm_is_read_only(cmd->bm))
+	if (cmd->fail_io || dm_bm_is_read_only(cmd->bm)) {
+		r = -EPERM;
 		goto out;
+	}
 
 	/* Get current dirty bitmap */
 	dmap = cmd->current_dmap;
@@ -795,7 +801,7 @@ int dm_clone_metadata_commit(struct dm_clone_metadata *cmd)
 	 * The last commit failed, so we don't have a clean dirty-bitmap to
 	 * use.
 	 */
-	if (WARN_ON(next_dmap->changed)) {
+	if (WARN_ON(next_dmap->changed || cmd->committing_dmap)) {
 		r = -EINVAL;
 		goto out;
 	}
@@ -805,11 +811,33 @@ int dm_clone_metadata_commit(struct dm_clone_metadata *cmd)
 	cmd->current_dmap = next_dmap;
 	spin_unlock_irq(&cmd->bitmap_lock);
 
-	/*
-	 * No one is accessing the old dirty bitmap anymore, so we can flush
-	 * it.
-	 */
-	r = __flush_dmap(cmd, dmap);
+	/* Set old dirty bitmap as currently committing */
+	cmd->committing_dmap = dmap;
+out:
+	up_write(&cmd->lock);
+
+	return r;
+}
+
+int dm_clone_metadata_commit(struct dm_clone_metadata *cmd)
+{
+	int r = -EPERM;
+
+	down_write(&cmd->lock);
+
+	if (cmd->fail_io || dm_bm_is_read_only(cmd->bm))
+		goto out;
+
+	if (WARN_ON(!cmd->committing_dmap)) {
+		r = -EINVAL;
+		goto out;
+	}
+
+	r = __flush_dmap(cmd, cmd->committing_dmap);
+	if (!r) {
+		/* Clear committing dmap */
+		cmd->committing_dmap = NULL;
+	}
 out:
 	up_write(&cmd->lock);
 
diff --git a/drivers/md/dm-clone-metadata.h b/drivers/md/dm-clone-metadata.h
index 3fe50a781c11..14af1ebd853f 100644
--- a/drivers/md/dm-clone-metadata.h
+++ b/drivers/md/dm-clone-metadata.h
@@ -75,7 +75,23 @@ void dm_clone_metadata_close(struct dm_clone_metadata *cmd);
 
 /*
  * Commit dm-clone metadata to disk.
+ *
+ * We use a two phase commit:
+ *
+ * 1. dm_clone_metadata_pre_commit(): Prepare the current transaction for
+ *    committing. After this is called, all subsequent metadata updates, done
+ *    through either dm_clone_set_region_hydrated() or
+ *    dm_clone_cond_set_range(), will be part of the **next** transaction.
+ *
+ * 2. dm_clone_metadata_commit(): Actually commit the current transaction to
+ *    disk and start a new transaction.
+ *
+ * This allows dm-clone to flush the destination device after step (1) to
+ * ensure that all freshly hydrated regions, for which we are updating the
+ * metadata, are properly written to non-volatile storage and won't be lost in
+ * case of a crash.
  */
+int dm_clone_metadata_pre_commit(struct dm_clone_metadata *cmd);
 int dm_clone_metadata_commit(struct dm_clone_metadata *cmd);
 
 /*
@@ -112,6 +128,7 @@ int dm_clone_metadata_abort(struct dm_clone_metadata *cmd);
  * Switches metadata to a read only mode. Once read-only mode has been entered
  * the following functions will return -EPERM:
  *
+ *   dm_clone_metadata_pre_commit()
  *   dm_clone_metadata_commit()
  *   dm_clone_set_region_hydrated()
  *   dm_clone_cond_set_range()
diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index b3d89072d21c..613c913c296c 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -1122,8 +1122,13 @@ static int commit_metadata(struct clone *clone)
 		goto out;
 	}
 
-	r = dm_clone_metadata_commit(clone->cmd);
+	r = dm_clone_metadata_pre_commit(clone->cmd);
+	if (unlikely(r)) {
+		__metadata_operation_failed(clone, "dm_clone_metadata_pre_commit", r);
+		goto out;
+	}
 
+	r = dm_clone_metadata_commit(clone->cmd);
 	if (unlikely(r)) {
 		__metadata_operation_failed(clone, "dm_clone_metadata_commit", r);
 		goto out;
-- 
2.11.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

