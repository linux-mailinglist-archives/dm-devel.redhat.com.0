Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DC9F4E1CE6
	for <lists+dm-devel@lfdr.de>; Wed, 23 Oct 2019 15:40:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571838001;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XRxEvg7wQjCWmd3bvDYlFkU37FgGKeZP76eSljfZTF8=;
	b=Lcjj+ERyST2rzt6ltVkhNN/qdCIvwACI5xAAVLas+T0jR/MfD/T2o0lVtGuF/Bt4WvTUkK
	nuoe+s+EOKCWgUhoEbOGkdnxFHBsImAA730lPTqJX1JAk3ML8Mr5to1l2Dai0e/bxvj/eU
	xPG2m2PxAJ9YIWwFeGn6JbXziPUaTFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-ApAKuxWhPW6Hq0x4KAaZxw-1; Wed, 23 Oct 2019 09:39:59 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58D4D5E9;
	Wed, 23 Oct 2019 13:39:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB03C10027A8;
	Wed, 23 Oct 2019 13:39:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6602D4EE50;
	Wed, 23 Oct 2019 13:39:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9NDdJba028482 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Oct 2019 09:39:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29F845D784; Wed, 23 Oct 2019 13:39:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6522E5D70D;
	Wed, 23 Oct 2019 13:39:16 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x9NDdFIJ030147; Wed, 23 Oct 2019 09:39:15 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x9NDdFDa030143; Wed, 23 Oct 2019 09:39:15 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 23 Oct 2019 09:39:15 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Joe Thornber <thornber@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Message-ID: <alpine.LRH.2.02.1910230938260.29580@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-cache: replace spin_lock_irqsave with
	spin_lock_irq
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: ApAKuxWhPW6Hq0x4KAaZxw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

If we are in a place where it is known that interrupts are enabled,
functions spin_lock_irq/spin_unlock_irq should be used instead of
spin_lock_irqsave/spin_unlock_irqrestore.

spin_lock_irq and spin_unlock_irq are faster because the don't need to
push and pop the flags register.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-cache-target.c |   99 ++++++++++++--------------------------=
-----
 1 file changed, 28 insertions(+), 71 deletions(-)

