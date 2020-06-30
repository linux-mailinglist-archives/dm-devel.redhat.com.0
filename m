Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BD05820F7DD
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 17:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593529452;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H23nZbPx4vEpn6+ljlX3yail7dHMgOBfaD1cRP8U9nw=;
	b=WkVx7dfldL322xFnnAFnpc0wV8VBW/+Kw8To0rgX5+WPS1SCC0OMSSfFnyNLYkOOuQkluD
	yif4j605levDgVKW4v0kM64GugG08nTl4K3jim3prS0OLux/D2C7m7LMkbNyX4YBbtBZQU
	Ah9sr8JAXEsAQsRVwIZvqNfHM8UC56g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-O4t1G6YQMbm5CmBVM5yVZA-1; Tue, 30 Jun 2020 11:03:38 -0400
X-MC-Unique: O4t1G6YQMbm5CmBVM5yVZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC0DD18FF69B;
	Tue, 30 Jun 2020 15:03:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ACE62B4AF;
	Tue, 30 Jun 2020 15:03:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9E061809542;
	Tue, 30 Jun 2020 15:02:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UF2Kvh001764 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 11:02:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B1B51001E91; Tue, 30 Jun 2020 15:02:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 295CA10016DA;
	Tue, 30 Jun 2020 15:02:20 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05UF2Jxv024072; Tue, 30 Jun 2020 11:02:19 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05UF2Jpw024068; Tue, 30 Jun 2020 11:02:19 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 30 Jun 2020 11:02:19 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Michal Suchanek <msuchanek@suse.de>
In-Reply-To: <20200630145335.1185-1-msuchanek@suse.de>
Message-ID: <alpine.LRH.2.02.2006301101210.24028@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200630133546.GA20439@redhat.com>
	<20200630145335.1185-1-msuchanek@suse.de>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Pankaj Gupta <pagupta@redhat.com>, Jan Kara <jack@suse.cz>,
	Jakub Staron <jstaron@google.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-nvdimm@lists.01.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
	Yuval Shaia <yuval.shaia@oracle.com>, dm-devel@redhat.com,
	Dan Williams <dan.j.williams@intel.com>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v2] dm writecache: reject asynchronous pmem.
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

OK. I suggest to move this test before persistent_memory_claim (so that 
you don't try to map the whole device).

Mikulas

> ---
>  drivers/md/dm-writecache.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> index 30505d70f423..1e4f37249e28 100644
> --- a/drivers/md/dm-writecache.c
> +++ b/drivers/md/dm-writecache.c
> @@ -2271,6 +2271,12 @@ static int writecache_ctr(struct dm_target *ti, unsigned argc, char **argv)
>  			ti->error = "Unable to map persistent memory for cache";
>  			goto bad;
>  		}
> +
> +		if (!dax_synchronous(wc->ssd_dev->dax_dev)) {
> +			r = -EOPNOTSUPP;
> +			ti->error = "Asynchronous persistent memory not supported as pmem cache";
> +			goto bad;
> +		}
>  	} else {
>  		size_t n_blocks, n_metadata_blocks;
>  		uint64_t n_bitmap_bits;
> -- 
> 2.26.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

