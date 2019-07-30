Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0AF79D34
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jul 2019 02:09:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 165D4C027339;
	Tue, 30 Jul 2019 00:09:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BDD5608A5;
	Tue, 30 Jul 2019 00:09:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92EB718089C8;
	Tue, 30 Jul 2019 00:09:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6U08w9Z031175 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jul 2019 20:08:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3511D19C5B; Tue, 30 Jul 2019 00:08:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E61C19C59
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 00:08:56 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A652317915C
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 00:08:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 2051CAC9A;
	Tue, 30 Jul 2019 00:08:53 +0000 (UTC)
From: NeilBrown <neilb@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>, linux-raid@vger.kernel.org
Date: Tue, 30 Jul 2019 10:08:45 +1000
In-Reply-To: <20190729193359.11040-1-gpiccoli@canonical.com>
References: <20190729193359.11040-1-gpiccoli@canonical.com>
Message-ID: <87zhkwl6ya.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Tue, 30 Jul 2019 00:08:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Tue, 30 Jul 2019 00:08:54 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'neilb@suse.com'
	RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <neilb@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, jay.vosburgh@canonical.com,
	Song Liu <songliubraving@fb.com>, dm-devel@redhat.com,
	Neil F Brown <nfbrown@suse.com>
Subject: Re: [dm-devel] [PATCH] md/raid0: Fail BIOs if their underlying
	block device is gone
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
Content-Type: multipart/mixed; boundary="===============3965283299856440800=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 30 Jul 2019 00:09:24 +0000 (UTC)

--===============3965283299856440800==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29 2019,  Guilherme G. Piccoli  wrote:

> Currently md/raid0 is not provided with any mechanism to validate if
> an array member got removed or failed. The driver keeps sending BIOs
> regardless of the state of array members. This leads to the following
> situation: if a raid0 array member is removed and the array is mounted,
> some user writing to this array won't realize that errors are happening
> unless they check kernel log or perform one fsync per written file.
>
> In other words, no -EIO is returned and writes (except direct ones) appear
> normal. Meaning the user might think the wrote data is correctly stored in
> the array, but instead garbage was written given that raid0 does stripping
> (and so, it requires all its members to be working in order to not corrupt
> data).
>
> This patch proposes a small change in this behavior: we check if the block
> device's gendisk is UP when submitting the BIO to the array member, and if
> it isn't, we flag the md device as broken and fail subsequent I/Os. In ca=
se
> the array is restored (i.e., the missing array member is back), the flag =
is
> cleared and we can submit BIOs normally.
>
> With this patch, the filesystem reacts much faster to the event of missing
> array member: after some I/O errors, ext4 for instance aborts the journal
> and prevents corruption. Without this change, we're able to keep writing
> in the disk and after a machine reboot, e2fsck shows some severe fs errors
> that demand fixing. This patch was tested in both ext4 and xfs
> filesystems.
>
> Cc: NeilBrown <neilb@suse.com>
> Cc: Song Liu <songliubraving@fb.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
> ---
>
> After an attempt to change the way md/raid0 fails in case one of its
> members gets removed (see [0]), we got not so great feedback from the
> community and also, the change was complex and had corner cases.
> One of the points which seemed to be a consensus in that attempt was
> that raid0 could benefit from a way of failing faster in case a member
> gets removed. This patch aims for that, in a simpler way than earlier
> proposed. Any feedbacks are welcome, thanks in advance!
>
>
> Guilherme
>
>
> [0] lore.kernel.org/linux-block/20190418220448.7219-1-gpiccoli@canonical.=
com
>
>
>  drivers/md/md.c    | 5 +++++
>  drivers/md/md.h    | 3 +++
>  drivers/md/raid0.c | 8 ++++++++
>  3 files changed, 16 insertions(+)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 24638ccedce4..fba49918d591 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -376,6 +376,11 @@ static blk_qc_t md_make_request(struct request_queue=
 *q, struct bio *bio)
