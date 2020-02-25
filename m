Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EF8B516EB9C
	for <lists+dm-devel@lfdr.de>; Tue, 25 Feb 2020 17:42:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582648941;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6V8kfFd0s4WwTsyL/Rco01hknqT+Z7m/EMC1m+TA4Ow=;
	b=Aoh35cyNfdPgPDcBpvKB82XfeS+QPjzCIJ+lLK1GmwWSm1AxjHRx59pnCzWhhYmpC2B/Ay
	o72i2VLMpSeVtvGhNXjbFebHNnly52khf08X4ZYEBx9K+m9b/9eBVTUJD2ZnogXXNGOHYP
	oAv+xDQ/QtZXSmwhPZvlRVCM2FgmNoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-Q9GsV2iTOauOZQbsxs8Ygw-1; Tue, 25 Feb 2020 11:42:18 -0500
X-MC-Unique: Q9GsV2iTOauOZQbsxs8Ygw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F4EEA0CD9;
	Tue, 25 Feb 2020 16:42:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3040060C18;
	Tue, 25 Feb 2020 16:42:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF5A1860F8;
	Tue, 25 Feb 2020 16:42:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PGfp6f022651 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 11:41:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 28A52909E9; Tue, 25 Feb 2020 16:41:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D742790519;
	Tue, 25 Feb 2020 16:41:45 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 01PGfjrV004485; Tue, 25 Feb 2020 11:41:45 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 01PGfjJ2004481; Tue, 25 Feb 2020 11:41:45 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 25 Feb 2020 11:41:45 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Lukas Straub <lukasstraub2@web.de>
In-Reply-To: <20200220190445.2222af54@luklap>
Message-ID: <alpine.LRH.2.02.2002251127070.1014@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200220190445.2222af54@luklap>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 20 Feb 2020, Lukas Straub wrote:

