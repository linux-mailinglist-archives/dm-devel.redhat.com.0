Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 569AD33A3E1
	for <lists+dm-devel@lfdr.de>; Sun, 14 Mar 2021 10:29:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-Llc_bLKbPLuYN0N0G6hM9Q-1; Sun, 14 Mar 2021 05:29:54 -0400
X-MC-Unique: Llc_bLKbPLuYN0N0G6hM9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E64018460E0;
	Sun, 14 Mar 2021 09:29:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44F1B62A1B;
	Sun, 14 Mar 2021 09:29:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B56F11809C84;
	Sun, 14 Mar 2021 09:29:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12E9SrhT023502 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 14 Mar 2021 05:28:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80BA111301C2; Sun, 14 Mar 2021 09:28:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CF4F11301C3
	for <dm-devel@redhat.com>; Sun, 14 Mar 2021 09:28:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0788E884362
	for <dm-devel@redhat.com>; Sun, 14 Mar 2021 09:28:51 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-595-hscVEdDBPDOzhFQ8gvxPFw-1; Sun, 14 Mar 2021 05:28:46 -0400
X-MC-Unique: hscVEdDBPDOzhFQ8gvxPFw-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lLN2t-00Fqgg-Df; Sun, 14 Mar 2021 09:28:30 +0000
Date: Sun, 14 Mar 2021 09:28:23 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Sergei Shtepa <sergei.shtepa@veeam.com>
Message-ID: <20210314092823.GB3773360@infradead.org>
References: <1615563895-28565-1-git-send-email-sergei.shtepa@veeam.com>
	<1615563895-28565-3-git-send-email-sergei.shtepa@veeam.com>
MIME-Version: 1.0
In-Reply-To: <1615563895-28565-3-git-send-email-sergei.shtepa@veeam.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>, linux-api@vger.kernel.org,
	pavel.tide@veeam.com, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v7 2/3] block: add bdev_interposer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 12, 2021 at 06:44:54PM +0300, Sergei Shtepa wrote:
> bdev_interposer allows to redirect bio requests to another devices.

I think this warrants a somewhat more detailed description.

The code itself looks pretty good to me now, a bunch of nitpicks and
a question below:

> +static noinline blk_qc_t submit_bio_interposed(struct bio *bio)
> +{
> +	blk_qc_t ret = BLK_QC_T_NONE;
> +	struct bio_list bio_list[2] = { };
> +	struct gendisk *orig_disk;
> +
> +	if (current->bio_list) {
> +		bio_list_add(&current->bio_list[0], bio);
> +		return BLK_QC_T_NONE;
> +	}

I don't think this case can ever happen:

 - current->bio_list != NULL means a ->submit_bio or blk_mq_submit_bio
   is active.  But if this device is being interposed this means the
   interposer recurses into itself, which should never happen.  So
   I think we'll want a WARN_ON_ONCE here as a debug check instead.

> +
> +	orig_disk = bio->bi_bdev->bd_disk;
> +	if (unlikely(bio_queue_enter(bio)))
> +		return BLK_QC_T_NONE;
> +
> +	current->bio_list = bio_list;
> +
> +	do {
> +		struct block_device *interposer = bio->bi_bdev->bd_interposer;
> +
> +		if (unlikely(!interposer)) {
> +			/* interposer was removed */
> +			bio_list_add(&current->bio_list[0], bio);
> +			break;
> +		}
> +		/* assign bio to interposer device */
> +		bio_set_dev(bio, interposer);
> +		bio_set_flag(bio, BIO_INTERPOSED);

Reassigning the bi_bdev here means the original source is lost by the
time we reach the interposer.  This initially seemed a little limiting,
but I guess the interposer driver can just record that information
locally, so we should be fine.  The big upside of this is that no
extra argument to submit_bio_checks, which means less changes to the
normal fast path, so if this works for everyone that is a nice
improvement over my draft.

> +
> +		if (!submit_bio_checks(bio))
> +			break;
> +		/*
> +		 * Because the current->bio_list is initialized,
> +		 * the submit_bio callback will always return BLK_QC_T_NONE.
> +		 */
> +		interposer->bd_disk->fops->submit_bio(bio);
> +	} while (false);

I find the do { ... } while (false) idiom here a little strange.  Normal
kernel style would be a goto done instead of the breaks.

> +int bdev_interposer_attach(struct block_device *original,
> +			   struct block_device *interposer)

A kerneldoc comment for bdev_interposer_attach (and
bdev_interposer_detach) would be nice to explain the API a little more.

> +{
> +	int ret = 0;
> +
> +	if (WARN_ON(((!original) || (!interposer))))
> +		return -EINVAL;

No need for the inner two levels of braces.

> +	 * interposer should be simple, no a multi-queue device
> +	 */
> +	if (!interposer->bd_disk->fops->submit_bio)

Please use queue_is_mq() instead.

> +	if (bdev_has_interposer(original))
> +		ret = -EBUSY;
> +	else {
> +		original->bd_interposer = bdgrab(interposer);

Just thinking out a loud:  what happens if the interposed device
goes away?  Shouldn't we at very least also make sure this
gabs another refererence on bdev as well?

> +struct bdev_interposer;

Not needed any more.

> +static inline bool bdev_has_interposer(struct block_device *bdev)
> +{
> +	return (bdev->bd_interposer != NULL);
> +};

No need for the braces.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

