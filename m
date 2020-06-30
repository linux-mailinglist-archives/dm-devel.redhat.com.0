Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6006120F92A
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 18:12:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593533536;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hy3fxm+9eQwL66Ygo3Cmhj5Gmg7aYVOBz7mfvkWBPP8=;
	b=M22tZq36EdYfxGueSDq70xQIn/uvFfEnlsFWb7ST4rTNeCar/w6gT+BlbP1Vg9o9SvpdFh
	usMIORybJsQ0gvZVltRLMZBJYjxElMFUwhhXJL1AMxLx0t3gy8uqnmGtA9Pq434PLVIQIb
	9oxI1YYWRhPvlpVytR/C8l5iftwxKog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-VjCQoMh0OFOD9PHyDW-KGg-1; Tue, 30 Jun 2020 12:12:13 -0400
X-MC-Unique: VjCQoMh0OFOD9PHyDW-KGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EF951054F8F;
	Tue, 30 Jun 2020 16:12:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65D1A7BEA0;
	Tue, 30 Jun 2020 16:12:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47B571809547;
	Tue, 30 Jun 2020 16:11:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UGBq8K011620 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 12:11:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A03E5101E664; Tue, 30 Jun 2020 16:11:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 504BB10013C1;
	Tue, 30 Jun 2020 16:11:44 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05UGBhxm030187; Tue, 30 Jun 2020 12:11:43 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05UGBhha030183; Tue, 30 Jun 2020 12:11:43 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 30 Jun 2020 12:11:43 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Michal Suchanek <msuchanek@suse.de>
In-Reply-To: <20200630154924.3283-1-msuchanek@suse.de>
Message-ID: <alpine.LRH.2.02.2006301210270.24082@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2006301101210.24028@file01.intranet.prod.int.rdu2.redhat.com>
	<20200630154924.3283-1-msuchanek@suse.de>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Cornelia Huck <cohuck@redhat.com>, Jan Kara <jack@suse.cz>,
	Jakub Staron <jstaron@google.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-nvdimm@lists.01.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
	Yuval Shaia <yuval.shaia@oracle.com>, dm-devel@redhat.com,
	Dan Williams <dan.j.williams@intel.com>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v3] dm writecache: reject asynchronous pmem.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 30 Jun 2020, Michal Suchanek wrote:

> The writecache driver does not handle asynchronous pmem. Reject it when
> supplied as cache.
> 
> Link: https://lore.kernel.org/linux-nvdimm/87lfk5hahc.fsf@linux.ibm.com/
> Fixes: 6e84200c0a29 ("virtio-pmem: Add virtio pmem driver")
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Acked-by: Mikulas Patocka <mpatocka@redhat.com>

> ---
>  drivers/md/dm-writecache.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> index 30505d70f423..5358894bb9fd 100644
> --- a/drivers/md/dm-writecache.c
> +++ b/drivers/md/dm-writecache.c
> @@ -2266,6 +2266,12 @@ static int writecache_ctr(struct dm_target *ti, unsigned argc, char **argv)
>  	}
>  
>  	if (WC_MODE_PMEM(wc)) {
> +		if (!dax_synchronous(wc->ssd_dev->dax_dev)) {
> +			r = -EOPNOTSUPP;
> +			ti->error = "Asynchronous persistent memory not supported as pmem cache";
> +			goto bad;
> +		}
> +
>  		r = persistent_memory_claim(wc);
>  		if (r) {
>  			ti->error = "Unable to map persistent memory for cache";
> -- 
> 2.26.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

