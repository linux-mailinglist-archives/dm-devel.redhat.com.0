Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 754FEF75D0
	for <lists+dm-devel@lfdr.de>; Mon, 11 Nov 2019 15:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573480814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=npW3UKl0tIHQRWsVok10XWiM6klN1RAg5a3PttawTcE=;
	b=iWCXup91BxckpcRNAftrqn+7o6VnaQr57w9cEIdVC5A9ZHqqCIs0NEJ5B/vdzXqOFJwFgL
	9ZgjCoHSANm5/XYSJEvjKWzyPsdWz6DjBNCJsjpyMsZBnp4VdsuopxH1gXaGmz5ltd4enD
	SqFFA14dZnQ4lMvLebRjAlqsMfuCfO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-WAStUJtcNhm1R2G22OQxyg-1; Mon, 11 Nov 2019 09:00:11 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0E03927F1C;
	Mon, 11 Nov 2019 14:00:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C03F660156;
	Mon, 11 Nov 2019 14:00:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A38F4BB65;
	Mon, 11 Nov 2019 13:59:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xABDximc017345 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 Nov 2019 08:59:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4A02C5D72C; Mon, 11 Nov 2019 13:59:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7266F5EE0F;
	Mon, 11 Nov 2019 13:59:41 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id xABDxeQv032313; Mon, 11 Nov 2019 08:59:40 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id xABDxeDE032307; Mon, 11 Nov 2019 08:59:40 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 11 Nov 2019 08:59:40 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Scott Wood <swood@redhat.com>
Message-ID: <alpine.LRH.2.02.1911110811060.28408@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Nikos Tsironis <ntsironis@arrikto.com>,
	Ilias Tsitsimpis <iliastsi@arrikto.com>
