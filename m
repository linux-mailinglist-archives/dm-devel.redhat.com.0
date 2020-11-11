Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 861F72AF531
	for <lists+dm-devel@lfdr.de>; Wed, 11 Nov 2020 16:40:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605109203;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aXizhoVaYcX1VhSNd/7Epd7ovtKBAFKoCoKCxOvIUa0=;
	b=ZF8wpB8BUr2+R1s1YFBSRe+lK5HDfEjydeAzKjHUxbxxxdmABncFIgO/GOh7PuOkXJo2r5
	q491FVXUr3sWFBZqA+buV0IpeknqOY8+/DJLeqdxLXyoTzM3shYPoh8T0NVjv5mbMuWeQH
	NRX1LVSqr8b30STSSWnFEcHKeLy0HjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-daU_LCq4O1uXXI9A8fJ7Ww-1; Wed, 11 Nov 2020 10:40:00 -0500
X-MC-Unique: daU_LCq4O1uXXI9A8fJ7Ww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80878802EDD;
	Wed, 11 Nov 2020 15:39:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B512F5DA6A;
	Wed, 11 Nov 2020 15:39:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8443F18095FF;
	Wed, 11 Nov 2020 15:39:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ABFcZoK025696 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Nov 2020 10:38:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 13ECE3C89; Wed, 11 Nov 2020 15:38:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A70527BCF;
	Wed, 11 Nov 2020 15:38:24 +0000 (UTC)
Date: Wed, 11 Nov 2020 10:38:24 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <20201111153824.GB22834@redhat.com>
References: <20201110065558.22694-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20201110065558.22694-1-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: joseph.qi@linux.alibaba.com, dm-devel@redhat.com, koct9i@gmail.com
Subject: Re: [dm-devel] dm: add support for DM_TARGET_NOWAIT for various
	targets
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 10 2020 at  1:55am -0500,
Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> This is one prep patch for supporting iopoll for dm device.
> 
> The direct IO routine will set REQ_NOWAIT flag for REQ_HIPRI IO (that
> is, IO will do iopoll) in bio_set_polled(). Then in the IO submission
> routine, the ability of handling REQ_NOWAIT of the block device will
> be checked for REQ_HIPRI IO in submit_bio_checks(). -EOPNOTSUPP will
> be returned if the block device doesn't support REQ_NOWAIT.

submit_bio_checks() verifies the request_queue has QUEUE_FLAG_NOWAIT set
if the bio has REQ_NOWAIT.

> DM lacks support for REQ_NOWAIT until commit 6abc49468eea ("dm: add
> support for REQ_NOWAIT and enable it for linear target"). Since then,
> dm targets that support REQ_NOWAIT should advertise DM_TARGET_NOWAIT
> feature.

I'm not seeing why DM_TARGET_NOWAIT is needed (since you didn't add any
code that consumes the flag).

dm-table.c:dm_table_set_restrictions() has:

        if (dm_table_supports_nowait(t))
                blk_queue_flag_set(QUEUE_FLAG_NOWAIT, q);
        else
                blk_queue_flag_clear(QUEUE_FLAG_NOWAIT, q);

> This patch adds support for DM_TARGET_NOWAIT for those dm targets, the
> .map() algorithm of which just involves sector recalculation.

So you're looking to constrain which targets will properly support
REQ_NOWAIT, based on whether they do a simple remapping?


> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
> Hi Mike,
> 
> I could split these boilerplate code that each dm target have one
> seperate patch if you think that would be better.

One patch for all these is fine.  But it should include the code that I
assume you'll be adding to dm_table_supports_nowait() to further verify
that the targets in the table are all DM_TARGET_NOWAIT.

And why isn't dm-linear setting DM_TARGET_NOWAIT?

Also, other targets _could_ be made to support REQ_NOWAIT by
conditionally returning bio_wouldblock_error() if appropriate
(e.g. bio-based dm-multipath's case of queue_if_no_path).

Mike

> ---
>  drivers/md/dm-stripe.c   | 2 +-
>  drivers/md/dm-switch.c   | 1 +
>  drivers/md/dm-unstripe.c | 1 +
>  drivers/md/dm-zero.c     | 1 +
>  4 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
> index 151d022b032d..df359d33cda8 100644
> --- a/drivers/md/dm-stripe.c
> +++ b/drivers/md/dm-stripe.c
> @@ -496,7 +496,7 @@ static void stripe_io_hints(struct dm_target *ti,
>  static struct target_type stripe_target = {
>  	.name   = "striped",
>  	.version = {1, 6, 0},
> -	.features = DM_TARGET_PASSES_INTEGRITY,
> +	.features = DM_TARGET_PASSES_INTEGRITY | DM_TARGET_NOWAIT,
>  	.module = THIS_MODULE,
>  	.ctr    = stripe_ctr,
>  	.dtr    = stripe_dtr,
> diff --git a/drivers/md/dm-switch.c b/drivers/md/dm-switch.c
> index bff4c7fa1cd2..262e2b0fd975 100644
> --- a/drivers/md/dm-switch.c
> +++ b/drivers/md/dm-switch.c
> @@ -550,6 +550,7 @@ static int switch_iterate_devices(struct dm_target *ti,
>  static struct target_type switch_target = {
>  	.name = "switch",
>  	.version = {1, 1, 0},
> +	.features = DM_TARGET_NOWAIT,
>  	.module = THIS_MODULE,
>  	.ctr = switch_ctr,
>  	.dtr = switch_dtr,
> diff --git a/drivers/md/dm-unstripe.c b/drivers/md/dm-unstripe.c
> index e673dacf6418..7357c1bd5863 100644
> --- a/drivers/md/dm-unstripe.c
> +++ b/drivers/md/dm-unstripe.c
> @@ -178,6 +178,7 @@ static void unstripe_io_hints(struct dm_target *ti,
>  static struct target_type unstripe_target = {
>  	.name = "unstriped",
>  	.version = {1, 1, 0},
> +	.features = DM_TARGET_NOWAIT,
>  	.module = THIS_MODULE,
>  	.ctr = unstripe_ctr,
>  	.dtr = unstripe_dtr,
> diff --git a/drivers/md/dm-zero.c b/drivers/md/dm-zero.c
> index b65ca8dcfbdc..faa1dbffc8b4 100644
> --- a/drivers/md/dm-zero.c
> +++ b/drivers/md/dm-zero.c
> @@ -59,6 +59,7 @@ static int zero_map(struct dm_target *ti, struct bio *bio)
>  static struct target_type zero_target = {
>  	.name   = "zero",
>  	.version = {1, 1, 0},
> +	.features = DM_TARGET_NOWAIT,
>  	.module = THIS_MODULE,
>  	.ctr    = zero_ctr,
>  	.map    = zero_map,
> -- 
> 2.27.0
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

