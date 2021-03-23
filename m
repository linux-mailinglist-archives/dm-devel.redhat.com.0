Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6D366346290
	for <lists+dm-devel@lfdr.de>; Tue, 23 Mar 2021 16:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616512523;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QroOptEwPDPH56EbglltKb0MiCWC4KtTwLGffnIJMH4=;
	b=IdmGq35b+VXAUmZd3dW4Q6CPcQ00+jLqbnMQlLBkF1Hnzp8tHw/T6e801I+2nmCyr89oC/
	LWnBFiMK24Ab9X9MKBbccWJH1e6Mr4XGx9F3zKtAJPQ1tRzM+gpCzRy3DBW1XRR5NwqEkN
	hpf2WvqPJLlMxnuaWGH/rbzJkZdYV8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587--rasg4iTPpiWgtHM1G7AfA-1; Tue, 23 Mar 2021 11:15:20 -0400
X-MC-Unique: -rasg4iTPpiWgtHM1G7AfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6176C108BD0A;
	Tue, 23 Mar 2021 15:15:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3351C5C1C5;
	Tue, 23 Mar 2021 15:15:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFEC51809C83;
	Tue, 23 Mar 2021 15:15:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NFCjul014926 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 11:12:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7FBE5196E3; Tue, 23 Mar 2021 15:12:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8331B19705;
	Tue, 23 Mar 2021 15:12:39 +0000 (UTC)
Date: Tue, 23 Mar 2021 11:12:38 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20210323151238.GA4898@redhat.com>
References: <alpine.LRH.2.02.2103231058220.2542@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2103231058220.2542@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] dm-integrity - add the "reset_recalculate" flag
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 23 2021 at 10:59am -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> This patch adds a new flag "reset_recalculate" that will restart
> recalculating from the beginning of the device. It can be used if we want
> to change the hash function. Example:
> 
> #!/bin/sh
> dmsetup remove_all
> rmmod brd
> set -e
> modprobe brd rd_size=1048576
> dmsetup create in --table '0 2000000 integrity /dev/ram0 0 16 J 2 internal_hash:sha256 recalculate'
> sleep 10
> dmsetup status
> dmsetup remove in
> dmsetup create in --table '0 2000000 integrity /dev/ram0 0 16 J 2 internal_hash:sha3-256 reset_recalculate'
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> Index: linux-2.6/drivers/md/dm-integrity.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-integrity.c
> +++ linux-2.6/drivers/md/dm-integrity.c
> @@ -262,6 +262,7 @@ struct dm_integrity_c {
>  	bool journal_uptodate;
>  	bool just_formatted;
>  	bool recalculate_flag;
> +	bool reset_recalculate_flag;
>  	bool discard;
>  	bool fix_padding;
>  	bool fix_hmac;
> @@ -3134,7 +3135,8 @@ static void dm_integrity_resume(struct d
>  		rw_journal_sectors(ic, REQ_OP_READ, 0, 0,
>  				   ic->n_bitmap_blocks * (BITMAP_BLOCK_SIZE >> SECTOR_SHIFT), NULL);
>  		if (ic->mode == 'B') {
> -			if (ic->sb->log2_blocks_per_bitmap_bit == ic->log2_blocks_per_bitmap_bit) {
> +			if (ic->sb->log2_blocks_per_bitmap_bit == ic->log2_blocks_per_bitmap_bit &&
> +			    !ic->reset_recalculate_flag) {
>  				block_bitmap_copy(ic, ic->recalc_bitmap, ic->journal);
>  				block_bitmap_copy(ic, ic->may_write_bitmap, ic->journal);
>  				if (!block_bitmap_op(ic, ic->journal, 0, ic->provided_data_sectors,
> @@ -3156,7 +3158,8 @@ static void dm_integrity_resume(struct d
>  			}
>  		} else {
>  			if (!(ic->sb->log2_blocks_per_bitmap_bit == ic->log2_blocks_per_bitmap_bit &&
> -			      block_bitmap_op(ic, ic->journal, 0, ic->provided_data_sectors, BITMAP_OP_TEST_ALL_CLEAR))) {
> +			      block_bitmap_op(ic, ic->journal, 0, ic->provided_data_sectors, BITMAP_OP_TEST_ALL_CLEAR)) ||
> +			    ic->reset_recalculate_flag) {
>  				ic->sb->flags |= cpu_to_le32(SB_FLAG_RECALCULATING);
>  				ic->sb->recalc_sector = cpu_to_le64(0);
>  			}
> @@ -3169,6 +3172,10 @@ static void dm_integrity_resume(struct d
>  			dm_integrity_io_error(ic, "writing superblock", r);
>  	} else {
>  		replay_journal(ic);
> +		if (ic->reset_recalculate_flag) {
> +			ic->sb->flags |= cpu_to_le32(SB_FLAG_RECALCULATING);
> +			ic->sb->recalc_sector = cpu_to_le64(0);
> +		}
>  		if (ic->mode == 'B') {
>  			ic->sb->flags |= cpu_to_le32(SB_FLAG_DIRTY_BITMAP);
>  			ic->sb->log2_blocks_per_bitmap_bit = ic->log2_blocks_per_bitmap_bit;
> @@ -3242,6 +3249,7 @@ static void dm_integrity_status(struct d
>  		arg_count += !!ic->meta_dev;
>  		arg_count += ic->sectors_per_block != 1;
>  		arg_count += !!(ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING));
> +		arg_count += ic->reset_recalculate_flag;
>  		arg_count += ic->discard;
>  		arg_count += ic->mode == 'J';
>  		arg_count += ic->mode == 'J';
> @@ -3261,6 +3269,8 @@ static void dm_integrity_status(struct d
>  			DMEMIT(" block_size:%u", ic->sectors_per_block << SECTOR_SHIFT);
>  		if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING))
>  			DMEMIT(" recalculate");
> +		if (ic->reset_recalculate_flag)
> +			DMEMIT(" reset_recalculate");
>  		if (ic->discard)
>  			DMEMIT(" allow_discards");
>  		DMEMIT(" journal_sectors:%u", ic->initial_sectors - SB_SECTORS);
> @@ -4058,6 +4068,9 @@ static int dm_integrity_ctr(struct dm_ta
>  				goto bad;
>  		} else if (!strcmp(opt_string, "recalculate")) {
>  			ic->recalculate_flag = true;
> +		} else if (!strcmp(opt_string, "reset_recalculate")) {
> +			ic->recalculate_flag = true;
> +			ic->reset_recalculate_flag = true;
>  		} else if (!strcmp(opt_string, "allow_discards")) {
>  			ic->discard = true;
>  		} else if (!strcmp(opt_string, "fix_padding")) {

Do you need to bump the number of feature args supported (from 17 to
18)?

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

