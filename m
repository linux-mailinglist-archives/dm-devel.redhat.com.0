Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9D22419F09A
	for <lists+dm-devel@lfdr.de>; Mon,  6 Apr 2020 09:10:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586157057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=51LP5FkWt3vAKe3/YdInW5RUn9zTHXcFI/9P+CP6PyE=;
	b=LsyjrPPE1V431c6+QUeBn8puSs5+5tA1SE77stdOhfOhVQ+jBQj0BcLBxb3bBDsxkqmrAj
	np++3x3Wc0AaIEJ/RwDXdH3LvyWmoPeMVTrv+bFsfXbwfIOlKjRBbyPQLMsKhgFxEEACZV
	5Q3GY8+V4/0VFKrKZlsWa2vxX8cxmbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-c8VzzpjfMHeBbdou8EL4Mg-1; Mon, 06 Apr 2020 03:10:52 -0400
X-MC-Unique: c8VzzpjfMHeBbdou8EL4Mg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55159DB31;
	Mon,  6 Apr 2020 07:10:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 539AD5DA7C;
	Mon,  6 Apr 2020 07:10:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 324161809567;
	Mon,  6 Apr 2020 07:10:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 033Bx8uF013462 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 07:59:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7F91413BBB0; Fri,  3 Apr 2020 11:59:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79A2E13BBAB
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 11:59:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7115C101A55D
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 11:59:05 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1585915145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Bpo1bbCQ5uYnvRm62mNzE4cm0XXWIhuq9AquAiB14p8=;
	b=GC4Shb1wZOJs9CIri5SuqAd2kyaypB3nywjaLHz3gTrY/brDOqUiSSBJDdNs+1QvglHORO
	GBmg0QBeHZ71/lR7xCDgeiSbbRwZtPhGLoc6UAJ8qyaugrTPwyYClKLvhB68ODjlKRYbg6
	5leOSgZ7unXbFewZ9lID8x0Vn6QMpIbVKs0/XDe/56onLggnOHV8KZRHD+o4zIMgOBzzeB
	HkOuboE8Oh0IlBYpp6cDfL35jLLdH4cuTEuIWzHfUZ+hlNKZbjtIDFH9dOsA5HheDuASkH
	P4qLOw0PbDFEMS2A1HGOIBLiKfcoKExHPFtp8tPs82t5ABbv8ssRwd8x6XwcIQ==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1585915145; a=rsa-sha256;
	cv=none;
	b=bD0GwTM66A5LMyKLU0S1W6DZv4j9F/B1VM/sDBVfeHX5clKYJGdyNg2uDd5rMK/OzQxg3+
	0ydnVObOxEh8uo54Spph1fKNAceQxD/Szb9gIRyRf89jgkXBnGXgHZgGLuQX+46xZE+Bfi
	bV/P5PlhcmlqnECFR6stnITvz2fNu4MEfm4SLjf2Zm/nP7zi6xaHdJS/7PUd4qmhqjBqu2
	j5R+h+xyBZ+PdD4xb6YmJZBEkQ+RMnNiCp0RSNT1RdJ2r7PTUSJphh2L0tYCebfPXHBqaB
	02jdD/dwgBLHdP4aBeh74t30YGNfpfLCP+Fdvhe2rjKNree6Gujo3bM9suOmiw==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=web.de header.s=dbaedf251592 header.b=GbdSiA77;
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of lukasstraub2@web.de designates
	212.227.17.11 as permitted sender)
	smtp.mailfrom=lukasstraub2@web.de
Received: from mout.web.de (mout.web.de [212.227.17.11]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-215-KXY5E4_QPnOf8mOdbGorLg-1;
	Fri, 03 Apr 2020 07:59:02 -0400
X-MC-Unique: KXY5E4_QPnOf8mOdbGorLg-1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1585915141;
	bh=IjhI3cUORbS7gcd6GyEFrIelSDetdB6IlrhEU19MPco=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GbdSiA77w26FsTppi97tlNBNspNkqKiH/BLVWiygUAsDc7MF6aWMVZXNJRnrfhSnJ
	BFX7311c64KTaR4srUtPFffwj3O5ijK4Ulg96ZbGDSWJjZ2fg2xU26aMzM4LXuevrH
	s/8ATzTGOy+ZFPi2+PMMlDQ7lqHjZVj1xslj00Is=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.220]) by smtp.web.de (mrweb101
	[213.165.67.124]) with ESMTPSA (Nemesis) id 0MQedF-1jlbAn3Foj-00U4Ww;
	Fri, 03 Apr 2020 13:59:00 +0200