Subject: [dm-devel] [PATCH 1/2] dm-snapshot: fix crash with the realtime
	kernel
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: WAStUJtcNhm1R2G22OQxyg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Snapshot doesn't work with realtime kernels since the commit f79ae415b64c.
hlist_bl is implemented as a raw spinlock and the code takes two non-raw
spinlocks while holding hlist_bl (non-raw spinlocks are blocking mutexes
in the realtime kernel, so they couldn't be taken inside a raw spinlock).

This patch fixes the problem by using non-raw spinlock
exception_table_lock instead of the hlist_bl lock.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: f79ae415b64c ("dm snapshot: Make exception tables scalable")

---
 drivers/md/dm-snap.c |   65 ++++++++++++++++++++++++++++++++--------------=
-----
 1 file changed, 42 insertions(+), 23 deletions(-)

Index: linux-2.6/drivers/md/dm-snap.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.orig/drivers/md/dm-snap.c=092019-11-08 15:51:42.000000000 +01=
00
+++ linux-2.6/drivers/md/dm-snap.c=092019-11-08 15:54:58.000000000 +0100
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
@@ -625,30 +629,42 @@ static uint32_t exception_hash(struct dm
=20
 /* Lock to protect access to the completed and pending exception hash tabl=
es. */
 struct dm_exception_table_lock {
+#ifndef CONFIG_PREEMPT_RT_BASE
 =09struct hlist_bl_head *complete_slot;
 =09struct hlist_bl_head *pending_slot;
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
+#endif
 }
=20
-static void dm_exception_table_lock(struct dm_exception_table_lock *lock)
+static void dm_exception_table_lock(struct dm_snapshot *s, struct dm_excep=
tion_table_lock *lock)
 {
+#ifdef CONFIG_PREEMPT_RT_BASE
+=09spin_lock(&s->exception_table_lock);
+#else
 =09hlist_bl_lock(lock->complete_slot);
 =09hlist_bl_lock(lock->pending_slot);
+#endif
 }
=20
-static void dm_exception_table_unlock(struct dm_exception_table_lock *lock=
)
+static void dm_exception_table_unlock(struct dm_snapshot *s, struct dm_exc=
eption_table_lock *lock)
 {
+#ifdef CONFIG_PREEMPT_RT_BASE
+=09spin_unlock(&s->exception_table_lock);
+#else
 =09hlist_bl_unlock(lock->pending_slot);
 =09hlist_bl_unlock(lock->complete_slot);
+#endif
 }
=20
 static int dm_exception_table_init(struct dm_exception_table *et,
@@ -835,9 +851,9 @@ static int dm_add_exception(void *contex
 =09 */
 =09dm_exception_table_lock_init(s, old, &lock);
=20
-=09dm_exception_table_lock(&lock);
+=09dm_exception_table_lock(s, &lock);
 =09dm_insert_exception(&s->complete, e);
-=09dm_exception_table_unlock(&lock);
+=09dm_exception_table_unlock(s, &lock);
=20
 =09return 0;
 }
@@ -1318,6 +1334,9 @@ static int snapshot_ctr(struct dm_target
 =09s->first_merging_chunk =3D 0;
 =09s->num_merging_chunks =3D 0;
 =09bio_list_init(&s->bios_queued_during_merge);
+#ifdef CONFIG_PREEMPT_RT_BASE
+=09spin_lock_init(&s->exception_table_lock);
+#endif
=20
 =09/* Allocate hash table for COW data */
 =09if (init_hash_tables(s)) {
@@ -1651,7 +1670,7 @@ static void pending_complete(void *conte
 =09=09invalidate_snapshot(s, -EIO);
 =09=09error =3D 1;
=20
-=09=09dm_exception_table_lock(&lock);
+=09=09dm_exception_table_lock(s, &lock);
 =09=09goto out;
 =09}
=20
@@ -1660,13 +1679,13 @@ static void pending_complete(void *conte
 =09=09invalidate_snapshot(s, -ENOMEM);
 =09=09error =3D 1;
=20
-=09=09dm_exception_table_lock(&lock);
+=09=09dm_exception_table_lock(s, &lock);
 =09=09goto out;
 =09}
 =09*e =3D pe->e;
=20
 =09down_read(&s->lock);
-=09dm_exception_table_lock(&lock);
+=09dm_exception_table_lock(s, &lock);
 =09if (!s->valid) {
 =09=09up_read(&s->lock);
 =09=09free_completed_exception(e);
@@ -1687,16 +1706,16 @@ static void pending_complete(void *conte
=20
 =09/* Wait for conflicting reads to drain */
 =09if (__chunk_is_tracked(s, pe->e.old_chunk)) {
-=09=09dm_exception_table_unlock(&lock);
+=09=09dm_exception_table_unlock(s, &lock);
 =09=09__check_for_conflicting_io(s, pe->e.old_chunk);
-=09=09dm_exception_table_lock(&lock);
+=09=09dm_exception_table_lock(s, &lock);
 =09}
=20
 out:
 =09/* Remove the in-flight exception from the list */
 =09dm_remove_exception(&pe->e);
=20
-=09dm_exception_table_unlock(&lock);
+=09dm_exception_table_unlock(s, &lock);
=20
 =09snapshot_bios =3D bio_list_get(&pe->snapshot_bios);
 =09origin_bios =3D bio_list_get(&pe->origin_bios);
@@ -1968,7 +1987,7 @@ static int snapshot_map(struct dm_target
 =09}
=20
 =09down_read(&s->lock);
-=09dm_exception_table_lock(&lock);
+=09dm_exception_table_lock(s, &lock);
=20
 =09if (!s->valid || (unlikely(s->snapshot_overflowed) &&
 =09    bio_data_dir(bio) =3D=3D WRITE)) {
@@ -1997,7 +2016,7 @@ static int snapshot_map(struct dm_target
 =09=09remap_exception(s, e, bio, chunk);
 =09=09if (unlikely(bio_op(bio) =3D=3D REQ_OP_DISCARD) &&
 =09=09    io_overlaps_chunk(s, bio)) {
-=09=09=09dm_exception_table_unlock(&lock);
+=09=09=09dm_exception_table_unlock(s, &lock);
 =09=09=09up_read(&s->lock);
 =09=09=09zero_exception(s, e, bio, chunk);
 =09=09=09r =3D DM_MAPIO_SUBMITTED; /* discard is not issued */
@@ -2024,9 +2043,9 @@ static int snapshot_map(struct dm_target
 =09if (bio_data_dir(bio) =3D=3D WRITE) {
 =09=09pe =3D __lookup_pending_exception(s, chunk);
 =09=09if (!pe) {
-=09=09=09dm_exception_table_unlock(&lock);
+=09=09=09dm_exception_table_unlock(s, &lock);
 =09=09=09pe =3D alloc_pending_exception(s);
-=09=09=09dm_exception_table_lock(&lock);
+=09=09=09dm_exception_table_lock(s, &lock);
=20
 =09=09=09e =3D dm_lookup_exception(&s->complete, chunk);
 =09=09=09if (e) {
@@ -2037,7 +2056,7 @@ static int snapshot_map(struct dm_target
=20
 =09=09=09pe =3D __find_pending_exception(s, pe, chunk);
 =09=09=09if (!pe) {
-=09=09=09=09dm_exception_table_unlock(&lock);
+=09=09=09=09dm_exception_table_unlock(s, &lock);
 =09=09=09=09up_read(&s->lock);
=20
 =09=09=09=09down_write(&s->lock);
@@ -2063,7 +2082,7 @@ static int snapshot_map(struct dm_target
 =09=09if (!pe->started && io_overlaps_chunk(s, bio)) {
 =09=09=09pe->started =3D 1;
=20
-=09=09=09dm_exception_table_unlock(&lock);
+=09=09=09dm_exception_table_unlock(s, &lock);
 =09=09=09up_read(&s->lock);
=20
 =09=09=09start_full_bio(pe, bio);
@@ -2076,7 +2095,7 @@ static int snapshot_map(struct dm_target
 =09=09=09/* this is protected by the exception table lock */
 =09=09=09pe->started =3D 1;
=20
-=09=09=09dm_exception_table_unlock(&lock);
+=09=09=09dm_exception_table_unlock(s, &lock);
 =09=09=09up_read(&s->lock);
=20
 =09=09=09start_copy(pe);
@@ -2088,7 +2107,7 @@ static int snapshot_map(struct dm_target
 =09}
=20
 out_unlock:
-=09dm_exception_table_unlock(&lock);
+=09dm_exception_table_unlock(s, &lock);
 =09up_read(&s->lock);
 out:
 =09return r;
@@ -2449,7 +2468,7 @@ static int __origin_write(struct list_he
 =09=09dm_exception_table_lock_init(snap, chunk, &lock);
=20
 =09=09down_read(&snap->lock);
-=09=09dm_exception_table_lock(&lock);
+=09=09dm_exception_table_lock(snap, &lock);
=20
 =09=09/* Only deal with valid and active snapshots */
 =09=09if (!snap->valid || !snap->active)
@@ -2466,9 +2485,9 @@ static int __origin_write(struct list_he
 =09=09=09if (e)
 =09=09=09=09goto next_snapshot;
=20
-=09=09=09dm_exception_table_unlock(&lock);
+=09=09=09dm_exception_table_unlock(snap, &lock);
 =09=09=09pe =3D alloc_pending_exception(snap);
-=09=09=09dm_exception_table_lock(&lock);
+=09=09=09dm_exception_table_lock(snap, &lock);
=20
 =09=09=09pe2 =3D __lookup_pending_exception(snap, chunk);
=20
@@ -2481,7 +2500,7 @@ static int __origin_write(struct list_he
=20
 =09=09=09=09pe =3D __insert_pending_exception(snap, pe, chunk);
 =09=09=09=09if (!pe) {
-=09=09=09=09=09dm_exception_table_unlock(&lock);
+=09=09=09=09=09dm_exception_table_unlock(snap, &lock);
 =09=09=09=09=09up_read(&snap->lock);
=20
 =09=09=09=09=09invalidate_snapshot(snap, -ENOMEM);
@@ -2516,7 +2535,7 @@ static int __origin_write(struct list_he
 =09=09}
=20
 next_snapshot:
-=09=09dm_exception_table_unlock(&lock);
+=09=09dm_exception_table_unlock(snap, &lock);
 =09=09up_read(&snap->lock);
=20
 =09=09if (pe_to_start_now) {

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

