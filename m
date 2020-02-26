Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 50F8D170073
	for <lists+dm-devel@lfdr.de>; Wed, 26 Feb 2020 14:52:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582725153;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iYJ0bf7F4W6T8ohED3CWe2ajaZ2hGUzA5z42S4srKXo=;
	b=HgmxKO9y50N3gU+7noBfe0kw7E+Tpnvlf6lirSLFnK1TlMMWaNB4VZcIC82cnJjTWFXzvF
	3UN53mTJv2aEeDRsmWAUbPHvbLltLTJy+LS4z6C57BiJ86YLkbBuxi3bo6C+55shEQYZ+C
	K9m1m+l2EvnjpyHEfERyxD+c3HqvpfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-LTDxl2ayNYGdy-CTL7WCrA-1; Wed, 26 Feb 2020 08:52:30 -0500
X-MC-Unique: LTDxl2ayNYGdy-CTL7WCrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3E1D800D55;
	Wed, 26 Feb 2020 13:52:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B39E25C545;
	Wed, 26 Feb 2020 13:52:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A9D61803C43;
	Wed, 26 Feb 2020 13:52:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01Q8RECs017921 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 03:27:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6E6482026E1C; Wed, 26 Feb 2020 08:27:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 697E72026D69
	for <dm-devel@redhat.com>; Wed, 26 Feb 2020 08:27:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2420F185A78F
	for <dm-devel@redhat.com>; Wed, 26 Feb 2020 08:27:12 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-346-VCoB4QqhMImSDh84L0vrFw-1;
	Wed, 26 Feb 2020 03:27:07 -0500
