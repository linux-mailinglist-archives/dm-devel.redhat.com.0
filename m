Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7E609343A59
	for <lists+dm-devel@lfdr.de>; Mon, 22 Mar 2021 08:13:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-pR24FaHqMA6b5LoQUUnzKQ-1; Mon, 22 Mar 2021 03:13:08 -0400
X-MC-Unique: pR24FaHqMA6b5LoQUUnzKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94481814256;
	Mon, 22 Mar 2021 07:13:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 628C560C0F;
	Mon, 22 Mar 2021 07:13:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BF784BB7C;
	Mon, 22 Mar 2021 07:13:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12JJ5pV5029138 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 15:05:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A51082026D46; Fri, 19 Mar 2021 19:05:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E14D2026D60
	for <dm-devel@redhat.com>; Fri, 19 Mar 2021 19:05:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2CEC800883
	for <dm-devel@redhat.com>; Fri, 19 Mar 2021 19:05:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-69-fAGMV4d0NQqFK-WGhaIcCA-1; Fri, 19 Mar 2021 15:05:42 -0400
X-MC-Unique: fAGMV4d0NQqFK-WGhaIcCA-1
Received: from rdunlap (helo=localhost)
	by bombadil.infradead.org with local-esmtp (Exim 4.94 #2 (Red Hat
	Linux)) id 1lNJMe-001RDI-Bs; Fri, 19 Mar 2021 17:56:49 +0000
Date: Fri, 19 Mar 2021 10:56:48 -0700 (PDT)
From: Randy Dunlap <rdunlap@bombadil.infradead.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
In-Reply-To: <20210319011750.23468-1-unixbhaskar@gmail.com>
Message-ID: <d639d14b-39cd-6a11-5536-4b8fcc9f3a7@bombadil.infradead.org>
References: <20210319011750.23468-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3
X-CRM114-CacheID: sfid-20210319_105648_424076_8AC441EE
X-CRM114-Status: GOOD (  14.41  )
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
	running on the system "bombadil.infradead.org", 
	has NOT identified this incoming email as spam.  The original
	message has been attached to this so you can view it or label
	similar future email.  If you have any questions, see
	the administrator of that system for details.
	Content preview:  On Fri, 19 Mar 2021,
	Bhaskar Chowdhury wrote: > > s/retrievd/retrieved/
	> s/misalignement/misalignment/ > s/funtion/function/ > >
	Signed-off-by:
	Bhaskar Chowdhury <unixbhaskar@gmail.com> Acked-by: Randy Dunlap
	<rdunlap@infradead.org>
	Content analysis details:   (-0.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-0.0 NO_RELAYS Informational: message was not relayed via SMTP
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Mar 2021 03:12:32 -0400
Cc: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH] dm: ebs: Several typo fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"



On Fri, 19 Mar 2021, Bhaskar Chowdhury wrote:

>
> s/retrievd/retrieved/
> s/misalignement/misalignment/
> s/funtion/function/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> drivers/md/dm-ebs-target.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
> index 55bcfb74f51f..71475a2410be 100644
> --- a/drivers/md/dm-ebs-target.c
> +++ b/drivers/md/dm-ebs-target.c
> @@ -28,7 +28,7 @@ struct ebs_c {
> 	spinlock_t lock;		/* Guard bios input list above. */
> 	sector_t start;			/* <start> table line argument, see ebs_ctr below. */
> 	unsigned int e_bs;		/* Emulated block size in sectors exposed to upper layer. */
> -	unsigned int u_bs;		/* Underlying block size in sectors retrievd from/set on lower layer device. */
> +	unsigned int u_bs;		/* Underlying block size in sectors retrieved from/set on lower layer device. */
> 	unsigned char block_shift;	/* bitshift sectors -> blocks used in dm-bufio API. */
> 	bool u_bs_set:1;		/* Flag to indicate underlying block size is set on table line. */
> };
> @@ -43,7 +43,7 @@ static inline sector_t __block_mod(sector_t sector, unsigned int bs)
> 	return sector & (bs - 1);
> }
>
> -/* Return number of blocks for a bio, accounting for misalignement of start and end sectors. */
> +/* Return number of blocks for a bio, accounting for misalignment of start and end sectors. */
> static inline unsigned int __nr_blocks(struct ebs_c *ec, struct bio *bio)
> {
> 	sector_t end_sector = __block_mod(bio->bi_iter.bi_sector, ec->u_bs) + bio_sectors(bio);
> @@ -171,7 +171,7 @@ static void __ebs_forget_bio(struct ebs_c *ec, struct bio *bio)
> 	dm_bufio_forget_buffers(ec->bufio, __sector_to_block(ec, sector), blocks);
> }
>
> -/* Worker funtion to process incoming bios. */
> +/* Worker function to process incoming bios. */
> static void __ebs_process_bios(struct work_struct *ws)
> {
> 	int r;
> --
> 2.26.2
>
>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

