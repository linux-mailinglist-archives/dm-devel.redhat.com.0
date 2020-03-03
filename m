Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 932D2177BB5
	for <lists+dm-devel@lfdr.de>; Tue,  3 Mar 2020 17:16:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583252191;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cVZJhTBJ5WfO6Mcw+eR98AYfCS3rUpHxQyWtkZtoJY0=;
	b=BbQSwjBJxaeVlAErB3uAgTQWjCXG5pJlmXbq2Zi/qllIu7FZGekvs8hEuXMYC5OuynobyG
	vw56i6QkIaSuOn+1ftBNa5Q3AmrQQIL6uXg0GMGGuwOAFVSfStjHVidBkiiUFrZ4ZUe2vR
	nXi2RJYUP+DocJY2TXltWrUuf0Yo/6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-D1Ih_Y3yMCi0iTmC3Z8F1w-1; Tue, 03 Mar 2020 11:16:28 -0500
X-MC-Unique: D1Ih_Y3yMCi0iTmC3Z8F1w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EB28800D48;
	Tue,  3 Mar 2020 16:16:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71ABF1BC6D;
	Tue,  3 Mar 2020 16:16:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A47F86A01;
	Tue,  3 Mar 2020 16:15:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 023GFdks030742 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Mar 2020 11:15:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 57BF35DA75; Tue,  3 Mar 2020 16:15:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 801945D9C9;
	Tue,  3 Mar 2020 16:15:36 +0000 (UTC)
Date: Tue, 3 Mar 2020 11:15:35 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Hou Tao <houtao1@huawei.com>
Message-ID: <20200303161535.GA8578@redhat.com>
References: <20200303084501.8912-1-houtao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200303084501.8912-1-houtao1@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: tj@kernel.org, dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] dm: fix congested_fn for request-based device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Mar 03 2020 at  3:45am -0500,
Hou Tao <houtao1@huawei.com> wrote:

> We neither assign congested_fn for requested-based blk-mq device
> nor implement it correctly. So fix both.
> 
> Fixes: 4aa9c692e052 ("bdi: separate out congested state into a separate struct")
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  drivers/md/dm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index b89f07ee2eff..80b95e21db43 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1784,11 +1784,13 @@ static int dm_any_congested(void *congested_data, int bdi_bits)
>  
>  	if (!test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags)) {
>  		if (dm_request_based(md)) {
> +			struct backing_dev_info *bdi =
> +				md->queue->backing_dev_info;
>  			/*
>  			 * With request-based DM we only need to check the
>  			 * top-level queue for congestion.
>  			 */
> -			r = md->queue->backing_dev_info->wb.state & bdi_bits;
> +			r = bdi->wb.congested->state & bdi_bits;
>  		} else {
>  			map = dm_get_live_table_fast(md);
>  			if (map)

The above change does indeed fix missing conversion that should've
occurred in commit 4aa9c692e052.

> @@ -2265,6 +2267,7 @@ int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t)
>  			DMERR("Cannot initialize queue for request-based dm-mq mapped device");
>  			return r;
>  		}
> +		dm_init_normal_md_queue(md);
>  		break;
>  	case DM_TYPE_BIO_BASED:
>  	case DM_TYPE_DAX_BIO_BASED:

I've renamed dm_init_normal_md_queue to dm_init_congested_fn and removed
it's incorrect comment.

Here is the final fix I just staged:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.6&id=974f51e8633f0f3f33e8f86bbb5ae66758aa63c7

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

