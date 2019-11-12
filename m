Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD74F9516
	for <lists+dm-devel@lfdr.de>; Tue, 12 Nov 2019 17:06:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573574799;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vBdIiYRU1WsmvOoF2yX2NXyPANSiEqLq8vAMK4R7A98=;
	b=IJdbSvXyRiPyCtpzIh6kjF7SRuZ0hoaLx2fx7bMKigigboQfnGUUOHAeVROSKmoI+E7liE
	RyZ89lPEeUtZpuQf0eVyBGyxlxBI2MgUuVZoVtdsMqzJEu/r25q65P4+FzbHsynl2IgCta
	VEWtgRW8AE6HeWzUgycJFj87bluS/cQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-fkWubQ6UNPqUjwQ2nPDkhQ-1; Tue, 12 Nov 2019 11:06:36 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05EB2140185;
	Tue, 12 Nov 2019 16:06:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AA4B18214;
	Tue, 12 Nov 2019 16:06:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E5E61819AC5;
	Tue, 12 Nov 2019 16:06:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xACG6KKB008974 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 12 Nov 2019 11:06:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4ED7058; Tue, 12 Nov 2019 16:06:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AEF750;
	Tue, 12 Nov 2019 16:06:17 +0000 (UTC)
Date: Tue, 12 Nov 2019 11:06:16 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20191112160616.GB3768@redhat.com>
References: <alpine.LRH.2.02.1911110811060.28408@file01.intranet.prod.int.rdu2.redhat.com>
	<20191112153433.GA3768@redhat.com>
	<alpine.LRH.2.02.1911121051400.12815@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1911121051400.12815@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Nikos Tsironis <ntsironis@arrikto.com>, dm-devel@redhat.com,
	Scott Wood <swood@redhat.com>, Ilias Tsitsimpis <iliastsi@arrikto.com>
Subject: Re: [dm-devel] [PATCH 1/2] dm-snapshot: fix crash with the realtime
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: fkWubQ6UNPqUjwQ2nPDkhQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Nov 12 2019 at 10:57am -0500,
Mikulas Patocka <mpatocka@redhat.com> wrote:

>=20
>=20
> On Tue, 12 Nov 2019, Mike Snitzer wrote:
>=20
> > On Mon, Nov 11 2019 at  8:59am -0500,
> > Mikulas Patocka <mpatocka@redhat.com> wrote:
> >=20
> > > Snapshot doesn't work with realtime kernels since the commit f79ae415=
b64c.
> > > hlist_bl is implemented as a raw spinlock and the code takes two non-=
raw
> > > spinlocks while holding hlist_bl (non-raw spinlocks are blocking mute=
xes
> > > in the realtime kernel, so they couldn't be taken inside a raw spinlo=
ck).
> > >=20
> > > This patch fixes the problem by using non-raw spinlock
> > > exception_table_lock instead of the hlist_bl lock.
> > >=20
> > > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > > Fixes: f79ae415b64c ("dm snapshot: Make exception tables scalable")
> > >=20
> > > ---
> > >  drivers/md/dm-snap.c |   65 ++++++++++++++++++++++++++++++++--------=
-----------
> > >  1 file changed, 42 insertions(+), 23 deletions(-)
> > >=20
> > > Index: linux-2.6/drivers/md/dm-snap.c
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > --- linux-2.6.orig/drivers/md/dm-snap.c=092019-11-08 15:51:42.0000000=
00 +0100
> > > +++ linux-2.6/drivers/md/dm-snap.c=092019-11-08 15:54:58.000000000 +0=
100
> > > @@ -141,6 +141,10 @@ struct dm_snapshot {
> > >  =09 * for them to be committed.
> > >  =09 */
> > >  =09struct bio_list bios_queued_during_merge;
> > > +
> > > +#ifdef CONFIG_PREEMPT_RT_BASE
> > > +=09spinlock_t exception_table_lock;
> > > +#endif
> > >  };
> > > =20
> > >  /*
> > > @@ -625,30 +629,42 @@ static uint32_t exception_hash(struct dm
> > > =20
> > >  /* Lock to protect access to the completed and pending exception has=
h tables. */
> > >  struct dm_exception_table_lock {
> > > +#ifndef CONFIG_PREEMPT_RT_BASE
> > >  =09struct hlist_bl_head *complete_slot;
> > >  =09struct hlist_bl_head *pending_slot;
> > > +#endif
> > >  };
> >=20
> > Why not put the spinlock_t in 'struct dm_exception_table_lock' with the
> > member name 'lock'?
>=20
> struct dm_exception_table_lock is allocated temporarily on the stack - we=
=20
> can't put locks into it, because every user uses different structurer.
>=20
> However, I can put pointer to to the spinlock to this structure. It=20
> shortens the patch - because then we don't have to pass a pointer to=20
> struct dm_snapshot to dm_exception_table_lock and=20
> dm_exception_table_unlock.

