Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DEE2C1ED5FE
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 20:19:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591208368;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BFeBfXMogASkcW9fpAfY3OG8eSsIJqvI4gXzi6LQ2Nc=;
	b=N/uqu4TK6/Tce5h4ugWJf6oVOhPVI66LZCQeROkCqp1AXSgS02UDdv+GJeJiAlKmAje8/Y
	4X5l14KE4f+os8n9Jb19AU2EEtk1BbOHmCEhgUN9/iFE+3ZfwrEMG50Koue2+08wZcBrLE
	ZY/JQG5BLwsazVBCuctd4bkwN4pnn7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-QFBkhtAzML2D4l7IhhmCGw-1; Wed, 03 Jun 2020 14:19:26 -0400
X-MC-Unique: QFBkhtAzML2D4l7IhhmCGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FC891005510;
	Wed,  3 Jun 2020 18:19:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 389DE19C58;
	Wed,  3 Jun 2020 18:19:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C2031809543;
	Wed,  3 Jun 2020 18:19:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 053IInQ2014616 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Jun 2020 14:18:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA4F560C81; Wed,  3 Jun 2020 18:18:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92BF061169;
	Wed,  3 Jun 2020 18:18:46 +0000 (UTC)
Date: Wed, 3 Jun 2020 14:18:45 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Colin King <colin.king@canonical.com>
Message-ID: <20200603181845.GA20491@redhat.com>
References: <20200603160254.142222-1-colin.king@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20200603160254.142222-1-colin.king@canonical.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH][next] dm zoned: fix memory leak of newly
 allocated zone on xa_insert failure
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jun 03 2020 at 12:02pm -0400,
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if an xa_insert fails then there is a memory lead of the
> recently allocated zone object. Fix this by kfree'ing zone before
> returning on the error return path.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 1a311efa3916 ("dm zoned: convert to xarray")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/md/dm-zoned-metadata.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index b23ff090c056..130b5a6d9f12 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -313,8 +313,10 @@ static struct dm_zone *dmz_insert(struct dmz_metadata *zmd,
>  	if (!zone)
>  		return ERR_PTR(-ENOMEM);
>  
> -	if (xa_insert(&zmd->zones, zone_id, zone, GFP_KERNEL))
> +	if (xa_insert(&zmd->zones, zone_id, zone, GFP_KERNEL)) {
> +		kfree(zone);
>  		return ERR_PTR(-EBUSY);
> +	}
>  
>  	INIT_LIST_HEAD(&zone->link);
>  	atomic_set(&zone->refcount, 0);
> -- 
> 2.25.1
> 

Thanks, I folded this in.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

