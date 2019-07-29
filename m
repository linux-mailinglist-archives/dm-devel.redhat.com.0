Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0E978E31
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jul 2019 16:38:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6402175EAA;
	Mon, 29 Jul 2019 14:38:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C508860127;
	Mon, 29 Jul 2019 14:38:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B55B18005A2;
	Mon, 29 Jul 2019 14:38:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6TEcNqw020287 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jul 2019 10:38:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ECFCA5D9C3; Mon, 29 Jul 2019 14:38:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59AA35D9C8;
	Mon, 29 Jul 2019 14:38:21 +0000 (UTC)
Date: Mon, 29 Jul 2019 10:38:20 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Delmas <cedricde@outlook.fr>
Message-ID: <20190729143820.GA8423@redhat.com>
References: <VI1P191MB0014912D317079AAF7F3870BAECA0@VI1P191MB0014.EURP191.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1P191MB0014912D317079AAF7F3870BAECA0@VI1P191MB0014.EURP191.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] snapshot-origin with no snapshot may lead to BUG()
	in bio_split()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 29 Jul 2019 14:38:51 +0000 (UTC)

On Sat, Jul 20 2019 at  5:26am -0400,
C=E9dric Delmas <cedricde@outlook.fr> wrote:

> Hello,
> =

> I encountered a bug while working with DM snapshot targets: having a
> snapshot-origin target with all snapshots removed may lead to
> BUG_ON(sectors <=3D 0) in function bio_split() (file block/bio.c).

...
 =

> Steps to reproduce:
> truncate -s 500M origin.bin
> truncate -s 50M snapshot.bin
> losetup /dev/loop0 origin.bin
> losetup /dev/loop1 snapshot.bin
> mkfs.ext4 /dev/loop0
> dmsetup create snap --table "0 $(blockdev --getsz /dev/loop0) snapshot /d=
ev/loop0 /dev/loop1 N 256"
> dmsetup create orig --table "0 $(blockdev --getsz /dev/loop0) snapshot-or=
igin /dev/loop0"
> # use /dev/mapper/snap and /dev/mapper/orig then unmount them
> dmsetup suspend orig
> dmsetup remove snap
> dmsetup resume orig
> e2fsck /dev/mapper/orig
> # BUG in bio_split()
> =

> Steps to reproduce (the express way):
> truncate -s 500M origin.bin
> losetup /dev/loop0 origin.bin
> mkfs.ext4 /dev/loop0
> dmsetup create orig --table "0 $(blockdev --getsz /dev/loop0) snapshot-or=
igin /dev/loop0"
> e2fsck /dev/mapper/orig
> # BUG in bio_split()
> =

> =

> I looked at the code and to my opinion the problem comes from function or=
igin_map (file drivers/md/dm-snap.c). In the following code:
> =

> static int origin_map(struct dm_target *ti, struct bio *bio)
> {
> 	struct dm_origin *o =3D ti->private;
> 	unsigned available_sectors;
> ...
> 	available_sectors =3D o->split_boundary -
> 		((unsigned)bio->bi_iter.bi_sector & (o->split_boundary - 1));
> =

> 	if (bio_sectors(bio) > available_sectors)
> 		dm_accept_partial_bio(bio, available_sectors);
> ...
> =

> when there is no snapshot, split_boundary is 0 so available_sectors gets =
an invalid value.
> The problem no more appears if the function origin_map early exits using =
the following patch:
> --- a/drivers/md/dm-snap.c      2019-07-14 08:11:23.000000000 +0200
> +++ b/drivers/md/dm-snap.c      2019-07-19 17:50:15.876000000 +0200
> @@ -2328,6 +2328,9 @@ static int origin_map(struct dm_target *
>         if (bio_data_dir(bio) !=3D WRITE)
>                 return DM_MAPIO_REMAPPED;
>  =

> +       if (unlikely(!o->split_boundary))
> +               return do_origin(o->dev, bio);
> +
>         available_sectors =3D o->split_boundary -
>                 ((unsigned)bio->bi_iter.bi_sector & (o->split_boundary - =
1));
>  =


When there is no snapshot snapshot-origin shouldn't be used.

So your patch may fix the BUG() you hit but it doesn't go far enough
with warning the user that they've entered "unsupported" territory.

Rather than call do_origin() I'm inclined to
DMERR_LIMIT("... unsupported ...") and error the IO.

What are your reasons for wanting to silently allow this unsupported
usecase?

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
