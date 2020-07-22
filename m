Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 09A0B22A13B
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jul 2020 23:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595452611;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6U8Ye5hXYk7ykYO5idwITGAM2eQMTBoCKqy93EyoF7o=;
	b=fLDtvNom8r9289vFbRU+4neF7qVlofe5dBSNkajnP5eIPkFx3sZOuxBQcZJZbb8ugbo56C
	KeJYZ5graJHAU4ogqD2PUFVnx+5DSrg0DHPvEPZV8xyomEL/UoAw+rvHKBvjB+PcV1b26o
	U6Q5sIxgbe/RArnDl33StgqflpNcp5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-wwrltMtFNDK21mkyVK90Hg-1; Wed, 22 Jul 2020 17:16:48 -0400
X-MC-Unique: wwrltMtFNDK21mkyVK90Hg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E77998015F3;
	Wed, 22 Jul 2020 21:16:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 438BB8BEC9;
	Wed, 22 Jul 2020 21:16:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CE3F1809554;
	Wed, 22 Jul 2020 21:16:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06MKmoLK022660 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 16:48:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C3821010403; Wed, 22 Jul 2020 20:48:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEA941009978;
	Wed, 22 Jul 2020 20:48:46 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06MKmjT1001461; 
	Wed, 22 Jul 2020 15:48:45 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06MKmiwU001460;
	Wed, 22 Jul 2020 15:48:44 -0500
Date: Wed, 22 Jul 2020 15:48:44 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <20200722204843.GJ11089@octiron.msp.redhat.com>
References: <e58b31e0-4f66-072f-b9c6-1047714cf3bf@huawei.com>
MIME-Version: 1.0
In-Reply-To: <e58b31e0-4f66-072f-b9c6-1047714cf3bf@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	linfeilong <linfeilong@huawei.com>, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>, Martin Wilck <mwilck@suse.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: free pgp if add_pathgroup
 fails in disassemble_map func
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 22, 2020 at 04:36:04PM +0800, Zhiqiang Liu wrote:
> In disassemble_map func, pgp will be added to mpp->pg by calling
> add_pathgroup after allocing a pathgroup (pgp) successfully. However,
> if add_pathgroup fails, the pgp is actually not inserted into mpp->pg.
> So, calling free_pgvec(mpp->pg) cannot free the pgp, then memory leak
> problem occurs.
> 
> disassemble_map:
> -> pgp = alloc_pathgroup()
> -> if add_pathgroup(mpp, pgp) fails
> 	-> goto out
> out:
> free_pgvec(mpp->pg, KEEP_PATHS);
> 
> Here, we will call free_pathgroup(pgp) before going to out tag.
> 

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/dmparser.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> index ac13ec06..6225838b 100644
> --- a/libmultipath/dmparser.c
> +++ b/libmultipath/dmparser.c
> @@ -268,8 +268,10 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>  		if (!pgp)
>  			goto out;
> 
> -		if (add_pathgroup(mpp, pgp))
> +		if (add_pathgroup(mpp, pgp)) {
> +			free_pathgroup(pgp, KEEP_PATHS);
>  			goto out;
> +		}
> 
>  		p += get_word(p, &word);
> 
> -- 
> 2.24.0.windows.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