> If a full tag area is being written, don't read it first. This prevents a
> read-modify-write cycle and increases performance on HDDs considerably.
> 
> To do this we now calculate the checksums for all sectors in the bio in one
> go in integrity_metadata and then pass the result to dm_integrity_rw_tag,
> which now checks if we overwrite the whole tag area.
> 
> Benchmarking with a 5400RPM HDD with bitmap mode:
> integritysetup format --no-wipe --batch-mode --interleave-sectors $((64*1024)) -t 4 -s 512 -I crc32c -B /dev/sdc
> integritysetup open -I crc32c -B /dev/sdc hdda_integ
> dd if=/dev/zero of=/dev/mapper/hdda_integ bs=64K count=$((16*1024*4)) conv=fsync oflag=direct status=progress
> 
> Without patch:
> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 400.326 s, 10.7 MB/s
> 
> With patch:
> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 41.2057 s, 104 MB/s
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>  drivers/md/dm-integrity.c | 80 ++++++++++++++++++++++-----------------
>  1 file changed, 46 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
> index b225b3e445fa..0e5ddcf44935 100644
> --- a/drivers/md/dm-integrity.c
> +++ b/drivers/md/dm-integrity.c
> @@ -1309,9 +1309,16 @@ static int dm_integrity_rw_tag(struct dm_integrity_c *ic, unsigned char *tag, se
>  		if (unlikely(r))
>  			return r;
> 
> -		data = dm_bufio_read(ic->bufio, *metadata_block, &b);
> -		if (IS_ERR(data))
> -			return PTR_ERR(data);
> +		/* Don't read tag area from disk if we're going to overwrite it completely */
> +		if (op == TAG_WRITE && *metadata_offset == 0 && total_size >= ic->metadata_run) {

Hi

This is incorrect logic because ic->metadata_run is in the units of 
512-byte sectors and total_size is in bytes.

If I correct the bug and change it to "if (op == TAG_WRITE && 
*metadata_offset == 0 && total_size >= ic->metadata_run << SECTOR_SHIFT)", 
then the benchmark doesn't show any performance advantage at all.

You would need much bigger bios to take advantage for this - for example, 
if we have 4k block size and 64k metadata buffer size and 4-byte crc32, 
there are 65536/4=16384 tags in one metadata buffer and we would need 
16384*4096=64MiB bio to completely overwrite the metadata buffer. Such big 
bios are not realistic.

Mikulas


> +			data = dm_bufio_new(ic->bufio, *metadata_block, &b);
> +			if (IS_ERR(data))
> +				return PTR_ERR(data);
> +		} else {
> +			data = dm_bufio_read(ic->bufio, *metadata_block, &b);
> +			if (IS_ERR(data))
> +				return PTR_ERR(data);
> +		}
> 
>  		to_copy = min((1U << SECTOR_SHIFT << ic->log2_buffer_sectors) - *metadata_offset, total_size);
>  		dp = data + *metadata_offset;
> @@ -1514,6 +1521,8 @@ static void integrity_metadata(struct work_struct *w)
>  {
>  	struct dm_integrity_io *dio = container_of(w, struct dm_integrity_io, work);
>  	struct dm_integrity_c *ic = dio->ic;
> +	unsigned sectors_to_process = dio->range.n_sectors;
> +	sector_t sector = dio->range.logical_sector;
> 
>  	int r;
> 
> @@ -1522,16 +1531,14 @@ static void integrity_metadata(struct work_struct *w)
>  		struct bio_vec bv;
>  		unsigned digest_size = crypto_shash_digestsize(ic->internal_hash);
>  		struct bio *bio = dm_bio_from_per_bio_data(dio, sizeof(struct dm_integrity_io));
> -		char *checksums;
> +		char *checksums, *checksums_ptr;
>  		unsigned extra_space = unlikely(digest_size > ic->tag_size) ? digest_size - ic->tag_size : 0;
>  		char checksums_onstack[HASH_MAX_DIGESTSIZE];
> -		unsigned sectors_to_process = dio->range.n_sectors;
> -		sector_t sector = dio->range.logical_sector;
> 
>  		if (unlikely(ic->mode == 'R'))
>  			goto skip_io;
> 
> -		checksums = kmalloc((PAGE_SIZE >> SECTOR_SHIFT >> ic->sb->log2_sectors_per_block) * ic->tag_size + extra_space,
> +		checksums = kmalloc((dio->range.n_sectors >> ic->sb->log2_sectors_per_block) * ic->tag_size + extra_space,
>  				    GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN);
>  		if (!checksums) {
>  			checksums = checksums_onstack;
> @@ -1542,49 +1549,45 @@ static void integrity_metadata(struct work_struct *w)
>  			}
>  		}
> 
> +		checksums_ptr = checksums;
>  		__bio_for_each_segment(bv, bio, iter, dio->orig_bi_iter) {
>  			unsigned pos;
> -			char *mem, *checksums_ptr;
> -
> -again:
> +			char *mem;
>  			mem = (char *)kmap_atomic(bv.bv_page) + bv.bv_offset;
>  			pos = 0;
> -			checksums_ptr = checksums;
>  			do {
>  				integrity_sector_checksum(ic, sector, mem + pos, checksums_ptr);
> -				checksums_ptr += ic->tag_size;
> -				sectors_to_process -= ic->sectors_per_block;
> +
> +				if (likely(checksums != checksums_onstack)) {
> +					checksums_ptr += ic->tag_size;
> +				} else {
> +					r = dm_integrity_rw_tag(ic, checksums, &dio->metadata_block, &dio->metadata_offset,
> +								ic->tag_size, !dio->write ? TAG_CMP : TAG_WRITE);
> +					if (unlikely(r))
> +						goto internal_hash_error;
> +				}
> +
>  				pos += ic->sectors_per_block << SECTOR_SHIFT;
>  				sector += ic->sectors_per_block;
> -			} while (pos < bv.bv_len && sectors_to_process && checksums != checksums_onstack);
> +				sectors_to_process -= ic->sectors_per_block;
> +			} while (pos < bv.bv_len && sectors_to_process);
>  			kunmap_atomic(mem);
> 
> -			r = dm_integrity_rw_tag(ic, checksums, &dio->metadata_block, &dio->metadata_offset,
> -						checksums_ptr - checksums, !dio->write ? TAG_CMP : TAG_WRITE);
> -			if (unlikely(r)) {
> -				if (r > 0) {
> -					DMERR_LIMIT("Checksum failed at sector 0x%llx",
> -						    (unsigned long long)(sector - ((r + ic->tag_size - 1) / ic->tag_size)));
> -					r = -EILSEQ;
> -					atomic64_inc(&ic->number_of_mismatches);
> -				}
> -				if (likely(checksums != checksums_onstack))
> -					kfree(checksums);
> -				goto error;
> -			}
> -
>  			if (!sectors_to_process)
>  				break;
> +		}
> 
> -			if (unlikely(pos < bv.bv_len)) {
> -				bv.bv_offset += pos;
> -				bv.bv_len -= pos;
> -				goto again;
> +		if (likely(checksums != checksums_onstack)) {
> +			r = dm_integrity_rw_tag(ic, checksums, &dio->metadata_block, &dio->metadata_offset,
> +						(dio->range.n_sectors >> ic->sb->log2_sectors_per_block) * ic->tag_size,
> +						!dio->write ? TAG_CMP : TAG_WRITE);
> +			if (unlikely(r)) {
> +				kfree(checksums);
> +				goto internal_hash_error;
>  			}
> +			kfree(checksums);
>  		}
> 
> -		if (likely(checksums != checksums_onstack))
> -			kfree(checksums);
>  	} else {
>  		struct bio_integrity_payload *bip = dio->orig_bi_integrity;
> 
> @@ -1615,6 +1618,13 @@ static void integrity_metadata(struct work_struct *w)
>  skip_io:
>  	dec_in_flight(dio);
>  	return;
> +internal_hash_error:
> +	if (r > 0) {
> +		DMERR_LIMIT("Checksum failed at sector 0x%llx",
> +				(unsigned long long)(sector - ((r + ic->tag_size - 1) / ic->tag_size)));
> +		r = -EILSEQ;
> +		atomic64_inc(&ic->number_of_mismatches);
> +	}
>  error:
>  	dio->bi_status = errno_to_blk_status(r);
>  	dec_in_flight(dio);
> @@ -3019,6 +3029,8 @@ static void dm_integrity_io_hints(struct dm_target *ti, struct queue_limits *lim
>  		limits->physical_block_size = ic->sectors_per_block << SECTOR_SHIFT;
>  		blk_limits_io_min(limits, ic->sectors_per_block << SECTOR_SHIFT);
>  	}
> +
> +	blk_limits_io_opt(limits, (1U << ic->sb->log2_interleave_sectors));
>  }
> 
>  static void calculate_journal_section_size(struct dm_integrity_c *ic)
> --
> 2.20.1
> 
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

