Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id F3F65192234
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 09:13:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585124008;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sz/KhfLwCU1p+SHQnBL2Y2N3O2kGTWSxQJYGnIU/XKA=;
	b=SLsxzmc+5MeZOzYiikxEXCgcHScvOAfoI14FCR2iX5eW/OcNWHslnXTdIwEtA4AvSk7kyo
	MHJgEtN1I1N3vmz2UOz04lx/GZQ2qsoptpz2juqYv1+RGPWomzDVkMCWgzqohZOXnyOQP7
	bDCq1V3LlJn4BMUo0LpBUEMxcMwmtDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-aVahhx-0MW6_OhBlNpugPw-1; Wed, 25 Mar 2020 04:13:26 -0400
X-MC-Unique: aVahhx-0MW6_OhBlNpugPw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C84B5100DFCE;
	Wed, 25 Mar 2020 08:13:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F56EA7F3;
	Wed, 25 Mar 2020 08:13:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F18118089D0;
	Wed, 25 Mar 2020 08:13:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02OIxncM002949 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 14:59:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56356110F0D1; Tue, 24 Mar 2020 18:59:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 512F810054E5
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 18:59:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56DF8101A55A
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 18:59:47 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1585076387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Dlwb4N/eIZO+nGfRC4MjBfaWPjuFTHlsNEXA1PUDpzc=;
	b=FaDGZBj9I5mVDOKiwdi2erzi/Yw2NlXRSvumr227rCYN1KMe+6rNsXutfc1X4Howtick5y
	Tj41HkZTnwhzGCMcd+OqHE3iv9A73SxedjS8XeHtxi1g9wDfaIu81RgRDSe+FqPMEWElG7
	sy+Qf7hVWrUUpd3l5ThfzZfmsj4AI3sMRPvgJh5sfqzutQNAtK6YJC0AWkyQ2DX9MZconw
	4lvU6Nb81bYW9q5c+9n0+mx7fyCl/FS+SiX+yTMyo+6cnaNbzoL4lmfDbch/avVIrPipcd
	3oxaV9STvOY/F+STg0aZVbh9T+SLz5/rIaAFiT2tr5wEBTx+Ufj5cZiBqoipRg==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1585076387; a=rsa-sha256;
	cv=none;
	b=VDW6NFjzdHVjelVVHfxI1bsHQ9lwtvCDuxam5WI1O4xQkwIbWSONskcNb2PV/1cYTxRpV2
	7J5nT1W4NwHp5vEuvJmpQCp77R4HFfipGryfsq5IQKVPn8kCGNMR0zyBGucMmxTJUwZwt7
	7BBLaOZ4SlmY9pcPIG8PKUe9XunujhRBc4yBZ0CuF9YyIJcv2lm54fw9VVlFIpK0EAuLsQ
	+z3q7/CMd3hFlg+b5Fc0iBxSkuJbAgNnlfF9U+DDcx9aaVsaq8qMqhBBT5pp/NXz4VL5LA
	xwSKKv5Bcctf8XCiE9QR4vZmoJ+xRyT9Qo1vjCMi/TsU6hWeXJgp8c0RvlSdvQ==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=web.de header.s=dbaedf251592 header.b=DHlfHk+E;
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of lukasstraub2@web.de designates
	212.227.17.11 as permitted sender)
	smtp.mailfrom=lukasstraub2@web.de
