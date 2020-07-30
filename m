Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 060B42337A4
	for <lists+dm-devel@lfdr.de>; Thu, 30 Jul 2020 19:26:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596129969;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=06epm7vObjYFBJekQAI8rYLOFXvO7BG78YuT0jSAPhM=;
	b=W/7lO+gajk8JaxOceGc65m/ilMKhsqJybRpSz+Kpu+klW9S0JrCCiFPIUgmDQZ239YriBN
	sJBOdq+8kdxgSI5UXKe1woL2hI3agrJidZA9J1kXWHM4+Ob0ZGCD+fp6gyRZDQg16C6Xp/
	1wAibzPZxpDoSs5dO43WqTONNXxTziM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-EFfvn-uAMwaG6DeJfRNypA-1; Thu, 30 Jul 2020 13:26:06 -0400
X-MC-Unique: EFfvn-uAMwaG6DeJfRNypA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BFD01005504;
	Thu, 30 Jul 2020 17:25:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44B961992D;
	Thu, 30 Jul 2020 17:25:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 747791809554;
	Thu, 30 Jul 2020 17:25:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UHPQhS013760 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 13:25:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8652A1EA; Thu, 30 Jul 2020 17:25:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4006861982;
	Thu, 30 Jul 2020 17:25:23 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06UHPLkT026890; 
	Thu, 30 Jul 2020 12:25:21 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06UHPK3A026889;
	Thu, 30 Jul 2020 12:25:20 -0500
Date: Thu, 30 Jul 2020 12:25:20 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20200730172520.GA19233@octiron.msp.redhat.com>
References: <e2fb3241-6829-86e1-bc0c-5ba6b0e399c7@huawei.com>
MIME-Version: 1.0
In-Reply-To: <e2fb3241-6829-86e1-bc0c-5ba6b0e399c7@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: liuzhiqiang26@huawei.com, linfeilong@huawei.com, dm-devel@redhat.com,
	Martin Wilck <mwilck@suse.com>, lutianxiong@huawei.com
Subject: Re: [dm-devel] [dm- devel][PATCH] libmultipath: fix a memory leak
	in dm_get_maps
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

On Thu, Jul 30, 2020 at 12:01:36PM +0800, lixiaokeng wrote:
> In dm_get_maps func, if vector_alloc_slot(mp) fails, the
> mpp should be free.
> 
> Here we call free_multipath(mpp, KEEP_PATHS) to free map.
> 
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> 
> ---
>  libmultipath/devmapper.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index f597ff8b..92eef6f1 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -1198,8 +1198,10 @@ dm_get_maps (vector mp)
>  		if (!mpp)
>  			goto out;
> 
> -		if (!vector_alloc_slot(mp))
> +		if (!vector_alloc_slot(mp)) {
> +			free_multipath(mpp, KEEP_PATHS);
>  			goto out;
> +		}
> 
>  		vector_set_slot(mp, mpp);
>  		mpp = NULL;
> -- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