Date: Fri, 3 Apr 2020 13:58:43 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200403135843.0aedc431@luklap>
In-Reply-To: <alpine.LRH.2.02.2003301215050.8032@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200227142601.61f3cd54@luklap>
	<alpine.LRH.2.02.2003301215050.8032@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:V/lTn0Jitlmmr4fuFtxzrqd2bZj0neNaez6OCrgdL4e7J3qKdv7
	a79QNiDJuQfONBibUPAXVmpG3MdzmkxqYdyubZFGFeF/37ieb743w9JfrwNZcMm5XijHDu1
	R2R3O+COBDCaicYEn2+kxYgE+9WNAg2TTpwY7xfXJdiyR2YJdlgAbvZuI2Le4y5BWdbUwKy
	E6WGscQ9tKrYDhnM6/pkQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6ioywgYQL9k=:buYPVgPc9+XjK+b+ECUkpH
	OUcHAl0HdzUKtBpmu7EnORgXFT+wWle1fGnvfn23raNtAmfxYDXz4eYB/XIvOmAkNTbySLIpF
	L5GzSds4CEzUivi1bQw4riByc4YcxWFpLmm+2UXBceSBCMCzWCGMgpmwilhA+yEqBsTxycIwI
	9qcy9UX9Rd0P+XaTru5JuoZuyMuYInxBdhZrAQkUfdsIL9QwThawREao8bRuYEkotrQLPCSAu
	tkGLizxfTjL6ECvRT8Cw3Y82EbwkjFWjojYl6z/DG3YotA58xgmEJRrR+djzg3/JUsroDzqQk
	GMWZQDDkjNX1sx16JKyItuj/n40RTWRfMTUVrhcIWFCEqjbd7KOBZgrRsv3+g5/fySxhQkxz3
	IraH9iQQuEocHnMyCI9DIqhDZLEO/ATffehhT+3DCa+uCQ7UkSKaOR8JqKFPpuzpsQzNexh0+
	XPRTVKlOXIXwEBUf5vngISQmV7jeQTE60jasEziP68rIi0DWgwZzjSVYzzkimBYIqrtG9OKta
	1atvEHKcSwwSJTAXXXISkv9ybzNlWARWcZtXui7qybFbbIqahJCGHPR8Hb7HxbL0KprTWC+Tb
	S7OeM0pV62SW1MtZEx36H00/DJZ73wJ0T7Gb4L2a6zOZefgRpL4dxUz2UFANQEzdqKTAKrCGO
	+LE7AoxGTew2xtQ2rQ+t1XKCrTsEjXc3AKx20bCjoZzcmz0/hRcdRr7CVrWLrfvpIINwALbO4
	jcQe5+rlnEfJ6DUJYyw6pMT972R9JU0qlCOvZ/oOFn7ZKDLQuHVFp1s3A9/0VRrd8YLvEcXmO
	IVYKR4C+nwC8e7lfoKedPMUZv+LM4iR5BtDWDjOmyZY6byHNJtdcNd0m93aUuHLdYgYMjgk39
	kZ6lLe5mbqitLkJFnuCMnuF9anggsgUckC90pMHYnXMAyjQxomolINqfnBLqAshmS+bCj20oG
	MkupVe2NaFDfzIQZiB27ZqXgQf6DmfR5/FkLXlnPdoapIgT+QF8/M6ab5rNiO5fqc4ruqrlHn
	XBMT7hNpov7vqWawkLYq4a9muftul9/gShIDbsOo33tkQht5DPVD563AV9JEcHKM4GUnqb9Oi
	200gpT+um5WTJn1/DKMo88OyAO8OnpFn+raWCEsX/CU4mEec0caEo5eDRBBiIc5zVztDKvvrt
	7HOwEDT5ZoT9gw/X3un/vWwFn448Kqw64HBlLJ1usHD8wbNiH2wUpeUDBrV/GJ9Wp6mhpI32e
	oh5KHC8wYl/6IEqf8
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=web.de header.s=dbaedf251592
	header.b=GbdSiA77; dmarc=none;
	spf=pass (relay.mimecast.com: domain of lukasstraub2@web.de designates
	212.227.17.11 as permitted sender)
	smtp.mailfrom=lukasstraub2@web.de
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 Apr 2020 03:10:17 -0400
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
Content-Type: multipart/mixed; boundary="===============0809558987182159617=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14

--===============0809558987182159617==
Content-Type: multipart/signed; boundary="Sig_/K8.MezM12hXFUFouFOu51pI";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/K8.MezM12hXFUFouFOu51pI
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


--Sig_/K8.MezM12hXFUFouFOu51pI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl6HJPMACgkQNasLKJxd
slj40g//amGmgRLqqYf40CBt/NHXkQhzG60K7nlV7/mY8Uax763IQJOiF4nQbsQh
GDeIobQtzTj9Cz7yWO4RB9wBwullma4/tM1SN8XlGhf2wfOGgaZmK2me0ads7qw0
T17ru8JGpr3ao+ppeD5RvHPef5ElAj/6W8K45CiQu06jpg279thpT334z647teDq
qCz2YjMbNBDkIgNL/icGHt3JxJopNJDEsETFbdDFnnkhOL0nytit/rzA+YBpPR7e
0ABpeEVsUB9LUv0gvMN4n4fWCIvr0USorKBULwp/NawTapZXJNqDlJUEliACj1uY
HvtTlZiN5H9LUcsMZXkiFOjNMqqdPRtkzHpNz1hdBiW80h7sK5EIcOl086BGSZt9
rF7LbRvzy7aDQjAwypmmi5RDhuTwRVmV3EzEAVp26HBm1dK6UuqWrUhmSzWKpx9h
hc5M9xD+6PR/B7Q29hy5KtgQf3gTnqbSL48pDXsgEXWWRm0NQQ3/bGx/GOObW7tM
l+csZOtkW5NpEHgDPJSXD0MWLUSmfn6s/NSCyFsJdqkjwgZCbfV9kcDipbIe81JP
PB1C/Yr+KqHXqnS/nR4Hr0l+NV6C+I1zR4Rf+3kpotESm87X8WPfTQ5VOK0/zgKW
oLBM1RnquRKGd6krt4qlzziSrN5pmzaOCGXztnnBtLrJzj7mNbQ=
=9QhW
-----END PGP SIGNATURE-----

--Sig_/K8.MezM12hXFUFouFOu51pI--


--===============0809558987182159617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============0809558987182159617==--

