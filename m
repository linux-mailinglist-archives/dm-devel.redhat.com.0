Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0182C2E9EDD
	for <lists+dm-devel@lfdr.de>; Mon,  4 Jan 2021 21:31:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609792261;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kjYR5kg62ffOdfgC5gOr1gkz/GTOZu/ZU9Y46ADgwB8=;
	b=FERkKvItfmxHHQ2qIBNJiEm6fQ97iOIReukKv8uv+lO8At+x8oqYhIkiJllu268Ju+YywY
	/+5UqhhHoLx6u+mG5nWxoguCqpZwrIG8Da2UidBq4KgmIHkgMb56bo1dWx6qijIUoa6NpQ
	J7JuI8Wq3NdUMKUagapETebXqwH+xyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-mJKk7qfmPT6UkyKqopj_Ng-1; Mon, 04 Jan 2021 15:30:57 -0500
X-MC-Unique: mJKk7qfmPT6UkyKqopj_Ng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50EC7801AC2;
	Mon,  4 Jan 2021 20:30:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E8A45D9D2;
	Mon,  4 Jan 2021 20:30:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4345E4BB7B;
	Mon,  4 Jan 2021 20:30:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104KUkS5032566 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 15:30:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 96D325D765; Mon,  4 Jan 2021 20:30:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 454806A8E6;
	Mon,  4 Jan 2021 20:30:43 +0000 (UTC)
Date: Mon, 4 Jan 2021 15:30:42 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Message-ID: <20210104203042.GB3721@redhat.com>
References: <20201220140222.2f341344@gecko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201220140222.2f341344@gecko.fritz.box>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel <dm-devel@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [dm-devel] dm-integrity: Fix flush with external metadata device
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

On Sun, Dec 20 2020 at  8:02am -0500,
Lukas Straub <lukasstraub2@web.de> wrote:

> With an external metadata device, flush requests aren't passed down
> to the data device.
> 
> Fix this by issuing flush in the right places: In integrity_commit
> when not in journal mode, in do_journal_write after writing the
> contents of the journal to the disk and in dm_integrity_postsuspend.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>  drivers/md/dm-integrity.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
> index 5a7a1b90e671..a26ed65869f6 100644
> --- a/drivers/md/dm-integrity.c
> +++ b/drivers/md/dm-integrity.c
> @@ -2196,6 +2196,8 @@ static void integrity_commit(struct work_struct *w)
>  	if (unlikely(ic->mode != 'J')) {
>  		spin_unlock_irq(&ic->endio_wait.lock);
>  		dm_integrity_flush_buffers(ic);
> +		if (ic->meta_dev)
> +			blkdev_issue_flush(ic->dev->bdev, GFP_NOIO);
>  		goto release_flush_bios;
>  	}
>  
> @@ -2410,6 +2412,9 @@ static void do_journal_write(struct dm_integrity_c *ic, unsigned write_start,
>  	wait_for_completion_io(&comp.comp);
>  
>  	dm_integrity_flush_buffers(ic);
> +	if (ic->meta_dev)
> +		blkdev_issue_flush(ic->dev->bdev, GFP_NOIO);
> +
>  }
>  
>  static void integrity_writer(struct work_struct *w)
> @@ -2949,6 +2954,9 @@ static void dm_integrity_postsuspend(struct dm_target *ti)
>  #endif
>  	}
>  
> +	if (ic->meta_dev)
> +		blkdev_issue_flush(ic->dev->bdev, GFP_NOIO);
> +
>  	BUG_ON(!RB_EMPTY_ROOT(&ic->in_progress));
>  
>  	ic->journal_uptodate = true;
> -- 
> 2.20.1


Seems like a pretty bad oversight... but shouldn't you also make sure to
flush the data device _before_ the metadata is flushed?

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

