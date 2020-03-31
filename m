Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A74EC19BC95
	for <lists+dm-devel@lfdr.de>; Thu,  2 Apr 2020 09:20:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585812050;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=gVZyQDliehXDZPk4yKcTTCqm9vcZ5pW/tcl8r3Rrw+c=;
	b=YuDmW9JEnupfkAauAArs19p5RFyBZm3uh7UugpOoarQW4udO+GCV5sPyy8Ft1Cfy+CIKMA
	IbdHhbzeRmV/M3hH+EepIdnpf0+Q/jqA0k/gJLAsFBWidBUAVXihcfnG2z6uBJc1k6WNd/
	FaaUdsjiMW+FDTvFfdf2dPNc5G7c7qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-rBtlG41KOraoOo5uWVQjgQ-1; Thu, 02 Apr 2020 03:20:48 -0400
X-MC-Unique: rBtlG41KOraoOo5uWVQjgQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 205CE1084432;
	Thu,  2 Apr 2020 07:20:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF16B5C1C6;
	Thu,  2 Apr 2020 07:20:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 703A3944D1;
	Thu,  2 Apr 2020 07:20:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02VC6WVt002735 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 08:06:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 680521A269; Tue, 31 Mar 2020 12:06:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast03.extmail.prod.ext.phx2.redhat.com [10.5.110.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F17A19C58
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 12:06:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 568D418A6ECD
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 12:06:29 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1585656388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Dk2PaQQNPhY002qV5jFMLLFvkWaxO6OLQ6sU+bCqSEg=;
	b=M5Yv+9KoaIruZ/SNd1UW9PyS3fEgXg1DVv6mx23nivbnrvBDclCbJqq04OUHVz5KpocxTJ
	fDb80Dxp0mInq3QwsOYN6HkJiAv9sJMVkvJLG/PrxPgA5e/lZehQLaQOwId+DWodvHZ0wg
	sEyats57npyWcP8H/kI/XqBMwXbpPvIvAStOlDGpZ2tk107cmXuTOcYBtW7ij0nzkcIsOB
	NQu279mOCByey8pmuCgJm5UfaNptC95JkrT5lcsEbSqxhAfu8Wl6v6azpzrIKRcPDhHDmR
	rdmyU+xkWRgGH4U+viglDXcPxXF35vUX/57kyo/NPflCr5rT9N2FTQSJm8pE8w==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1585656388; a=rsa-sha256;
	cv=none;
	b=Wfv6oyl2/VxzAgypZ1t6xU9ff7pwb/FM52eNb918E7IO42/IRQGUASAbTnXCdKAexwp/ek
	zI1O8NVSQMuFQy2W+C8t+6iLuSEHOsEt7ovVhV8m2trrctN4pKeAdIttsfH6RX1yh9EfHZ
	irhLDkXfwyKLMNmv6tGMNt/khVmlj9ys7thVEOqFHY+Zsg+KrcJQ8wANBMK3dAfRB04xip
	NjEEm+cBmfhnDBBpi+0cZK0uuCX37ezFqkikv60O+IS8EC3Y0A4lWanp7IFaf9SUjsnFh6
	pufielnz3wuGGX9VZ/5QZkAR32sePi/eV3DDQct2QZbem5npsXw0yPq2+gTUwA==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=web.de header.s=dbaedf251592 header.b=Daey3OiC;
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of lukasstraub2@web.de designates
	212.227.15.3 as permitted sender)
	smtp.mailfrom=lukasstraub2@web.de
