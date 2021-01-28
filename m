Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED58308773
	for <lists+dm-devel@lfdr.de>; Fri, 29 Jan 2021 10:39:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-Wc19tDjwOgGfmQCX5UdX0Q-1; Fri, 29 Jan 2021 04:39:22 -0500
X-MC-Unique: Wc19tDjwOgGfmQCX5UdX0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E87E18C8C05;
	Fri, 29 Jan 2021 09:39:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 796926FEE2;
	Fri, 29 Jan 2021 09:39:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B00B1809CA0;
	Fri, 29 Jan 2021 09:39:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10SH8NPk013392 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 Jan 2021 12:08:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D42642166B2D; Thu, 28 Jan 2021 17:08:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF12F2166B2C
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 17:08:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC02E805B03
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 17:08:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-267-GzqTjMrCPuak8a5uj_OCMw-1;
	Thu, 28 Jan 2021 12:08:16 -0500
X-MC-Unique: GzqTjMrCPuak8a5uj_OCMw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EEE564E0E;
	Thu, 28 Jan 2021 16:59:47 +0000 (UTC)
Date: Thu, 28 Jan 2021 08:59:46 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20210128165946.GL7698@magnolia>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
	<20210128071133.60335-18-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20210128071133.60335-18-chaitanya.kulkarni@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 29 Jan 2021 04:33:26 -0500
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	gustavoars@kernel.org, sergey.senozhatsky.work@gmail.com,
	snitzer@redhat.com, tiwai@suse.de,
	linux-nvme@lists.infradead.org, philipp.reisner@linbit.com,
	linux-mm@kvack.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, pavel@ucw.cz,
	alex.shi@linux.alibaba.com, hch@lst.de, agk@redhat.com,
	naohiro.aota@wdc.com, linux-nilfs@vger.kernel.org,
	sagi@grimberg.me, linux-scsi@vger.kernel.org, mark@fasheh.com,
	konrad.wilk@oracle.com, osandov@fb.com, ebiggers@kernel.org,
	xen-devel@lists.xenproject.org, ngupta@vflare.org,
	len.brown@intel.com, linux-pm@vger.kernel.org,
	ming.lei@redhat.com, linux-block@vger.kernel.org, tj@kernel.org,
	linux-fscrypt@vger.kernel.org, viro@zeniv.linux.org.uk,
	drbd-dev@tron.linbit.com, jaegeuk@kernel.org, jlbec@evilplan.org,
	konishi.ryusuke@gmail.com, bvanassche@acm.org, axboe@kernel.dk,
	damien.lemoal@wdc.com, tytso@mit.edu, akpm@linux-foundation.org,
	martin.petersen@oracle.com, joseph.qi@linux.alibaba.com,
	rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, minchan@kernel.org,
	jefflexu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	lars.ellenberg@linbit.com, jth@kernel.org,
	asml.silence@gmail.com, ocfs2-devel@oss.oracle.com, roger.pau@citrix.com
Subject: Re: [dm-devel] [RFC PATCH 17/34] iomap: use bio_new in
	iomap_dio_zero
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 27, 2021 at 11:11:16PM -0800, Chaitanya Kulkarni wrote:
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

Looks ok to me,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/direct-io.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index ea1e8f696076..f6c557a1bd25 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -189,15 +189,13 @@ iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
>  	int flags = REQ_SYNC | REQ_IDLE;
>  	struct bio *bio;
>  
> -	bio = bio_alloc(GFP_KERNEL, 1);
> -	bio_set_dev(bio, iomap->bdev);
> -	bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
> +	bio = bio_new(iomap->bdev, iomap_sector(iomap, pos), REQ_OP_WRITE,
> +		      flags, 1, GFP_KERNEL);
>  	bio->bi_private = dio;
>  	bio->bi_end_io = iomap_dio_bio_end_io;
>  
>  	get_page(page);
>  	__bio_add_page(bio, page, len, 0);
> -	bio_set_op_attrs(bio, REQ_OP_WRITE, flags);
>  	iomap_dio_submit_bio(dio, iomap, bio, pos);
>  }
>  
> -- 
> 2.22.1
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

