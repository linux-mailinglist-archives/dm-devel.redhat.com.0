Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2EB1F8346
	for <lists+dm-devel@lfdr.de>; Sat, 13 Jun 2020 14:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592052402;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0zm49c9XnleO6I1g4gVJ1C0KerRp8Y+f1iQ98xR6BCU=;
	b=jCzDaQKgryoMBB+OyC6ndt3re33mVdvDEQOiGdFpPzNROYj1T1BdbBcRdgfWKWWS4IcCGV
	POPz3WVJ5axhoZXLnnRmjc51BUBQSE72fE9WSjDSrlCOw74I1cp1cVUXbJhk0Sr334Fyva
	d9i16dwCsg4XUQzX48AAa+q0vrRrq1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-obJBwFrRNKCnatAx-ek5Cw-1; Sat, 13 Jun 2020 08:46:39 -0400
X-MC-Unique: obJBwFrRNKCnatAx-ek5Cw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7FF81009441;
	Sat, 13 Jun 2020 12:46:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5DC25D9CA;
	Sat, 13 Jun 2020 12:46:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 808451809547;
	Sat, 13 Jun 2020 12:46:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05DCkKgx013291 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 13 Jun 2020 08:46:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02ADD6AD0C; Sat, 13 Jun 2020 12:46:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D5D67FD0A;
	Sat, 13 Jun 2020 12:46:14 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05DCkDsr028099; Sat, 13 Jun 2020 08:46:13 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05DCkDLL028095; Sat, 13 Jun 2020 08:46:13 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Sat, 13 Jun 2020 08:46:13 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Huaisheng Ye <yehs2007@zoho.com>
In-Reply-To: <20200612155544.90348-1-yehs2007@zoho.com>
Message-ID: <alpine.LRH.2.02.2006130845530.27500@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200612155544.90348-1-yehs2007@zoho.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Huaisheng Ye <yehs1@lenovo.com>, agk@redhat.com,
	snitzer@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH] dm writecache: skip writecache_wait when
 using pmem mode
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 12 Jun 2020, Huaisheng Ye wrote:

> From: Huaisheng Ye <yehs1@lenovo.com>
> 
> The array bio_in_progress is only used with ssd mode. So skip
> writecache_wait_for_ios in writecache_discard when pmem mode.
> 
> Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>

Acked-by: Mikulas Patocka <mpatocka@redhat.com>

> ---
>  drivers/md/dm-writecache.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> index 66f3a3b..4367cc7 100644
> --- a/drivers/md/dm-writecache.c
> +++ b/drivers/md/dm-writecache.c
> @@ -849,8 +849,10 @@ static void writecache_discard(struct dm_writecache *wc, sector_t start, sector_
>  
>  		if (likely(!e->write_in_progress)) {
>  			if (!discarded_something) {
> -				writecache_wait_for_ios(wc, READ);
> -				writecache_wait_for_ios(wc, WRITE);
> +				if (!WC_MODE_PMEM(wc)) {
> +					writecache_wait_for_ios(wc, READ);
> +					writecache_wait_for_ios(wc, WRITE);
> +				}
>  				discarded_something = true;
>  			}
>  			writecache_free_entry(wc, e);
> -- 
> 1.8.3.1
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