Received: from mout.web.de (mout.web.de [212.227.15.3]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-256-692h5bEqMGSYZaU4FZYokA-1;
	Tue, 31 Mar 2020 08:06:24 -0400
X-MC-Unique: 692h5bEqMGSYZaU4FZYokA-1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1585656382;
	bh=JcguktxdKcAMKzgaB7/yuZrpcK5k2nKwp2XqEnDn2lY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Daey3OiCEBuYbatVWiTdUmurWUjJc65B1fyG3TDPzdDFy2HKZGvk2ToSpVOKlrV3f
	WFqFCyUh3IYzlCLh29XoExHHpah5CeKBElpvWeQf46uPlJPyLRO62QW5T8BRBHarCG
	f3g2ZoLEsen/z5xPtUk7vTDwBWPoGMmG8V1/b7f8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([89.247.255.253]) by smtp.web.de (mrweb002
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0Lvk9E-1jIJt334Sy-017WK0;
	Tue, 31 Mar 2020 14:06:21 +0200
Date: Tue, 31 Mar 2020 14:06:12 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200331140612.7c4722f0@luklap>
In-Reply-To: <alpine.LRH.2.02.2003301215050.8032@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200227142601.61f3cd54@luklap>
	<alpine.LRH.2.02.2003301215050.8032@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BBiydipvMStQHKPKomSV4WLYdGwIa9yboqHFp2TyPZh7aBNgyK8
	koQzDE1lYSrUtLDKwTpzDbJntLDkguN21DTrUmGJpj8knc9N00O+uO3s4Ax38ieyMten9I/
	1pAKLfIII0fP37Pc+NgnobLhHC5cfSHY1R+ywOf16DZUG9udULykXhREil5zh4pj0/QsM3+
	kIPyR3A5aBWmYhudd+NrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R7zpMn8TbzY=:PaIidx7Mqo3Nu9OPidmOqC
	EQ8XNXFtNmupBCtvCSb5oeld/5y4SCc27P9aZAXUdQKqW7nsDXfCTaDSSIqzRJxE0kkPnfEgH
	QKDmUCzeU2Ehr/UOUxEj3ckH20Jdcjy65PrVparE5aObH2cU8wXgssNFQOB08M20Bpv+40dUL
	/0kT4OeAMYW38n6uqcKYWviE8PAHSny+PSHv8V+YcT5R2+k+65xE0sNIMmBEr/AC6/iANOWh1
	sDaUiFM+D56vvx6sv9tA56ARolzNzwg2VbkQp3lu2iAz4xn0L+1Yt6B6eW7QdqMUUloMENA3Z
	NNvpo8JnDRMShyQzsnjo5IX/+wG/wc+dDrRcIsi8ljjbBc5maRRT/AEdIq8ZUa7lZPsaTNoAK
	rpuSU+lmOszjeuTJQanbDej6NLaQ/9r+Xa0A1L10R8iHoVe6nwfxsUuxG1xw04yrp4WMigsq9
	GePZZBiB7WGeT9pZqEbm8TwKRNLgrr0zZh0usthIkTAeSmEollOTc7qbGrb74/G7yUt0cGhG1
	QXjDv5gnpERfinIwOfuAfLpblj0Mj1jmVm9VbthAs3FzodHZm21KUFc4dWua8Z2RJXcIx4GJF
	Qjs/b2L/HMlpqOZYB/qZGeBzhMoa3ZkDK+Pve0VoCbcwnpKS5pwk6161lGXkPtA0OXNJf1Q+/
	QIt4T+Z2/lb60RxZ/etaUiyq/V4lvVZDgYeBuoLw6m153z6hlbweumdHc0cLIRi5Kis2GKHFZ
	6ggsPHmx/Uo53Ht9bnTyErXbj0RAw/ko5B7cxA5RUnibnPKWONapYbBcxILtcScPRpr5vVFxq
	tJB5gHcl/y1BJIbi4nrAGUgxhyDd+aMqHASAExp41toCrshZfBrO4DbBWfwvfuenL3IgHWi3U
	ja8Mojo2Q/2M47i9Rt/N+SdHAjSV2fE2bNDN0Apat0nSk2cM0dCSIudTlbL3kehcEpx7XTOcE
	4nloCiu8/yqi01b03Gz/mqes38G3B5k/8Op/WAw5DlKSw448KEWYj/M+hLY7cJ5eLgg+Rp/el
	WkRdjiWkH1ucS0XeffkJDJzfJQVracIO+hnEEKPvYgpUu48gN3ObadpEo4dD+0/54u+Vnbon+
	q4zZLRsaBBWYTTgOhrgflc++8rT/6UdkZreWjYJyTIxrCThAna1kWxdhLI3gDaIAhExmpIdK+
	zqySXbTs6pmfIt7den1xXgJg5I17VVlwnI083wHzG2avTpnx5VAvjDrVNeay5COgva+1NHV4o
	TI1d2crmaZZE2CMHm
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=web.de header.s=dbaedf251592
	header.b=Daey3OiC; dmarc=none;
	spf=pass (relay.mimecast.com: domain of lukasstraub2@web.de designates
	212.227.15.3 as permitted sender)
	smtp.mailfrom=lukasstraub2@web.de
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 02 Apr 2020 03:20:12 -0400
Cc: dm-devel <dm-devel@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH v2] dm-integrity: Prevent RMW for full
 metadata buffer writes
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
Content-Type: multipart/mixed; boundary="===============2450860789433131427=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13

--===============2450860789433131427==
Content-Type: multipart/signed; boundary="Sig_/s8I2+mEP8SyXlfVJMg4t7./";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/s8I2+mEP8SyXlfVJMg4t7./
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Mar 2020 12:34:04 -0400 (EDT)
Mikulas Patocka <mpatocka@redhat.com> wrote:

> Hi
>=20
> I tested it on my rotational disk:
>=20
>=20
> On Thu, 27 Feb 2020, Lukas Straub wrote:
>=20
> > If a full metadata buffer is being written, don't read it first. This
> > prevents a read-modify-write cycle and increases performance on HDDs
> > considerably.
> >=20
> > To do this we now calculate the checksums for all sectors in the bio in=
 one
> > go in integrity_metadata and then pass the result to dm_integrity_rw_ta=
g,
> > which now checks if we overwrite the whole buffer.
> >=20
> > Benchmarking with a 5400RPM HDD with bitmap mode:
> > integritysetup format --no-wipe --batch-mode --interleave-sectors $((64=
*1024)) -t 4 -s 512 -I crc32c -B /dev/sdc
> > integritysetup open --buffer-sectors=3D1 -I crc32c -B /dev/sdc hdda_int=
eg
> > dd if=3D/dev/zero of=3D/dev/mapper/hdda_integ bs=3D64K count=3D$((16*10=
24*4)) conv=3Dfsync oflag=3Ddirect status=3Dprogress
> >=20
> > Without patch:
> > 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 400.326 s, 10.7 MB/s =20
>=20
> I get 42.3 MB/s. (it seems that my disk has better prefetch than yours).
>=20
> > With patch:
> > 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 41.2057 s, 104 MB/s =20
>=20
> I get 110 MB/s.
>=20
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de> =20
>=20
> BUT: when I removed "--buffer-sectors=3D1" from the command line, I've go=
t=20
> these numbers:
> without the patch: 101 MB/s

I get 86.5 MB/s.

So in my case it's worth it and as you saw it doesn't (negatively) affect o=
ther cases.

Regards,
Lukas Straub

> with the patch: 101 MB/s
>=20
> So, you crippled performance with "--buffer-sectors=3D1" and then made a=
=20
> patch to restore it.
>=20
> The patch only helps 10%.
>
> Mikulas
>=20
>=20
> > ---
> > Hello Everyone,
> > So here is v2, now checking if we overwrite a whole metadata buffer ins=
tead
> > of the (buggy) check if we overwrite a whole tag area before.
> > Performance stayed the same (with --buffer-sectors=3D1).
> >=20
> > The only quirk now is that it advertises a very big optimal io size in =
the
> > standard configuration (where buffer_sectors=3D128). Is this a Problem?
> >=20
> > v2:
> >  -fix dm_integrity_rw_tag to check if we overwrite a whole metadat buff=
er
> >  -fix optimal io size to check if we overwrite a whole metadata buffer
> >=20
> > Regards,
> > Lukas Straub
> >=20
> >  drivers/md/dm-integrity.c | 81 +++++++++++++++++++++++----------------
> >  1 file changed, 47 insertions(+), 34 deletions(-)
> >=20
> > diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
> > index b225b3e445fa..a6d3cf1406df 100644
> > --- a/drivers/md/dm-integrity.c
> > +++ b/drivers/md/dm-integrity.c
> > @@ -1309,9 +1309,17 @@ static int dm_integrity_rw_tag(struct dm_integri=
ty_c *ic, unsigned char *tag, se
> >  =09=09if (unlikely(r))
> >  =09=09=09return r;
> >=20
> > -=09=09data =3D dm_bufio_read(ic->bufio, *metadata_block, &b);
> > -=09=09if (IS_ERR(data))
> > -=09=09=09return PTR_ERR(data);
> > +=09=09/* Don't read metadata sectors from disk if we're going to overw=
rite them completely */
> > +=09=09if (op =3D=3D TAG_WRITE && *metadata_offset =3D=3D 0 \
> > +=09=09=09&& total_size >=3D (1U << SECTOR_SHIFT << ic->log2_buffer_sec=
tors)) {
> > +=09=09=09data =3D dm_bufio_new(ic->bufio, *metadata_block, &b);
> > +=09=09=09if (IS_ERR(data))
> > +=09=09=09=09return PTR_ERR(data);
> > +=09=09} else {
> > +=09=09=09data =3D dm_bufio_read(ic->bufio, *metadata_block, &b);
> > +=09=09=09if (IS_ERR(data))
> > +=09=09=09=09return PTR_ERR(data);
> > +=09=09}
> >=20
> >  =09=09to_copy =3D min((1U << SECTOR_SHIFT << ic->log2_buffer_sectors) =
- *metadata_offset, total_size);
> >  =09=09dp =3D data + *metadata_offset;
> > @@ -1514,6 +1522,8 @@ static void integrity_metadata(struct work_struct=
 *w)
> >  {
> >  =09struct dm_integrity_io *dio =3D container_of(w, struct dm_integrity=
_io, work);
> >  =09struct dm_integrity_c *ic =3D dio->ic;
> > +=09unsigned sectors_to_process =3D dio->range.n_sectors;
> > +=09sector_t sector =3D dio->range.logical_sector;
> >=20
> >  =09int r;
> >=20
> > @@ -1522,16 +1532,14 @@ static void integrity_metadata(struct work_stru=
ct *w)
> >  =09=09struct bio_vec bv;
> >  =09=09unsigned digest_size =3D crypto_shash_digestsize(ic->internal_ha=
sh);
> >  =09=09struct bio *bio =3D dm_bio_from_per_bio_data(dio, sizeof(struct =
dm_integrity_io));
> > -=09=09char *checksums;
> > +=09=09char *checksums, *checksums_ptr;
> >  =09=09unsigned extra_space =3D unlikely(digest_size > ic->tag_size) ? =
digest_size - ic->tag_size : 0;
> >  =09=09char checksums_onstack[HASH_MAX_DIGESTSIZE];
> > -=09=09unsigned sectors_to_process =3D dio->range.n_sectors;
> > -=09=09sector_t sector =3D dio->range.logical_sector;
> >=20
> >  =09=09if (unlikely(ic->mode =3D=3D 'R'))
> >  =09=09=09goto skip_io;
> >=20
> > -=09=09checksums =3D kmalloc((PAGE_SIZE >> SECTOR_SHIFT >> ic->sb->log2=
_sectors_per_block) * ic->tag_size + extra_space,
> > +=09=09checksums =3D kmalloc((dio->range.n_sectors >> ic->sb->log2_sect=
ors_per_block) * ic->tag_size + extra_space,
> >  =09=09=09=09    GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN);
> >  =09=09if (!checksums) {
> >  =09=09=09checksums =3D checksums_onstack;
> > @@ -1542,49 +1550,45 @@ static void integrity_metadata(struct work_stru=
ct *w)
> >  =09=09=09}
> >  =09=09}
> >=20
> > +=09=09checksums_ptr =3D checksums;
> >  =09=09__bio_for_each_segment(bv, bio, iter, dio->orig_bi_iter) {
> >  =09=09=09unsigned pos;
> > -=09=09=09char *mem, *checksums_ptr;
> > -
> > -again:
> > +=09=09=09char *mem;
> >  =09=09=09mem =3D (char *)kmap_atomic(bv.bv_page) + bv.bv_offset;
> >  =09=09=09pos =3D 0;
> > -=09=09=09checksums_ptr =3D checksums;
> >  =09=09=09do {
> >  =09=09=09=09integrity_sector_checksum(ic, sector, mem + pos, checksums=
_ptr);
> > -=09=09=09=09checksums_ptr +=3D ic->tag_size;
> > -=09=09=09=09sectors_to_process -=3D ic->sectors_per_block;
> > +
> > +=09=09=09=09if (likely(checksums !=3D checksums_onstack)) {
> > +=09=09=09=09=09checksums_ptr +=3D ic->tag_size;
> > +=09=09=09=09} else {
> > +=09=09=09=09=09r =3D dm_integrity_rw_tag(ic, checksums, &dio->metadata=
_block, &dio->metadata_offset,
> > +=09=09=09=09=09=09=09=09ic->tag_size, !dio->write ? TAG_CMP : TAG_WRIT=
E);
> > +=09=09=09=09=09if (unlikely(r))
> > +=09=09=09=09=09=09goto internal_hash_error;
> > +=09=09=09=09}
> > +
> >  =09=09=09=09pos +=3D ic->sectors_per_block << SECTOR_SHIFT;
> >  =09=09=09=09sector +=3D ic->sectors_per_block;
> > -=09=09=09} while (pos < bv.bv_len && sectors_to_process && checksums !=
=3D checksums_onstack);
> > +=09=09=09=09sectors_to_process -=3D ic->sectors_per_block;
> > +=09=09=09} while (pos < bv.bv_len && sectors_to_process);
> >  =09=09=09kunmap_atomic(mem);
> >=20
> > -=09=09=09r =3D dm_integrity_rw_tag(ic, checksums, &dio->metadata_block=
, &dio->metadata_offset,
> > -=09=09=09=09=09=09checksums_ptr - checksums, !dio->write ? TAG_CMP : T=
AG_WRITE);
> > -=09=09=09if (unlikely(r)) {
> > -=09=09=09=09if (r > 0) {
> > -=09=09=09=09=09DMERR_LIMIT("Checksum failed at sector 0x%llx",
> > -=09=09=09=09=09=09    (unsigned long long)(sector - ((r + ic->tag_size=
 - 1) / ic->tag_size)));
> > -=09=09=09=09=09r =3D -EILSEQ;
> > -=09=09=09=09=09atomic64_inc(&ic->number_of_mismatches);
> > -=09=09=09=09}
> > -=09=09=09=09if (likely(checksums !=3D checksums_onstack))
> > -=09=09=09=09=09kfree(checksums);
> > -=09=09=09=09goto error;
> > -=09=09=09}
> > -
> >  =09=09=09if (!sectors_to_process)
> >  =09=09=09=09break;
> > +=09=09}
> >=20
> > -=09=09=09if (unlikely(pos < bv.bv_len)) {
> > -=09=09=09=09bv.bv_offset +=3D pos;
> > -=09=09=09=09bv.bv_len -=3D pos;
> > -=09=09=09=09goto again;
> > +=09=09if (likely(checksums !=3D checksums_onstack)) {
> > +=09=09=09r =3D dm_integrity_rw_tag(ic, checksums, &dio->metadata_block=
, &dio->metadata_offset,
> > +=09=09=09=09=09=09(dio->range.n_sectors >> ic->sb->log2_sectors_per_bl=
ock) * ic->tag_size,
> > +=09=09=09=09=09=09!dio->write ? TAG_CMP : TAG_WRITE);
> > +=09=09=09if (unlikely(r)) {
> > +=09=09=09=09kfree(checksums);
> > +=09=09=09=09goto internal_hash_error;
> >  =09=09=09}
> > +=09=09=09kfree(checksums);
> >  =09=09}
> >=20
> > -=09=09if (likely(checksums !=3D checksums_onstack))
> > -=09=09=09kfree(checksums);
> >  =09} else {
> >  =09=09struct bio_integrity_payload *bip =3D dio->orig_bi_integrity;
> >=20
> > @@ -1615,6 +1619,13 @@ static void integrity_metadata(struct work_struc=
t *w)
> >  skip_io:
> >  =09dec_in_flight(dio);
> >  =09return;
> > +internal_hash_error:
> > +=09if (r > 0) {
> > +=09=09DMERR_LIMIT("Checksum failed at sector 0x%llx",
> > +=09=09=09=09(unsigned long long)(sector - ((r + ic->tag_size - 1) / ic=
->tag_size)));
> > +=09=09r =3D -EILSEQ;
> > +=09=09atomic64_inc(&ic->number_of_mismatches);
> > +=09}
> >  error:
> >  =09dio->bi_status =3D errno_to_blk_status(r);
> >  =09dec_in_flight(dio);
> > @@ -3019,6 +3030,8 @@ static void dm_integrity_io_hints(struct dm_targe=
t *ti, struct queue_limits *lim
> >  =09=09limits->physical_block_size =3D ic->sectors_per_block << SECTOR_=
SHIFT;
> >  =09=09blk_limits_io_min(limits, ic->sectors_per_block << SECTOR_SHIFT)=
;
> >  =09}
> > +
> > +=09blk_limits_io_opt(limits, 1U << SECTOR_SHIFT << ic->log2_buffer_sec=
tors >> ic->log2_tag_size << SECTOR_SHIFT );
> >  }
> >=20
> >  static void calculate_journal_section_size(struct dm_integrity_c *ic)
> > --
> > 2.20.1
> >=20
> >=20
> > --
> > dm-devel mailing list
> > dm-devel@redhat.com
> > https://www.redhat.com/mailman/listinfo/dm-devel
> >  =20
>=20


--Sig_/s8I2+mEP8SyXlfVJMg4t7./
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl6DMjQACgkQNasLKJxd
sljl7xAAjXgtf6dcLjcJrMsMQkrHHlFlL1WbzsUwXL90+iEOfgJYBh/d+6HLnWLE
/Sl8fbWT8/Vy7f3XxAVoWp0h/+b0l863gr5gHF/89W6uUAfwcTX93PKERqRaVHCI
7M0ztwt9UC2K9clcrlqkbA3Iowpyrf7Xs8eQC8Xy5DZqLL8AHc36+qWqVkb8pcls
zQrA4Ygjcm21HUDAop/EWvYE96blJVyh6wKt2mTxjnPGkIh4J1YOkRe9NX+MAPuF
0I/4Bt/vo5B2HwCSv7Y6loEJMX1tEoGnPSnDEaHUpgYej0+/V5pjz4uvfPFnyczk
dMdvwLuEnxWgfAULSC3vN60kmJChGNXDDgv1NcWCaI0mMpNvnx8htweR/MVYcLx2
SwJ/fzw3nAkfo5m7gF3Ed875i1jXAWadhhf9Kdhy9HsrkX/8/+vOaP5z4tt9LZdR
CDTQRsJeWJ3+d4iU/lA5ZrzS1U91yoiu/3z6mYB2CmdFD+HOzcvXG6equ6/8Gtit
3TCiWmSTH2zo4WkAowu/wmK8RSguztbGsPnQYHyio2MI+cSPi7TtJ+CzdcvotVmc
vOOIE63pr4sb+OPQkQ9+sFlJs212JnfkV+xz6OIcmYK5fUj81t0N3yA8VWMIyfGt
4sTscTqtQaGINaCP+RWb8wk6najur3TuChaZYWMGsXTYdefn1/Q=
=jGdH
-----END PGP SIGNATURE-----

--Sig_/s8I2+mEP8SyXlfVJMg4t7./--


--===============2450860789433131427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============2450860789433131427==--

