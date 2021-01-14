Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 560722F68B0
	for <lists+dm-devel@lfdr.de>; Thu, 14 Jan 2021 19:05:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610647521;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BvLnQvQxedmUkk1ateTvryu13Hzcw4e0T8SQyy4vE58=;
	b=X/M2AtueEowgI6+ew4LOP7WV+hFml+Uk/Nwe5qnnUrDkl6pTwyqV/NOTvgecef7tOOLrHW
	aFl3XuQDFd+9FPye4EXUgAURZ+IhBTLbCf8uYMzyQGXAkTQyN3Ht4rSrDFraK6Q2KFMcsN
	G+xfUafcBjO8oKTGrHNbuer4lrOxclo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-ADUxtzckNrWQ_qrg3ZLeaQ-1; Thu, 14 Jan 2021 13:05:18 -0500
X-MC-Unique: ADUxtzckNrWQ_qrg3ZLeaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10D6A19611C0;
	Thu, 14 Jan 2021 18:04:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46DB519C48;
	Thu, 14 Jan 2021 18:04:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1700A1809C9F;
	Thu, 14 Jan 2021 18:04:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10EI4eno018083 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 13:04:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6236A78202; Thu, 14 Jan 2021 18:04:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F05F650F7D;
	Thu, 14 Jan 2021 18:04:05 +0000 (UTC)
Date: Thu, 14 Jan 2021 13:04:05 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20210114180405.GB26410@redhat.com>
References: <20201229085524.2795331-1-satyat@google.com>
	<20201229085524.2795331-6-satyat@google.com>
MIME-Version: 1.0
In-Reply-To: <20201229085524.2795331-6-satyat@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Eric Biggers <ebiggers@google.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 5/6] dm: Verify inline encryption
 capabilities of new table when it is loaded
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 29 2020 at  3:55am -0500,
Satya Tangirala <satyat@google.com> wrote:

> DM only allows the table to be swapped if the new table's inline encryption
> capabilities are a superset of the old table's. We only check that this
> constraint is true when the table is actually swapped in (in
> dm_swap_table()). But this allows a user to load an unacceptable table
> without any complaint from DM, only for DM to throw an error when the
> device is resumed, and the table is swapped in.
> 
> This patch makes DM verify the inline encryption capabilities of the new
> table when the table is loaded. DM continues to verify and use the
> capabilities at the time of table swap, since the capabilities of
> underlying child devices can expand during the time between the table load
> and table swap (which in turn can cause the capabilities of this parent
> device to expand as well).
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  drivers/md/dm-ioctl.c |  8 ++++++++
>  drivers/md/dm.c       | 25 +++++++++++++++++++++++++
>  drivers/md/dm.h       | 19 +++++++++++++++++++
>  3 files changed, 52 insertions(+)
> 
> diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
> index 5e306bba4375..055a3c745243 100644
> --- a/drivers/md/dm-ioctl.c
> +++ b/drivers/md/dm-ioctl.c
> @@ -1358,6 +1358,10 @@ static int table_load(struct file *filp, struct dm_ioctl *param, size_t param_si
>  		goto err_unlock_md_type;
>  	}
>  
> +	r = dm_verify_inline_encryption(md, t);
> +	if (r)
> +		goto err_unlock_md_type;
> +
>  	if (dm_get_md_type(md) == DM_TYPE_NONE) {
>  		/* Initial table load: acquire type of table. */
>  		dm_set_md_type(md, dm_table_get_type(t));
> @@ -2115,6 +2119,10 @@ int __init dm_early_create(struct dm_ioctl *dmi,
>  	if (r)
>  		goto err_destroy_table;
>  
> +	r = dm_verify_inline_encryption(md, t);
> +	if (r)
> +		goto err_destroy_table;
> +
>  	md->type = dm_table_get_type(t);
>  	/* setup md->queue to reflect md's type (may block) */
>  	r = dm_setup_md_queue(md, t);
>
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index b8844171d8e4..04322de34d29 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -2094,6 +2094,31 @@ dm_construct_keyslot_manager(struct mapped_device *md, struct dm_table *t)
>  	return ksm;
>  }
>  
> +/**
> + * dm_verify_inline_encryption() - Verifies that the current keyslot manager of
> + *				   the mapped_device can be replaced by the
> + *				   keyslot manager of a given dm_table.
> + * @md: The mapped_device
> + * @t: The dm_table
> + *
> + * In particular, this function checks that the keyslot manager that will be
> + * constructed for the dm_table will support a superset of the capabilities that
> + * the current keyslot manager of the mapped_device supports.
> + *
> + * Return: 0 if the table's keyslot_manager can replace the current keyslot
> + *	   manager of the mapped_device. Negative value otherwise.
> + */
> +int dm_verify_inline_encryption(struct mapped_device *md, struct dm_table *t)
> +{
> +	struct blk_keyslot_manager *ksm = dm_construct_keyslot_manager(md, t);
> +
> +	if (IS_ERR(ksm))
> +		return PTR_ERR(ksm);
> +	dm_destroy_keyslot_manager(ksm);
> +
> +	return 0;
> +}
> +
>  static void dm_update_keyslot_manager(struct request_queue *q,
>  				      struct blk_keyslot_manager *ksm)
>  {


There shouldn't be any need to bolt on ksm verification in terms of a
temporary ksm.  If you run with my suggestions I just provided in review
of patch 3: dm_table_complete()'s setup of the ksm should also
implicitly validate it.

So this patch, and extra dm_verify_inline_encryption() interface,
shouldn't be needed.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