>  	struct mddev *mddev =3D q->queuedata;
>  	unsigned int sectors;
>=20=20
> +	if (unlikely(test_bit(MD_BROKEN, &mddev->flags))) {
> +		bio_io_error(bio);
> +		return BLK_QC_T_NONE;
> +	}

I think this should only fail WRITE requests, not READ requests.

Otherwise the patch is probably reasonable.

NeilBrown


> +
>  	blk_queue_split(q, &bio);
>=20=20
>  	if (mddev =3D=3D NULL || mddev->pers =3D=3D NULL) {
> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index 10f98200e2f8..41552e615c4c 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -248,6 +248,9 @@ enum mddev_flags {
>  	MD_UPDATING_SB,		/* md_check_recovery is updating the metadata
>  				 * without explicitly holding reconfig_mutex.
>  				 */
> +	MD_BROKEN,              /* This is used in RAID-0 only, to stop I/O
> +				 * in case an array member is gone/failed.
> +				 */
>  };
>=20=20
>  enum mddev_sb_flags {
> diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
> index bf5cf184a260..58a9cc5193bf 100644
> --- a/drivers/md/raid0.c
> +++ b/drivers/md/raid0.c
> @@ -586,6 +586,14 @@ static bool raid0_make_request(struct mddev *mddev, =
struct bio *bio)
>=20=20
>  	zone =3D find_zone(mddev->private, &sector);
>  	tmp_dev =3D map_sector(mddev, zone, sector, &sector);
> +
> +	if (unlikely(!(tmp_dev->bdev->bd_disk->flags & GENHD_FL_UP))) {
> +		set_bit(MD_BROKEN, &mddev->flags);
> +		bio_io_error(bio);
> +		return true;
> +	}
> +
> +	clear_bit(MD_BROKEN, &mddev->flags);
>  	bio_set_dev(bio, tmp_dev->bdev);
>  	bio->bi_iter.bi_sector =3D sector + zone->dev_start +
>  		tmp_dev->data_offset;
> --=20
> 2.22.0

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAl0/io4ACgkQOeye3VZi
gbkPnw//ZDAHleCZDsGZjuID2XCXBfEvuRDbTSMrk2NaIj/z/DlsSQOkNDYYGP5m
H4g7AssCnA49f67+F8sfkH/Fy+crnjR9p0e22bzKdXSi3O0HOGvkHkqHLjtWt7Pu
+atITqeUB/riI/v0b9y9whdFO1P3itEuZ+Nv+3hf3AlQ7P01Pv3v9ntpFycztqgG
VN0EkaGudLA5lkCphHmajgUUfLWF4GmP0dLsCHvd9GYCqpKGChImrHLrqgVPXTKz
T5BLp5l+icj59dM7Gn1iF3Hmub46QkGlfF0Flfp0jduqADB/khx7+smapYcBPXBu
pVsCV/fZtnWE/82CjYQiGeU+z6YZ2mFQRnRmgUFGE/Da6Te51DdyipU1NwYRRHB4
EgBOO76o9EaKBfqPzWMmxAuBUbdvZI2Dk1ZvYhSL0tZ2kFHXmlQwlY98VOc+D8WK
0bEMNJYmiiNkQzIqS3W1BiNFfG+ZDAgw6gC2quVlTVXgMpW205QpN1CbyRpC4Ayi
MSEHFyMDUQMLeehZ5HWK/51PvyvXlrWTjGWvv13EdqhROjzQ0TykR4RbPcrVK/00
ZPxKUZWwk9lh/ko6vfh1ZzcmPEnZ6Ft1pnvbdrH0wd3WOM7cRgjOYMqo/O7nHOQX
PkZVA3CNUYC4Y6oZNTXX9Re8W87Ola4kh00+jT2qddVprwuiaOQ=
=0n/S
-----END PGP SIGNATURE-----
--=-=-=--


--===============3965283299856440800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============3965283299856440800==--

