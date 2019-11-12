Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B1A0BF9535
	for <lists+dm-devel@lfdr.de>; Tue, 12 Nov 2019 17:10:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573575012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F2/PMkQnl7U9KqbBJpkEMds1w0uO+RdLQcr128gknWU=;
	b=Nh7bdUh7/XmHHm5VqQ4GQyOnF9tcpz5+RacJ1+ODQ/CNElWh/PrR6WiGMrCD0vyn9U66ia
	xknA8OgUWAPgBMsAqvWTZHqJHFDQXWIeUJ/s5fwl9BU+VVFe7cSa4MOxc2/6Yco8uc5ofp
	IUj/0J5ETNXAcwRSjA3KMXesAbj9N4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-nALvM9vQMfmUUPpiOMmT2g-1; Tue, 12 Nov 2019 11:10:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C421B111;
	Tue, 12 Nov 2019 16:10:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A85018213;
	Tue, 12 Nov 2019 16:10:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 446064BB65;
	Tue, 12 Nov 2019 16:10:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xACG9soT009097 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 12 Nov 2019 11:09:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B835128D39; Tue, 12 Nov 2019 16:09:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39F9C816E;
	Tue, 12 Nov 2019 16:09:52 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id xACG9pOd017623; Tue, 12 Nov 2019 11:09:51 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id xACG9pJr017619; Tue, 12 Nov 2019 11:09:51 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 12 Nov 2019 11:09:51 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.1911121057490.12815@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Nikos Tsironis <ntsironis@arrikto.com>, Daniel Wagner <dwagner@suse.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Ilias Tsitsimpis <iliastsi@arrikto.com>, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, tglx@linutronix.de,
	Scott Wood <swood@redhat.com>, linux-rt-users@vger.kernel.org
Subject: [dm-devel] [PATCH RT 1/2 v2] dm-snapshot: fix crash with the
	realtime kernel
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: nALvM9vQMfmUUPpiOMmT2g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Snapshot doesn't work with realtime kernels since the commit f79ae415b64c.
hlist_bl is implemented as a raw spinlock and the code takes two non-raw
spinlocks while holding hlist_bl (non-raw spinlocks are blocking mutexes
in the realtime kernel).

We can't change hlist_bl to use non-raw spinlocks, this triggers warnings=
=20
in dentry lookup code, because the dentry lookup code uses hlist_bl while=
=20
holding a seqlock.

This patch fixes the problem by using non-raw spinlock=20
exception_table_lock instead of the hlist_bl lock.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: f79ae415b64c ("dm snapshot: Make exception tables scalable")

---
 drivers/md/dm-snap.c |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

Index: linux-2.6/drivers/md/dm-snap.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.orig/drivers/md/dm-snap.c=092019-11-12 16:44:36.000000000 +01=
00
+++ linux-2.6/drivers/md/dm-snap.c=092019-11-12 17:01:46.000000000 +0100
@@ -141,6 +141,10 @@ struct dm_snapshot {
 =09 * for them to be committed.
 =09 */
 =09struct bio_list bios_queued_during_merge;
+
+#ifdef CONFIG_PREEMPT_RT_BASE
+=09spinlock_t exception_table_lock;
+#endif
 };
=20
 /*
@@ -625,30 +629,46 @@ static uint32_t exception_hash(struct dm
=20
 /* Lock to protect access to the completed and pending exception hash tabl=
es. */
 struct dm_exception_table_lock {
+#ifndef CONFIG_PREEMPT_RT_BASE
 =09struct hlist_bl_head *complete_slot;
 =09struct hlist_bl_head *pending_slot;
+#else
+=09spinlock_t *lock;
+#endif
 };
=20
 static void dm_exception_table_lock_init(struct dm_snapshot *s, chunk_t ch=
unk,
 =09=09=09=09=09 struct dm_exception_table_lock *lock)
 {
+#ifndef CONFIG_PREEMPT_RT_BASE
 =09struct dm_exception_table *complete =3D &s->complete;
 =09struct dm_exception_table *pending =3D &s->pending;
=20
 =09lock->complete_slot =3D &complete->table[exception_hash(complete, chunk=
)];
 =09lock->pending_slot =3D &pending->table[exception_hash(pending, chunk)];
+#else
+=09lock->lock =3D &s->exception_table_lock;
+#endif
 }
=20
 static void dm_exception_table_lock(struct dm_exception_table_lock *lock)
 {
+#ifndef CONFIG_PREEMPT_RT_BASE
 =09hlist_bl_lock(lock->complete_slot);
 =09hlist_bl_lock(lock->pending_slot);
+#else
+=09spin_lock(lock->lock);
+#endif
 }
=20
 static void dm_exception_table_unlock(struct dm_exception_table_lock *lock=
)
 {
+#ifndef CONFIG_PREEMPT_RT_BASE
 =09hlist_bl_unlock(lock->pending_slot);
 =09hlist_bl_unlock(lock->complete_slot);
+#else
+=09spin_unlock(lock->lock);
+#endif
 }
=20
 static int dm_exception_table_init(struct dm_exception_table *et,
@@ -1318,6 +1338,9 @@ static int snapshot_ctr(struct dm_target
 =09s->first_merging_chunk =3D 0;
 =09s->num_merging_chunks =3D 0;
 =09bio_list_init(&s->bios_queued_during_merge);
+#ifdef CONFIG_PREEMPT_RT_BASE
+=09spin_lock_init(&s->exception_table_lock);
+#endif
=20
 =09/* Allocate hash table for COW data */
 =09if (init_hash_tables(s)) {

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

