Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 35BD922B1B4
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jul 2020 16:44:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595515469;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ck31SAbi9w6E4tk4LXMxGKwGsQU29EFEWYjVOdkCyX0=;
	b=U8IqdWhr27C+yFMNTJuzw4DKWvpFx+HcfyHIoD2Uk15JgvPyl5adpD5MQzz6pCBign2btk
	xjP+7tZN/7cxQRnOJzIrCKMwa8dBgrTNGgkX3oXlZBb7ka6g4oVSUiZSaNmeOe/j2kraxJ
	Jtu7jmAotfWHCdQKjh8NkOVr5Z1Q2ZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-ucH1KL67MLGld7mMnjv0IQ-1; Thu, 23 Jul 2020 10:44:26 -0400
X-MC-Unique: ucH1KL67MLGld7mMnjv0IQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C1E5106B273;
	Thu, 23 Jul 2020 14:44:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D98CB5DE4B;
	Thu, 23 Jul 2020 14:44:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DACD41809554;
	Thu, 23 Jul 2020 14:43:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06NEgFAQ008136 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jul 2020 10:42:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF3115C1BD; Thu, 23 Jul 2020 14:42:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD8B85FC3B;
	Thu, 23 Jul 2020 14:42:10 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 06NEg9HT019272; Thu, 23 Jul 2020 10:42:09 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 06NEg9v7019268; Thu, 23 Jul 2020 10:42:09 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 23 Jul 2020 10:42:09 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <alpine.LRH.2.02.2007221601140.16826@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2007231036570.17947@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2007221444390.6426@file01.intranet.prod.int.rdu2.redhat.com>
	<20200722194536.GA28682@redhat.com>
	<alpine.LRH.2.02.2007221601140.16826@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Marian Csontos <mcsontos@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: [dm-devel] [PATCH v2] dm-integrity: revert adc0daad366b to fix
	recalculation
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 22 Jul 2020, Mikulas Patocka wrote:

> 
> 
> On Wed, 22 Jul 2020, Mike Snitzer wrote:
> 
> > On Wed, Jul 22 2020 at  2:46pm -0400,
> > Mikulas Patocka <mpatocka@redhat.com> wrote:
> > 
> > > Hi Mike
> > > 
> > > Please submit this to Linus and to RHEL-8.
> > > 
> > > Mikulas
> > > 
> > > 
> > > 
> > > From: Mikulas Patocka <mpatocka@redhat.com>
> > > 
> > > The patch adc0daad366b62ca1bce3e2958a40b0b71a8b8b3 broke recalculation on
> > > dm-integrity. The patch replaces a private variable "suspending" with a
> > > call to "dm_suspended".
> > > 
> > > The problem is that dm_suspended returns true not only during suspend, but
> > > also during resume. This race condition could occur:
> > > 1. dm_integrity_resume calls queue_work(ic->recalc_wq, &ic->recalc_work)
> > > 2. integrity_recalc (&ic->recalc_work) preempts the current thread
> > > 3. integrity_recalc calls if (unlikely(dm_suspended(ic->ti))) goto unlock_ret;
> > > 4. integrity_recalc exits and no recalculating is done.
> > > 
> > > In order to fix this race condition, we stop using dm_suspended and start
> > > using the variable "suspending" (that is only set during suspend, not
> > > during resume).
> > > 
> > > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > > Fixes: adc0daad366b ("dm: report suspended device during destroy")
> > > Cc: stable@vger.kernel.org	# v4.18+
> > 
> > OK, but why not add a dm_suspending() to DM core?  Could be other
> > future targets would like this same info right?  I don't see harm in
> > elevating it.
> > 
> > Mike
> 
> Yes - it may be possible to add this.
> 
> Mikulas

From: Mikulas Patocka <mpatocka@redhat.com>

The patch adc0daad366b62ca1bce3e2958a40b0b71a8b8b3 broke recalculation on
dm-integrity. The patch replaces a private variable "suspending" with a
call to "dm_suspended".

The problem is that dm_suspended returns true not only during suspend, but
also during resume. This race condition could occur:
1. dm_integrity_resume calls queue_work(ic->recalc_wq, &ic->recalc_work)
2. integrity_recalc (&ic->recalc_work) preempts the current thread
3. integrity_recalc calls if (unlikely(dm_suspended(ic->ti))) goto unlock_ret;
4. integrity_recalc exits and no recalculating is done.

In order to fix this race condition, we add a function dm_suspending that
is only true during the postsuspend phase and use it instead of
dm_suspended.

Signed-off-by: Mikulas Patocka <mpatocka redhat com>
Fixes: adc0daad366b ("dm: report suspended device during destroy")
Cc: stable vger kernel org      # v4.18+