Received: from mout.web.de (mout.web.de [212.227.17.11]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-165-30boBVogMcOOORzGax3FkQ-1;
	Tue, 24 Mar 2020 14:59:42 -0400
X-MC-Unique: 30boBVogMcOOORzGax3FkQ-1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1585076377;
	bh=GTpZWZHLPHgy2gNLa2S/h4IO4UZFntxIXA9jFZ/a+wU=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DHlfHk+EFX9D9LO/swfw6bGKd+9kIVbinsGHd0yUACS4vl4z0NKxjjd3wUEOkGGWp
	aXN80xMHIRJOgx/90eUpOgCLsp3d9f/smwUpf/OkCMErNnltUbxzutEXZfyZ2U5N+E
	i001sHcNYUOZd+l4hRZ4Yeq6cjCWsFKEE5XVFaFs=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([89.247.255.90]) by smtp.web.de (mrweb102
	[213.165.67.124]) with ESMTPSA (Nemesis) id 0MWB8f-1ik2JE1yMz-00XO2W;
	Tue, 24 Mar 2020 19:59:37 +0100
Date: Tue, 24 Mar 2020 19:59:27 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200324195912.518dc87c@luklap>
In-Reply-To: <20200324171821.GA2444@redhat.com>
References: <20200227142601.61f3cd54@luklap> <20200324171821.GA2444@redhat.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:plIiOZQ4XIWl9QGmBFh7ZFJ1E4RnNZbPnAMq/Y+REwZB+/fOLNp
	cYASa+v/MplS1LG0fE5i8p3Mjnf+LC7ocuVRTskow5ygWVT6WnMSlJtgGVAGI3HHFROeMbX
	5WEy1HSRHojq/iHLsSrtoKcUhI/cMGnV4I6JwP92kH3CfzpEEiRzLhcia4BTwIA0jWAPfjy
	rfu7C3MA7ces+MxHx136g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XDa0g1t24Lc=:HCf/GjXe8AN5T2ffUjddBB
	nhRGbQqUJUj5T78odrbUqB4S/BYWMsFpMRcCvrYnAj6lkR5+xHMtPMZwulr1QT8dGYS7KgVoU
	5TWU6Zek+969WLKxGnJu1/5+FrTtWrA38fvzTVgMPUj7zEH4LhZuFSIy+J/B8dhri+a+B2CwB
	EiS6EyBWpJMQKuBZTFNA44DKXucXv2EMBQL0WAbhGqUIhpXochMJjdjkAV8j5D6kDW0gCJQYH
	f+j1incsRrxYgR2hm5S8U9XimnCJTm3KySUwjF3vOL4DIBVGvHC9zt77d/4GnspbOh9kjTrhs
	r+kPzltzCXWL0RdnRNwGdZiaGVjQDTim8d0Moul89lLyEYxERFplO/CqhkuDdg8WhE1rm4guA
	kqRS0bPGJbauu/U684mrMxGXKgK7//pZcG1cjOWHZD/Cg7pVluthGbDD74PI3TfBI+jnEG+lI
	h6TaaH68wGuwDjdn6xGtT/DeXmuGrcJuixDxTgB9PqiahjCQm7urSRL5nGSedw4qW72xLrwOo
	0qODdiDLbB6YUU+kjhMcz4S3xyH5FupBP/mRg5zJ8mWf1ViXp3fENQ0zHLDrrJxC0JcP4hF3O
	8ZeIOYp35+PvPELTgLgHg8DUTtnoixgNsbVlmeTYn5FeFD9frT0VS/bn9sa1N5WZZQ0Yu0F4S
	Y4EKh2tNscGQVox62c+8X7Hoi4EPYIf7w9kqRfk2x5soNa4bi6aIogeGs00aJo/dMaDpy2ea5
	zpB5K/IHBjiS34We8LcYPG3xPnZObGv3dl63rvDOCwJXjwUs+9eTtiaU57ijHpcCswj4/wWz2
	cgT5fI4dKRt9C9eq7qDBq2FN9jaS0MfoCvcrngHCeCPffRNsaEugb71NUNTkuCDJcji/qYSam
	/fG9O3RziPOW8LxZrfgNiwrTFP/Dzn1f0o1wODTjkFzOvWXWMMCM58uE09AIaknQ/CVyr0xrh
	7aWVjy1kv/4P8XFK4vW9ZXrA5v2X92RXYbvjneK+KbVvhXMEhudzkKuBoAh9fir6vo8RNKLxF
	zgsCAsVIwDeFFW5fCWrUVkZnr1ZZjH8yV7biScwnASBDjxczeoGZ2rtBzeLCLerEIae169GX4
	1kfddcPOP8/A2z4w/Eof5Bx3fwYZYS9UQZdpOHalSpGXCq7c2trVXl/EWMyT5Q1aXUkMtuox9
	hSRKV51T/SlBM0HnpwQfVb9Ac/xe+LDH8hWTuyy4CmSSyKDejxob0xrfO0fJLDR/RyAiATJLk
	ckF/8jaGAAVWIzI5v
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=web.de header.s=dbaedf251592
	header.b=DHlfHk+E; dmarc=none;
	spf=pass (relay.mimecast.com: domain of lukasstraub2@web.de designates
	212.227.17.11 as permitted sender)
	smtp.mailfrom=lukasstraub2@web.de
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 25 Mar 2020 04:12:59 -0400
Cc: dm-devel <dm-devel@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Alasdair Kergon <agk@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============3076742261653209826=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

--===============3076742261653209826==
Content-Type: multipart/signed; boundary="Sig_/rvl/9m6FmaAM/PFvXasJ67k";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/rvl/9m6FmaAM/PFvXasJ67k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Mar 2020 13:18:22 -0400
Mike Snitzer <snitzer@redhat.com> wrote:

> On Thu, Feb 27 2020 at  8:26am -0500,
> Lukas Straub <lukasstraub2@web.de> wrote:
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
> > 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 400.326 s, 10.7 MB/s
> >=20
> > With patch:
> > 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 41.2057 s, 104 MB/s
> >=20
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
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
> > Lukas Straub =20
>=20
>=20
> Not sure why you didn't cc Mikulas but I just checked with him and he
> thinks:
>=20
> You're only seeing a boost because you're using 512-byte sector and
> 512-byte buffer. Patch helps that case but hurts in most other cases
> (due to small buffers).

Hmm, buffer-sectors is still user configurable. If the user wants fast
write performance on slow HDDs he can set a small buffer-sector and
benefit from this patch. With the default buffer-sectors=3D128 it
shouldn't have any impact.

Regards,
Lukas Straub


> Mike
>=20
>=20
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
> >  =20
>=20


--Sig_/rvl/9m6FmaAM/PFvXasJ67k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl56WI8ACgkQNasLKJxd
slhytw/+JQ2SvoMda2Nc3JAnYwgArLhFKB57cw92Qu4nNrqpx5ko4G2SLV6qJgEN
FcaIvsnzICzf0OEK4GKjKyvt4C413eVa8Ph73aH4idRI/6pnsVmX03PVVBITiQp0
Aywtt9Dgm7HW8Abyishr+3l3kh9bZjiapUzM6cdZQ1910/zIzQuap9grytATnfvw
WcZIgqEGhcY7AV3aZyZhtYMWXzCn5y0r9Ohnb0VFRTUJzm6pFbTx2Qlj4N+zs4Un
o9j2ltL1BBTL1yzVYnW5m3b+7VORcbhky8eMDYaeFSyQdWjQmtA1LBN+QmT983TW
AsrZ2draSTY6DnNxETX6rzdctV0X4Dc8nIMEqXtMYweGeo7kzCzUtuHeIB5pwyVI
crlf86uCEqMR2gKBYZfjNfu40JAhsSX10gc4ViGPlXtOwSFkiVY+fHqsOW3o1cxp
E0A7l8iAdY/zvR4NRGBtwii5QOpwsWus0sQmZPss38NjnTwRxxssQnmFu/Ex+lTu
qG7QdKRk9/dvjJhBxhtY0W2EX9UFb97jGsjfVQWQLV1MQY7jYF1qvsDuPJVH/cm2
aptA2XDxLjchnIvNru7xclWUBg0TyZsXYZeBxKpBUqusNI7n87dzOw9MeLXclnt2
NEOImqIYros446duioGHRzeG6+BtgGCs9Ta5lEKx+XojF0Ayt3A=
=EzcZ
-----END PGP SIGNATURE-----

--Sig_/rvl/9m6FmaAM/PFvXasJ67k--


--===============3076742261653209826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============3076742261653209826==--