X-MC-Unique: VCoB4QqhMImSDh84L0vrFw-1
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([88.130.61.40]) by smtp.web.de (mrweb004
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0LkEaw-1jhqPT3e8I-00cA8r;
	Wed, 26 Feb 2020 09:27:05 +0100
Date: Wed, 26 Feb 2020 09:27:05 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200226092705.61b7dcf4@luklap>
In-Reply-To: <alpine.LRH.2.02.2002251127070.1014@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200220190445.2222af54@luklap>
	<alpine.LRH.2.02.2002251127070.1014@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ETYl0Nmp3BF/MjJ/ywSqfTGadH2Jkw7G4NCOcWFPRVYc/it9z6+
	gorTJAvGCgN5F2oo98DrfZ8iHj4B3THNc94CCiLEV+IqBEzKmXFWlSh1PRMhqeqWy2c1MrK
	rIRFdyczRA+nqHNhZ5W0A7J+tevklDI7xfGk0y6avTdPTYT7SCwgCYDCqPIesStq3B2Ul6k
	eLoA9WZKCD5faokEHFheQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c9UlD8rtFnw=:ocJhNvvcmDUsl36w2AdP2I
	Lh7iLzt1yODX/OpHqWpcKuyfCI6GbJOPm05/7H6ROqX9TvjPo6y5r+/8Vyzc7/qlpYu7SyfMZ
	mhbvKP4DY7jOqgj1ATXeVhrv6elAJKZWkRqa6ItSFJXeOLF0Fr3T7jN6sEV+KCyC5wQjqUDxh
	SxPZLACj8Y3embk4pCEeS+3EbtxHgwkUQrrtXeoG7+GBib5kPD8DZMnzRsPptBrGsgTyaqZX6
	pbe/XoW24cLlejvz1s1ulLvnjqAlN9rsCQEbxl6o9DOaYuIuYyILDT03u8xPq7CnX1/82lQQd
	2atxEvW7ChkY+AU4ZqIVzszgLD40Fdrk4WdvjAdv4Lo5lLPzBhi4ZZOuob5IujnGMvxYz0JuH
	6A6rJ2BNMCNLlK0b0C7PiUeYFmVwsqBJ7w3BJ3ZsON5Dp2I/RBdEgCwGJnNZtCtn1nx9HbCtD
	TiBvtE6cL4FKccKqgIu5JfA5bvhITT3Yz1kEPz5O6LXrBSWc4SUk5A165sJhrzAk5J21sqJe6
	BvbUhIeOQfTF7nyy7FW5g8y0UtINKGS3BMZEnnSZoRKGNI2O7lIHs54psoo9njUoghi2dyNXV
	zphxrUmfKFUvRrFGwWC+Y7H8qnJZxNfhYLuTwhEVZHX0f7NVHYJQZcY5EEMuIDHhUibU9kdiM
	Ws0ErmVoZav9mVW57wzJAcJTamA1gtGioLDUJwdzcFqxKFB2tjL83IwyWwz2in+6/E2bzdgTZ
	2Gut0xgQxcQHlfDWySf1vfZr57An1dGzkY2vdgKDSuTkMAfPj76Y/+q4BzSUcD8JpEdCmdGAq
	nTe2g8nmJtjF93T3wB9PA5f8DxsGzsooFFlLqsG0VXEP8KUalvYTRvT0iQQYfnbw0ghedSG8F
	myX0so5j1KahzgsGUP2Aeev//f3s/HD4QQYn9N4/kPXeHwsTJHZ91SDJb6yK+La/6BGGJ3FKo
	3kW6m4p8MT34yOInc3L+iRbD8I9b4hebbsIX5OlYFXLGTY8nC1KWEXBoUnfbsRCguBGMygijq
	/7vtJXmzReLpJXZ77uHnJEAR8d1jmQonsCa3VJ3BT67RxNF4d2GAVSw8ICvQAOqkYRX9qXCos
	wju8iQ2e4P546rivKHuk6aQFjr9ewQAFsYMyLSwBV9oXRwBDk/g8v5G7I+Y8+riXtJ7oFV8nN
	4jE2onmlS/UQyW+foUcUBbgO95biI+dIqcZohN5E6z2XMOc20Z2YJ7rrBUZ3IIvXxvmnDFjUz
	YRa8NDkR2+ZMFzPrN
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01Q8RECs017921
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:52:14 -0500
Cc: dm-devel <dm-devel@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-integrity: Prevent RMW for full tag area
 writes
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 25 Feb 2020 11:41:45 -0500 (EST)
Mikulas Patocka <mpatocka@redhat.com> wrote:

> On Thu, 20 Feb 2020, Lukas Straub wrote:
>
> > If a full tag area is being written, don't read it first. This prevents a
> > read-modify-write cycle and increases performance on HDDs considerably.
> >
> > To do this we now calculate the checksums for all sectors in the bio in one
> > go in integrity_metadata and then pass the result to dm_integrity_rw_tag,
> > which now checks if we overwrite the whole tag area.
> >
> > Benchmarking with a 5400RPM HDD with bitmap mode:
> > integritysetup format --no-wipe --batch-mode --interleave-sectors $((64*1024)) -t 4 -s 512 -I crc32c -B /dev/sdc
> > integritysetup open -I crc32c -B /dev/sdc hdda_integ
> > dd if=/dev/zero of=/dev/mapper/hdda_integ bs=64K count=$((16*1024*4)) conv=fsync oflag=direct status=progress
> >
> > Without patch:
> > 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 400.326 s, 10.7 MB/s
> >
> > With patch:
> > 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 41.2057 s, 104 MB/s
> >
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > ---
> >  drivers/md/dm-integrity.c | 80 ++++++++++++++++++++++-----------------
> >  1 file changed, 46 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
> > index b225b3e445fa..0e5ddcf44935 100644
> > --- a/drivers/md/dm-integrity.c
> > +++ b/drivers/md/dm-integrity.c
> > @@ -1309,9 +1309,16 @@ static int dm_integrity_rw_tag(struct dm_integrity_c *ic, unsigned char *tag, se
> >  		if (unlikely(r))
> >  			return r;
> >
> > -		data = dm_bufio_read(ic->bufio, *metadata_block, &b);
> > -		if (IS_ERR(data))
> > -			return PTR_ERR(data);
> > +		/* Don't read tag area from disk if we're going to overwrite it completely */
> > +		if (op == TAG_WRITE && *metadata_offset == 0 && total_size >= ic->metadata_run) {
>
> Hi
>
> This is incorrect logic because ic->metadata_run is in the units of
> 512-byte sectors and total_size is in bytes.
>
> If I correct the bug and change it to "if (op == TAG_WRITE &&
> *metadata_offset == 0 && total_size >= ic->metadata_run << SECTOR_SHIFT)",
> then the benchmark doesn't show any performance advantage at all.

Uh oh, looking at it again i have mixed up sectors/bytes elsewhere too.
Actually, could we rewrite this check like
 total_size >= (1U << SECTOR_SHIFT << ic->log2_buffer_sectors)?
this should work, right?
So we only have to overwrite part of the tag area, as long as it's whole sectors.

> You would need much bigger bios to take advantage for this - for example,
> if we have 4k block size and 64k metadata buffer size and 4-byte crc32,
> there are 65536/4=16384 tags in one metadata buffer and we would need
> 16384*4096=64MiB bio to completely overwrite the metadata buffer. Such big
> bios are not realistic.

What prevents us from using a single sector as the tag area? (Which was my assumption with this patch)
Then we would have (with 512b sectors) 512/4 = 128 tags = 64k bio, which is still below the optimal write
size of raid5/6.
I just tried to accomplish this, but there seems to be minimum limit of interleave_sectors.

Regards,
Lukas Straub

> Mikulas
>
>
> > +			data = dm_bufio_new(ic->bufio, *metadata_block, &b);
> > +			if (IS_ERR(data))
> > +				return PTR_ERR(data);
> > +		} else {
> > +			data = dm_bufio_read(ic->bufio, *metadata_block, &b);
> > +			if (IS_ERR(data))
> > +				return PTR_ERR(data);
> > +		}
> >
> >  		to_copy = min((1U << SECTOR_SHIFT << ic->log2_buffer_sectors) - *metadata_offset, total_size);
> >  		dp = data + *metadata_offset;
> > @@ -1514,6 +1521,8 @@ static void integrity_metadata(struct work_struct *w)
> >  {
> >  	struct dm_integrity_io *dio = container_of(w, struct dm_integrity_io, work);
> >  	struct dm_integrity_c *ic = dio->ic;
> > +	unsigned sectors_to_process = dio->range.n_sectors;
> > +	sector_t sector = dio->range.logical_sector;
> >
> >  	int r;
> >
> > @@ -1522,16 +1531,14 @@ static void integrity_metadata(struct work_struct *w)
> >  		struct bio_vec bv;
> >  		unsigned digest_size = crypto_shash_digestsize(ic->internal_hash);
> >  		struct bio *bio = dm_bio_from_per_bio_data(dio, sizeof(struct dm_integrity_io));
> > -		char *checksums;
> > +		char *checksums, *checksums_ptr;
> >  		unsigned extra_space = unlikely(digest_size > ic->tag_size) ? digest_size - ic->tag_size : 0;
> >  		char checksums_onstack[HASH_MAX_DIGESTSIZE];
> > -		unsigned sectors_to_process = dio->range.n_sectors;
> > -		sector_t sector = dio->range.logical_sector;
> >
> >  		if (unlikely(ic->mode == 'R'))
> >  			goto skip_io;
> >
> > -		checksums = kmalloc((PAGE_SIZE >> SECTOR_SHIFT >> ic->sb->log2_sectors_per_block) * ic->tag_size + extra_space,
> > +		checksums = kmalloc((dio->range.n_sectors >> ic->sb->log2_sectors_per_block) * ic->tag_size + extra_space,
> >  				    GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN);
> >  		if (!checksums) {
> >  			checksums = checksums_onstack;
> > @@ -1542,49 +1549,45 @@ static void integrity_metadata(struct work_struct *w)
> >  			}
> >  		}
> >
> > +		checksums_ptr = checksums;
> >  		__bio_for_each_segment(bv, bio, iter, dio->orig_bi_iter) {
> >  			unsigned pos;
> > -			char *mem, *checksums_ptr;
> > -
> > -again:
> > +			char *mem;
> >  			mem = (char *)kmap_atomic(bv.bv_page) + bv.bv_offset;
> >  			pos = 0;
> > -			checksums_ptr = checksums;
> >  			do {
> >  				integrity_sector_checksum(ic, sector, mem + pos, checksums_ptr);
> > -				checksums_ptr += ic->tag_size;
> > -				sectors_to_process -= ic->sectors_per_block;
> > +
> > +				if (likely(checksums != checksums_onstack)) {
> > +					checksums_ptr += ic->tag_size;
> > +				} else {
> > +					r = dm_integrity_rw_tag(ic, checksums, &dio->metadata_block, &dio->metadata_offset,
> > +								ic->tag_size, !dio->write ? TAG_CMP : TAG_WRITE);
> > +					if (unlikely(r))
> > +						goto internal_hash_error;
> > +				}
> > +
> >  				pos += ic->sectors_per_block << SECTOR_SHIFT;
> >  				sector += ic->sectors_per_block;
> > -			} while (pos < bv.bv_len && sectors_to_process && checksums != checksums_onstack);
> > +				sectors_to_process -= ic->sectors_per_block;
> > +			} while (pos < bv.bv_len && sectors_to_process);
> >  			kunmap_atomic(mem);
> >
> > -			r = dm_integrity_rw_tag(ic, checksums, &dio->metadata_block, &dio->metadata_offset,
> > -						checksums_ptr - checksums, !dio->write ? TAG_CMP : TAG_WRITE);
> > -			if (unlikely(r)) {
> > -				if (r > 0) {
> > -					DMERR_LIMIT("Checksum failed at sector 0x%llx",
> > -						    (unsigned long long)(sector - ((r + ic->tag_size - 1) / ic->tag_size)));
> > -					r = -EILSEQ;
> > -					atomic64_inc(&ic->number_of_mismatches);
> > -				}
> > -				if (likely(checksums != checksums_onstack))
> > -					kfree(checksums);
> > -				goto error;
> > -			}
> > -
> >  			if (!sectors_to_process)
> >  				break;
> > +		}
> >
> > -			if (unlikely(pos < bv.bv_len)) {
> > -				bv.bv_offset += pos;
> > -				bv.bv_len -= pos;
> > -				goto again;
> > +		if (likely(checksums != checksums_onstack)) {
> > +			r = dm_integrity_rw_tag(ic, checksums, &dio->metadata_block, &dio->metadata_offset,
> > +						(dio->range.n_sectors >> ic->sb->log2_sectors_per_block) * ic->tag_size,
> > +						!dio->write ? TAG_CMP : TAG_WRITE);
> > +			if (unlikely(r)) {
> > +				kfree(checksums);
> > +				goto internal_hash_error;
> >  			}
> > +			kfree(checksums);
> >  		}
> >
> > -		if (likely(checksums != checksums_onstack))
> > -			kfree(checksums);
> >  	} else {
> >  		struct bio_integrity_payload *bip = dio->orig_bi_integrity;
> >
> > @@ -1615,6 +1618,13 @@ static void integrity_metadata(struct work_struct *w)
> >  skip_io:
> >  	dec_in_flight(dio);
> >  	return;
> > +internal_hash_error:
> > +	if (r > 0) {
> > +		DMERR_LIMIT("Checksum failed at sector 0x%llx",
> > +				(unsigned long long)(sector - ((r + ic->tag_size - 1) / ic->tag_size)));
> > +		r = -EILSEQ;
> > +		atomic64_inc(&ic->number_of_mismatches);
> > +	}
> >  error:
> >  	dio->bi_status = errno_to_blk_status(r);
> >  	dec_in_flight(dio);
> > @@ -3019,6 +3029,8 @@ static void dm_integrity_io_hints(struct dm_target *ti, struct queue_limits *lim
> >  		limits->physical_block_size = ic->sectors_per_block << SECTOR_SHIFT;
> >  		blk_limits_io_min(limits, ic->sectors_per_block << SECTOR_SHIFT);
> >  	}
> > +
> > +	blk_limits_io_opt(limits, (1U << ic->sb->log2_interleave_sectors));
> >  }
> >
> >  static void calculate_journal_section_size(struct dm_integrity_c *ic)
> > --
> > 2.20.1
> >
> >
> > --
> > dm-devel mailing list
> > dm-devel@redhat.com
> > https://www.redhat.com/mailman/listinfo/dm-devel
> >
>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

