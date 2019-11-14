Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDD9FCA3D
	for <lists+dm-devel@lfdr.de>; Thu, 14 Nov 2019 16:49:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573746577;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=brvCuIH/DjYrPBythx3z/cPLp87rLBnqZoe+xDrrMPg=;
	b=Np03v6oKxbrLDWAP1aUPd54pVCq+YN0gCxOERLV2JA7thJH5pGJT7uIpal842jQoTOGTWH
	IFo4TmcICICKjAYNWGMz0l3j9vaeqNZAQgi6ydjd7S547LwIv/9xSV8FYeVnKejs0s/LO0
	k5up2XRm3h5fO300QMrUjuX4H/aJhdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-OK8juxRvPSygv_G3ayR7wg-1; Thu, 14 Nov 2019 10:49:35 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21A3318B9FE1;
	Thu, 14 Nov 2019 15:49:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B21221036C6C;
	Thu, 14 Nov 2019 15:49:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6960182B010;
	Thu, 14 Nov 2019 15:49:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEFmsI1027419 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 10:48:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C7BC35ED4B; Thu, 14 Nov 2019 15:48:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3622D5ED31;
	Thu, 14 Nov 2019 15:48:49 +0000 (UTC)
Date: Thu, 14 Nov 2019 10:48:48 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <20191114154848.GA21426@redhat.com>
References: <1573740655-104317-1-git-send-email-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1573740655-104317-1-git-send-email-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: joseph.qi@linux.alibaba.com, ejt@redhat.com, dm-devel@redhat.com,
	agk@redhat.com
Subject: Re: [dm-devel] dm-thin: wakeup worker only when deferred bios exist
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
X-MC-Unique: OK8juxRvPSygv_G3ayR7wg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Nov 14 2019 at  9:10am -0500,
Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> Single thread fio test (read, bs=3D4k, ioengine=3Dlibaio, iodepth=3D128,
> numjobs=3D1) over dm-thin device has poor performance versus bare nvme
> disk on v5.4.0-rc7.
>=20
> Further investigation with perf indicates that queue_work_on() consumes
> over 20% CPU time when doing IO over dm-thin device. The call stack is
> as follows.
>=20
> - 46.64% thin_map
>    + 22.28% queue_work_on
>    + 12.98% dm_thin_find_block
>    + 5.07% cell_defer_no_holder
>    + 2.42% bio_detain.isra.33
>    + 0.95% inc_all_io_entry.isra.31.part.32
>      0.80% remap.isra.41
>=20
> In cell_defer_no_holder(), wakeup_worker() is always called, no matter wh=
ether
> the cell->bios list is empty or not. In single thread IO model, cell->bio=
s list
> is most likely empty. So skip waking up worker thread if cell->bios list =
is
> empty.
>=20
> A significant IO performance of single thread can be seen with this patch=
.
> The original IO performance is 445 MiB/s with the fio test previously
> described, while it is 643 MiB/s after applying the patch, which is a
> 44% performance improvement.
>=20
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>


Nice find, implementation detail questions inlined below.

> ---
>  drivers/md/dm-bio-prison-v1.c |  8 +++++++-
>  drivers/md/dm-bio-prison-v1.h |  2 +-
>  drivers/md/dm-thin.c          | 10 ++++++----
>  3 files changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/md/dm-bio-prison-v1.c b/drivers/md/dm-bio-prison-v1.=
c
> index b538989..b2a9b8d 100644
> --- a/drivers/md/dm-bio-prison-v1.c
> +++ b/drivers/md/dm-bio-prison-v1.c
> @@ -219,11 +219,17 @@ static void __cell_release_no_holder(struct dm_bio_=
prison *prison,
> =20
>  void dm_cell_release_no_holder(struct dm_bio_prison *prison,
>  =09=09=09       struct dm_bio_prison_cell *cell,
> -=09=09=09       struct bio_list *inmates)
> +=09=09=09       struct bio_list *inmates, int *empty)
>  {
>  =09unsigned long flags;
> =20
>  =09spin_lock_irqsave(&prison->lock, flags);
> +=09/*
> +=09 * The empty flag should represent the list state exactly
> +=09 * when the list is merged into @inmates, thus get the
> +=09 * list state when prison->lock is held.
> +=09 */
> +=09*empty =3D bio_list_empty(&cell->bios);
>  =09__cell_release_no_holder(prison, cell, inmates);
>  =09spin_unlock_irqrestore(&prison->lock, flags);
>  }
> diff --git a/drivers/md/dm-bio-prison-v1.h b/drivers/md/dm-bio-prison-v1.=
h
> index cec52ac..500edbc 100644
> --- a/drivers/md/dm-bio-prison-v1.h
> +++ b/drivers/md/dm-bio-prison-v1.h
> @@ -89,7 +89,7 @@ void dm_cell_release(struct dm_bio_prison *prison,
>  =09=09     struct bio_list *bios);
>  void dm_cell_release_no_holder(struct dm_bio_prison *prison,
>  =09=09=09       struct dm_bio_prison_cell *cell,
> -=09=09=09       struct bio_list *inmates);
> +=09=09=09       struct bio_list *inmates, int *empty);
>  void dm_cell_error(struct dm_bio_prison *prison,
>  =09=09   struct dm_bio_prison_cell *cell, blk_status_t error);
> =20
> diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
> index fcd8877..51fd396 100644
> --- a/drivers/md/dm-thin.c
> +++ b/drivers/md/dm-thin.c
> @@ -480,9 +480,9 @@ static void cell_visit_release(struct pool *pool,
> =20
>  static void cell_release_no_holder(struct pool *pool,
>  =09=09=09=09   struct dm_bio_prison_cell *cell,
> -=09=09=09=09   struct bio_list *bios)
> +=09=09=09=09   struct bio_list *bios, int *empty)
>  {
> -=09dm_cell_release_no_holder(pool->prison, cell, bios);
> +=09dm_cell_release_no_holder(pool->prison, cell, bios, empty);
>  =09dm_bio_prison_free_cell(pool->prison, cell);
>  }
> =20
> @@ -886,12 +886,14 @@ static void cell_defer_no_holder(struct thin_c *tc,=
 struct dm_bio_prison_cell *c
>  {
>  =09struct pool *pool =3D tc->pool;
>  =09unsigned long flags;
> +=09int empty;
> =20
>  =09spin_lock_irqsave(&tc->lock, flags);
> -=09cell_release_no_holder(pool, cell, &tc->deferred_bio_list);
> +=09cell_release_no_holder(pool, cell, &tc->deferred_bio_list, &empty);
>  =09spin_unlock_irqrestore(&tc->lock, flags);
> =20
> -=09wake_worker(pool);
> +=09if (!empty)
> +=09=09wake_worker(pool);
>  }

Think your point is tc->deferred_bio_list may have bios already, before
the call to cell_release_no_holder, so simply checking if it is empty
after the cell_release_no_holder call isn't enough?

But if tc->deferred_bio_list isn't empty then there is work that needs
to be done, regardless of whether this particular cell created work, so
I'm left wondering if you first tried simply checking if
tc->deferred_bio_list is empty after cell_release_no_holder() in
cell_defer_no_holder?

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

