Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EBDFC2D4E10
	for <lists+dm-devel@lfdr.de>; Wed,  9 Dec 2020 23:38:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607553521;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jWQEeQwooJ7Rfv0MFftOx4OnsJIKRU3GcNS1XjdjKag=;
	b=dR3GnF+IoJ8btJj+CNjwAvOSJfX0S1aj0KZNVAKhgCsqt/ZoQmXs6w7JmW3jkFGMA4rMIm
	YasCwA3EmO4s0UlzIJ+DO4EV00WXZfk9vvME3QFmAcps15HS+1pJkHa+Ync7ZqCoqywmbc
	vy+MGquDlalSXy5sSqxY66VMyuFOLSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-XaG7A_gwMuGmDFAMd36YaQ-1; Wed, 09 Dec 2020 17:38:38 -0500
X-MC-Unique: XaG7A_gwMuGmDFAMd36YaQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD47A10151FC;
	Wed,  9 Dec 2020 22:38:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FA4910016F5;
	Wed,  9 Dec 2020 22:38:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EADC91809C9F;
	Wed,  9 Dec 2020 22:38:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B9McF15008527 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Dec 2020 17:38:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F6087094A; Wed,  9 Dec 2020 22:38:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA4216F990;
	Wed,  9 Dec 2020 22:38:02 +0000 (UTC)
Date: Wed, 9 Dec 2020 17:38:02 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Song Liu <songliubraving@fb.com>, axboe@kernel.dk
Message-ID: <20201209223801.GB2752@redhat.com>
References: <20201209215814.2623617-1-songliubraving@fb.com>
MIME-Version: 1.0
In-Reply-To: <20201209215814.2623617-1-songliubraving@fb.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, dm-devel@redhat.com, Xiao Ni <xni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Matthew Ruffell <matthew.ruffell@canonical.com>
Subject: Re: [dm-devel] Revert "dm raid: remove unnecessary discard limits
	for raid10"
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 09 2020 at  4:58pm -0500,
Song Liu <songliubraving@fb.com> wrote:

> This reverts commit f0e90b6c663a7e3b4736cb318c6c7c589f152c28.
> 
> Matthew Ruffell reported data corruption in raid10 due to the changes
> in discard handling [1]. Revert these changes before we find a proper fix.
> 
> [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1907262/
> Cc: Matthew Ruffell <matthew.ruffell@canonical.com>
> Cc: Xiao Ni <xni@redhat.com>
> Cc: Mike Snitzer <snitzer@redhat.com>
> Signed-off-by: Song Liu <songliubraving@fb.com>
> ---
>  drivers/md/dm-raid.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
> index 9c1f7c4de65b3..dc8568ab96f24 100644
> --- a/drivers/md/dm-raid.c
> +++ b/drivers/md/dm-raid.c
> @@ -3728,6 +3728,17 @@ static void raid_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  
>  	blk_limits_io_min(limits, chunk_size_bytes);
>  	blk_limits_io_opt(limits, chunk_size_bytes * mddev_data_stripes(rs));
> +
> +	/*
> +	 * RAID10 personality requires bio splitting,
> +	 * RAID0/1/4/5/6 don't and process large discard bios properly.
> +	 */
> +	if (rs_is_raid10(rs)) {
> +		limits->discard_granularity = max(chunk_size_bytes,
> +						  limits->discard_granularity);
> +		limits->max_discard_sectors = min_not_zero(rs->md.chunk_sectors,
> +							   limits->max_discard_sectors);
> +	}
>  }
>  
>  static void raid_postsuspend(struct dm_target *ti)
> -- 
> 2.24.1
> 

Short of you sending a v2 pull request to Jens...

Jens please pick this up once you pull Song's MD pull that reverts all
the MD raid10 discard changes.

Thanks!

Acked-by: Mike Snitzer <snitzer@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

