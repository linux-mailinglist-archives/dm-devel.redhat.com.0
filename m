Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 233D8246328
	for <lists+dm-devel@lfdr.de>; Mon, 17 Aug 2020 11:21:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-iyKWX9YFOWql-aL8YWrvBQ-1; Mon, 17 Aug 2020 05:21:44 -0400
X-MC-Unique: iyKWX9YFOWql-aL8YWrvBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4220181F00F;
	Mon, 17 Aug 2020 09:21:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89AF319D7D;
	Mon, 17 Aug 2020 09:21:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E7514EE20;
	Mon, 17 Aug 2020 09:21:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07H9LTPU018836 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 05:21:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B5692157F23; Mon, 17 Aug 2020 09:21:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96F142166BD9
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 09:21:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9286811E79
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 09:21:24 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-561-3apILkYxNiC8BFpu_WZfLw-1;
	Mon, 17 Aug 2020 05:21:20 -0400
X-MC-Unique: 3apILkYxNiC8BFpu_WZfLw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 12161AD2F;
	Mon, 17 Aug 2020 09:21:44 +0000 (UTC)
Message-ID: <d1268e158e8c063c12e7f5ab1e8a72109c4a336a.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, bmarzins@redhat.com, Christophe
	Varoqui <christophe.varoqui@opensvc.com>, Zdenek Kabelac
	<zkabelac@redhat.com>
Date: Mon, 17 Aug 2020 11:21:18 +0200
In-Reply-To: <a0d6c479-7802-eb30-9f5d-0075ca1397f9@huawei.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
	<a0d6c479-7802-eb30-9f5d-0075ca1397f9@huawei.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH 6/6] multipathd: return NULL if MALLOC fails
 in alloc_waiteri, func
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2020-08-16 at 09:46 +0800, Zhiqiang Liu wrote:
> In alloc_waiter func, if MALLOC fails, wp is equal to NULL.
> If now we call memset(wp), segmentation fault will occur.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  multipathd/waiter.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/multipathd/waiter.c b/multipathd/waiter.c
> index e645766..80e6e6e 100644
> --- a/multipathd/waiter.c
> +++ b/multipathd/waiter.c
> @@ -33,8 +33,10 @@ static struct event_thread *alloc_waiter (void)
>  	struct event_thread *wp;
> 
>  	wp = (struct event_thread *)MALLOC(sizeof(struct
> event_thread));
> -	memset(wp, 0, sizeof(struct event_thread));
> +	if (!wp)
> +		return NULL;
> 
> +	memset(wp, 0, sizeof(struct event_thread));
>  	return wp;
>  }
> 

This is correct, but while you're at it, please also remove the
superfluous memset() call (counterintuitively, MALLOC(x) maps to
calloc(1, x)).

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