Index: linux-2.6/drivers/md/dm-cache-target.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.orig/drivers/md/dm-cache-target.c=092019-10-16 17:05:31.00000=
0000 +0200
+++ linux-2.6/drivers/md/dm-cache-target.c=092019-10-16 17:09:35.000000000 =
+0200
@@ -74,22 +74,19 @@ static bool __iot_idle_for(struct io_tra
 static bool iot_idle_for(struct io_tracker *iot, unsigned long jifs)
 {
 =09bool r;
-=09unsigned long flags;
=20
-=09spin_lock_irqsave(&iot->lock, flags);
+=09spin_lock_irq(&iot->lock);
 =09r =3D __iot_idle_for(iot, jifs);
-=09spin_unlock_irqrestore(&iot->lock, flags);
+=09spin_unlock_irq(&iot->lock);
=20
 =09return r;
 }
=20
 static void iot_io_begin(struct io_tracker *iot, sector_t len)
 {
-=09unsigned long flags;
-
-=09spin_lock_irqsave(&iot->lock, flags);
+=09spin_lock_irq(&iot->lock);
 =09iot->in_flight +=3D len;
-=09spin_unlock_irqrestore(&iot->lock, flags);
+=09spin_unlock_irq(&iot->lock);
 }
=20
 static void __iot_io_end(struct io_tracker *iot, sector_t len)
@@ -172,7 +169,6 @@ static void __commit(struct work_struct
 {
 =09struct batcher *b =3D container_of(_ws, struct batcher, commit_work);
 =09blk_status_t r;
-=09unsigned long flags;
 =09struct list_head work_items;
 =09struct work_struct *ws, *tmp;
 =09struct continuation *k;
@@ -186,12 +182,12 @@ static void __commit(struct work_struct
 =09 * We have to grab these before the commit_op to avoid a race
 =09 * condition.
 =09 */
-=09spin_lock_irqsave(&b->lock, flags);
+=09spin_lock_irq(&b->lock);
 =09list_splice_init(&b->work_items, &work_items);
 =09bio_list_merge(&bios, &b->bios);
 =09bio_list_init(&b->bios);
 =09b->commit_scheduled =3D false;
-=09spin_unlock_irqrestore(&b->lock, flags);
+=09spin_unlock_irq(&b->lock);
=20
 =09r =3D b->commit_op(b->commit_context);
=20
@@ -238,13 +234,12 @@ static void async_commit(struct batcher
=20
 static void continue_after_commit(struct batcher *b, struct continuation *=
k)
 {
-=09unsigned long flags;
 =09bool commit_scheduled;
=20
-=09spin_lock_irqsave(&b->lock, flags);
+=09spin_lock_irq(&b->lock);
 =09commit_scheduled =3D b->commit_scheduled;
 =09list_add_tail(&k->ws.entry, &b->work_items);
-=09spin_unlock_irqrestore(&b->lock, flags);
+=09spin_unlock_irq(&b->lock);
=20
 =09if (commit_scheduled)
 =09=09async_commit(b);
@@ -255,13 +250,12 @@ static void continue_after_commit(struct
  */
 static void issue_after_commit(struct batcher *b, struct bio *bio)
 {
-       unsigned long flags;
        bool commit_scheduled;
=20
-       spin_lock_irqsave(&b->lock, flags);
+       spin_lock_irq(&b->lock);
        commit_scheduled =3D b->commit_scheduled;
        bio_list_add(&b->bios, bio);
-       spin_unlock_irqrestore(&b->lock, flags);
+       spin_unlock_irq(&b->lock);
=20
        if (commit_scheduled)
 =09       async_commit(b);
@@ -273,12 +267,11 @@ static void issue_after_commit(struct ba
 static void schedule_commit(struct batcher *b)
 {
 =09bool immediate;
-=09unsigned long flags;
=20
-=09spin_lock_irqsave(&b->lock, flags);
+=09spin_lock_irq(&b->lock);
 =09immediate =3D !list_empty(&b->work_items) || !bio_list_empty(&b->bios);
 =09b->commit_scheduled =3D true;
-=09spin_unlock_irqrestore(&b->lock, flags);
+=09spin_unlock_irq(&b->lock);
=20
 =09if (immediate)
 =09=09async_commit(b);
@@ -630,23 +623,19 @@ static struct per_bio_data *init_per_bio
=20
 static void defer_bio(struct cache *cache, struct bio *bio)
 {
-=09unsigned long flags;
-
-=09spin_lock_irqsave(&cache->lock, flags);
+=09spin_lock_irq(&cache->lock);
 =09bio_list_add(&cache->deferred_bios, bio);
-=09spin_unlock_irqrestore(&cache->lock, flags);
+=09spin_unlock_irq(&cache->lock);
=20
 =09wake_deferred_bio_worker(cache);
 }
=20
 static void defer_bios(struct cache *cache, struct bio_list *bios)
 {
-=09unsigned long flags;
-
-=09spin_lock_irqsave(&cache->lock, flags);
+=09spin_lock_irq(&cache->lock);
 =09bio_list_merge(&cache->deferred_bios, bios);
 =09bio_list_init(bios);
-=09spin_unlock_irqrestore(&cache->lock, flags);
+=09spin_unlock_irq(&cache->lock);
=20
 =09wake_deferred_bio_worker(cache);
 }
@@ -662,10 +651,6 @@ static bool bio_detain_shared(struct cac
 =09struct dm_bio_prison_cell_v2 *cell_prealloc, *cell;
=20
 =09cell_prealloc =3D alloc_prison_cell(cache); /* FIXME: allow wait if cal=
ling from worker */
-=09if (!cell_prealloc) {
-=09=09defer_bio(cache, bio);
-=09=09return false;
-=09}
=20
 =09build_key(oblock, end, &key);
 =09r =3D dm_cell_get_v2(cache->prison, &key, lock_level(bio), bio, cell_pr=
ealloc, &cell);
@@ -760,33 +745,27 @@ static dm_dblock_t oblock_to_dblock(stru
=20
 static void set_discard(struct cache *cache, dm_dblock_t b)
 {
-=09unsigned long flags;
-
 =09BUG_ON(from_dblock(b) >=3D from_dblock(cache->discard_nr_blocks));
 =09atomic_inc(&cache->stats.discard_count);
=20
-=09spin_lock_irqsave(&cache->lock, flags);
+=09spin_lock_irq(&cache->lock);
 =09set_bit(from_dblock(b), cache->discard_bitset);
-=09spin_unlock_irqrestore(&cache->lock, flags);
+=09spin_unlock_irq(&cache->lock);
 }
=20
 static void clear_discard(struct cache *cache, dm_dblock_t b)
 {
-=09unsigned long flags;
-
-=09spin_lock_irqsave(&cache->lock, flags);
+=09spin_lock_irq(&cache->lock);
 =09clear_bit(from_dblock(b), cache->discard_bitset);
-=09spin_unlock_irqrestore(&cache->lock, flags);
+=09spin_unlock_irq(&cache->lock);
 }
=20
 static bool is_discarded(struct cache *cache, dm_dblock_t b)
 {
 =09int r;
-=09unsigned long flags;
-
-=09spin_lock_irqsave(&cache->lock, flags);
+=09spin_lock_irq(&cache->lock);
 =09r =3D test_bit(from_dblock(b), cache->discard_bitset);
-=09spin_unlock_irqrestore(&cache->lock, flags);
+=09spin_unlock_irq(&cache->lock);
=20
 =09return r;
 }
@@ -794,12 +773,10 @@ static bool is_discarded(struct cache *c
 static bool is_discarded_oblock(struct cache *cache, dm_oblock_t b)
 {
 =09int r;
-=09unsigned long flags;
-
-=09spin_lock_irqsave(&cache->lock, flags);
+=09spin_lock_irq(&cache->lock);
 =09r =3D test_bit(from_dblock(oblock_to_dblock(cache, b)),
 =09=09     cache->discard_bitset);
-=09spin_unlock_irqrestore(&cache->lock, flags);
+=09spin_unlock_irq(&cache->lock);
=20
 =09return r;
 }
@@ -831,17 +808,16 @@ static void remap_to_cache(struct cache
=20
 static void check_if_tick_bio_needed(struct cache *cache, struct bio *bio)
 {
-=09unsigned long flags;
 =09struct per_bio_data *pb;
=20
-=09spin_lock_irqsave(&cache->lock, flags);
+=09spin_lock_irq(&cache->lock);
 =09if (cache->need_tick_bio && !op_is_flush(bio->bi_opf) &&
 =09    bio_op(bio) !=3D REQ_OP_DISCARD) {
 =09=09pb =3D get_per_bio_data(bio);
 =09=09pb->tick =3D true;
 =09=09cache->need_tick_bio =3D false;
 =09}
-=09spin_unlock_irqrestore(&cache->lock, flags);
+=09spin_unlock_irq(&cache->lock);
 }
=20
 static void __remap_to_origin_clear_discard(struct cache *cache, struct bi=
o *bio,
@@ -1491,11 +1467,6 @@ static int mg_lock_writes(struct dm_cach
 =09struct dm_bio_prison_cell_v2 *prealloc;
=20
 =09prealloc =3D alloc_prison_cell(cache);
-=09if (!prealloc) {
-=09=09DMERR_LIMIT("%s: alloc_prison_cell failed", cache_device_name(cache)=
);
-=09=09mg_complete(mg, false);
-=09=09return -ENOMEM;
-=09}
=20
 =09/*
 =09 * Prevent writes to the block, but allow reads to continue.
@@ -1533,11 +1504,6 @@ static int mg_start(struct cache *cache,
 =09}
=20
 =09mg =3D alloc_migration(cache);
-=09if (!mg) {
-=09=09policy_complete_background_work(cache->policy, op, false);
-=09=09background_work_end(cache);
-=09=09return -ENOMEM;
-=09}
=20
 =09mg->op =3D op;
 =09mg->overwrite_bio =3D bio;
@@ -1626,10 +1592,6 @@ static int invalidate_lock(struct dm_cac
 =09struct dm_bio_prison_cell_v2 *prealloc;
=20
 =09prealloc =3D alloc_prison_cell(cache);
-=09if (!prealloc) {
-=09=09invalidate_complete(mg, false);
-=09=09return -ENOMEM;
-=09}
=20
 =09build_key(mg->invalidate_oblock, oblock_succ(mg->invalidate_oblock), &k=
ey);
 =09r =3D dm_cell_lock_v2(cache->prison, &key,
@@ -1667,10 +1629,6 @@ static int invalidate_start(struct cache
 =09=09return -EPERM;
=20
 =09mg =3D alloc_migration(cache);
-=09if (!mg) {
-=09=09background_work_end(cache);
-=09=09return -ENOMEM;
-=09}
=20
 =09mg->overwrite_bio =3D bio;
 =09mg->invalidate_cblock =3D cblock;
@@ -1911,17 +1869,16 @@ static void process_deferred_bios(struct
 {
 =09struct cache *cache =3D container_of(ws, struct cache, deferred_bio_wor=
ker);
=20
-=09unsigned long flags;
 =09bool commit_needed =3D false;
 =09struct bio_list bios;
 =09struct bio *bio;
=20
 =09bio_list_init(&bios);
=20
-=09spin_lock_irqsave(&cache->lock, flags);
+=09spin_lock_irq(&cache->lock);
 =09bio_list_merge(&bios, &cache->deferred_bios);
 =09bio_list_init(&cache->deferred_bios);
-=09spin_unlock_irqrestore(&cache->lock, flags);
+=09spin_unlock_irq(&cache->lock);
=20
 =09while ((bio =3D bio_list_pop(&bios))) {
 =09=09if (bio->bi_opf & REQ_PREFLUSH)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