Index: rhel8/drivers/md/dm.c
===================================================================
--- rhel8.orig/drivers/md/dm.c
+++ rhel8/drivers/md/dm.c
@@ -140,6 +140,7 @@ EXPORT_SYMBOL_GPL(dm_bio_get_target_bio_
 #define DMF_NOFLUSH_SUSPENDING 5
 #define DMF_DEFERRED_REMOVE 6
 #define DMF_SUSPENDED_INTERNALLY 7
+#define DMF_SUSPENDING 8
 
 #define DM_NUMA_NODE NUMA_NO_NODE
 static int dm_numa_node = DM_NUMA_NODE;
@@ -2379,6 +2380,7 @@ static void __dm_destroy(struct mapped_d
 	if (!dm_suspended_md(md)) {
 		dm_table_presuspend_targets(map);
 		set_bit(DMF_SUSPENDED, &md->flags);
+		set_bit(DMF_SUSPENDING, &md->flags);
 		dm_table_postsuspend_targets(map);
 	}
 	/* dm_put_live_table must be before msleep, otherwise deadlock is possible */
@@ -2701,7 +2703,9 @@ retry:
 	if (r)
 		goto out_unlock;
 
+	set_bit(DMF_SUSPENDING, &md->flags);
 	dm_table_postsuspend_targets(map);
+	clear_bit(DMF_SUSPENDING, &md->flags);
 
 out_unlock:
 	mutex_unlock(&md->suspend_lock);
@@ -2798,7 +2802,9 @@ static void __dm_internal_suspend(struct
 	(void) __dm_suspend(md, map, suspend_flags, TASK_UNINTERRUPTIBLE,
 			    DMF_SUSPENDED_INTERNALLY);
 
+	set_bit(DMF_SUSPENDING, &md->flags);
 	dm_table_postsuspend_targets(map);
+	clear_bit(DMF_SUSPENDING, &md->flags);
 }
 
 static void __dm_internal_resume(struct mapped_device *md)
@@ -2951,6 +2957,11 @@ int dm_suspended_md(struct mapped_device
 	return test_bit(DMF_SUSPENDED, &md->flags);
 }
 
+static int dm_suspending_md(struct mapped_device *md)
+{
+	return test_bit(DMF_SUSPENDING, &md->flags);
+}
+
 int dm_suspended_internally_md(struct mapped_device *md)
 {
 	return test_bit(DMF_SUSPENDED_INTERNALLY, &md->flags);
@@ -2967,6 +2978,12 @@ int dm_suspended(struct dm_target *ti)
 }
 EXPORT_SYMBOL_GPL(dm_suspended);
 
+int dm_suspending(struct dm_target *ti)
+{
+	return dm_suspending_md(dm_table_get_md(ti->table));
+}
+EXPORT_SYMBOL_GPL(dm_suspending);
+
 int dm_noflush_suspending(struct dm_target *ti)
 {
 	return __noflush_suspending(dm_table_get_md(ti->table));
Index: rhel8/drivers/md/dm-integrity.c
===================================================================
--- rhel8.orig/drivers/md/dm-integrity.c
+++ rhel8/drivers/md/dm-integrity.c
@@ -2428,7 +2428,7 @@ static void integrity_writer(struct work
 	unsigned prev_free_sectors;
 
 	/* the following test is not needed, but it tests the replay code */
-	if (unlikely(dm_suspended(ic->ti)) && !ic->meta_dev)
+	if (unlikely(dm_suspending(ic->ti)) && !ic->meta_dev)
 		return;
 
 	spin_lock_irq(&ic->endio_wait.lock);
@@ -2489,7 +2489,7 @@ static void integrity_recalc(struct work
 
 next_chunk:
 
-	if (unlikely(dm_suspended(ic->ti)))
+	if (unlikely(dm_suspending(ic->ti)))
 		goto unlock_ret;
 
 	range.logical_sector = le64_to_cpu(ic->sb->recalc_sector);
Index: rhel8/include/linux/device-mapper.h
===================================================================
--- rhel8.orig/include/linux/device-mapper.h
+++ rhel8/include/linux/device-mapper.h
@@ -426,6 +426,7 @@ const char *dm_device_name(struct mapped
 int dm_copy_name_and_uuid(struct mapped_device *md, char *name, char *uuid);
 struct gendisk *dm_disk(struct mapped_device *md);
 int dm_suspended(struct dm_target *ti);
+int dm_suspending(struct dm_target *ti);
 int dm_noflush_suspending(struct dm_target *ti);
 void dm_accept_partial_bio(struct bio *bio, unsigned n_sectors);
 union map_info *dm_get_rq_mapinfo(struct request *rq);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