OK, I should've looked at the dm-snap.c code with more context, thanks
for clarifying.


> > >  static void dm_exception_table_lock_init(struct dm_snapshot *s, chun=
k_t chunk,
> > >  =09=09=09=09=09 struct dm_exception_table_lock *lock)
> > >  {
> > > +#ifndef CONFIG_PREEMPT_RT_BASE
> > >  =09struct dm_exception_table *complete =3D &s->complete;
> > >  =09struct dm_exception_table *pending =3D &s->pending;
> > > =20
> > >  =09lock->complete_slot =3D &complete->table[exception_hash(complete,=
 chunk)];
> > >  =09lock->pending_slot =3D &pending->table[exception_hash(pending, ch=
unk)];
> > > +#endif
> > >  }
> > > =20
> > > -static void dm_exception_table_lock(struct dm_exception_table_lock *=
lock)
> > > +static void dm_exception_table_lock(struct dm_snapshot *s, struct dm=
_exception_table_lock *lock)
> > >  {
> > > +#ifdef CONFIG_PREEMPT_RT_BASE
> > > +=09spin_lock(&s->exception_table_lock);
> > > +#else
> > >  =09hlist_bl_lock(lock->complete_slot);
> > >  =09hlist_bl_lock(lock->pending_slot);
> > > +#endif
> > >  }
> > > =20
> > > -static void dm_exception_table_unlock(struct dm_exception_table_lock=
 *lock)
> > > +static void dm_exception_table_unlock(struct dm_snapshot *s, struct =
dm_exception_table_lock *lock)
> > >  {
> > > +#ifdef CONFIG_PREEMPT_RT_BASE
> > > +=09spin_unlock(&s->exception_table_lock);
> > > +#else
> > >  =09hlist_bl_unlock(lock->pending_slot);
> > >  =09hlist_bl_unlock(lock->complete_slot);
> > > +#endif
> > >  }
> > > =20
> > >  static int dm_exception_table_init(struct dm_exception_table *et,
> > > @@ -835,9 +851,9 @@ static int dm_add_exception(void *contex
> > >  =09 */
> > >  =09dm_exception_table_lock_init(s, old, &lock);
> > > =20
> > > -=09dm_exception_table_lock(&lock);
> > > +=09dm_exception_table_lock(s, &lock);
> > >  =09dm_insert_exception(&s->complete, e);
> > > -=09dm_exception_table_unlock(&lock);
> > > +=09dm_exception_table_unlock(s, &lock);
> > > =20
> > >  =09return 0;
> > >  }
> >=20
> > That way you don't need the extra 'struct dm_snapshot' arg to all the
> > various dm_exception_table_{lock,unlock} calls.
> >=20
> > > @@ -1318,6 +1334,9 @@ static int snapshot_ctr(struct dm_target
> > >  =09s->first_merging_chunk =3D 0;
> > >  =09s->num_merging_chunks =3D 0;
> > >  =09bio_list_init(&s->bios_queued_during_merge);
> > > +#ifdef CONFIG_PREEMPT_RT_BASE
> > > +=09spin_lock_init(&s->exception_table_lock);
> > > +#endif
> > > =20
> > >  =09/* Allocate hash table for COW data */
> > >  =09if (init_hash_tables(s)) {
> >=20
> > And this spin_lock_init() would go in dm_exception_table_lock_init()
> > in appropriate #ifdef with spin_lock_init(&lock->lock)
>=20
> dm_exception_table_lock_init initializes an on-stack structure. It can't=
=20
> contain locks.
>=20
> > Doing it that way would seriously reduce the size of this patch.
>=20
> I reduced the size and I'll send next version.
>=20
> > Unless I'm missing something, please submit a v2 and cc linux-rt-user
> > mailing list and the other direct CCs suggested by others in reply to
> > patch 2/2.

Sounds good.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

