Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 21DD71F8343
	for <lists+dm-devel@lfdr.de>; Sat, 13 Jun 2020 14:41:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592052089;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qBV+sgvrRLSG++lpZv4R3GigGGBVx1QDuRy/83l6pFo=;
	b=AfnqXjJyb20NMJ/hzdMBbrBajFo81nNCO8nqpXQezNbN0FjBwFii5tanTcetLeqBBrRKm5
	TmWoHyE0OQrVeeWP83kUgHcIUTJs+k1nEuFWdlme2ey0+nbEW25PSkt3d8M+QbP5SHmhuT
	r8gBD2mtAjf09HD1jK1W/OtuSCJjw7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-sBlqaV6qMwaFkqPplIMGxw-1; Sat, 13 Jun 2020 08:41:26 -0400
X-MC-Unique: sBlqaV6qMwaFkqPplIMGxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 130CE1005512;
	Sat, 13 Jun 2020 12:41:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B51C060CD1;
	Sat, 13 Jun 2020 12:41:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BFD31809547;
	Sat, 13 Jun 2020 12:40:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05DCeaFr012639 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 13 Jun 2020 08:40:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0AF1A5C1D3; Sat, 13 Jun 2020 12:40:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 517475C1B2;
	Sat, 13 Jun 2020 12:40:30 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05DCeTVA027703; Sat, 13 Jun 2020 08:40:29 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05DCeTMT027699; Sat, 13 Jun 2020 08:40:29 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Sat, 13 Jun 2020 08:40:29 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Huaisheng Ye <yehs2007@zoho.com>
In-Reply-To: <20200612155911.96528-1-yehs2007@zoho.com>
Message-ID: <alpine.LRH.2.02.2006130839480.27500@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200612155911.96528-1-yehs2007@zoho.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Huaisheng Ye <yehs1@lenovo.com>, agk@redhat.com,
	snitzer@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH] dm writecache: correct uncommitted_block
 when discarding uncommitted entry
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 12 Jun 2020, Huaisheng Ye wrote:

> From: Huaisheng Ye <yehs1@lenovo.com>
> 
> When uncommitted entry has been discarded, correct wc->uncommitted_block
> for getting the exact number.
> 
> Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>

Acked-by: Mikulas Patocka <mpatocka@redhat.com>

Also, add:
Cc: stable@vger.kernel.org

> ---
>  drivers/md/dm-writecache.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> index 4367cc7..64b4527 100644
> --- a/drivers/md/dm-writecache.c
> +++ b/drivers/md/dm-writecache.c
> @@ -855,6 +855,8 @@ static void writecache_discard(struct dm_writecache *wc, sector_t start, sector_
>  				}
>  				discarded_something = true;
>  			}
> +			if (!writecache_entry_is_committed(wc, e))
> +				wc->uncommitted_blocks--;
>  			writecache_free_entry(wc, e);
>  		}
>  
> -- 
> 1.8.3.1
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

