Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C645C245ECC
	for <lists+dm-devel@lfdr.de>; Mon, 17 Aug 2020 10:06:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-jPhT3MmFM2yqAeTGZ3QbTw-1; Mon, 17 Aug 2020 04:06:39 -0400
X-MC-Unique: jPhT3MmFM2yqAeTGZ3QbTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 236D381F00D;
	Mon, 17 Aug 2020 08:06:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA5CB5C3E1;
	Mon, 17 Aug 2020 08:06:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4399B181A869;
	Mon, 17 Aug 2020 08:06:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07H8627Y011273 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 04:06:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B7E9F2EFA7; Mon, 17 Aug 2020 08:06:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B42292EFBE
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 08:06:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90565811E8D
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 08:06:00 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-137-g_wJ6M2IPK6GkSCuW0NzYg-1;
	Mon, 17 Aug 2020 04:05:53 -0400
X-MC-Unique: g_wJ6M2IPK6GkSCuW0NzYg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4C54BAC1C;
	Mon, 17 Aug 2020 08:06:17 +0000 (UTC)
Message-ID: <71d49c03470fbb70cc37f757e4804380566fba12.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, bmarzins@redhat.com, Christophe
	Varoqui <christophe.varoqui@opensvc.com>, Zdenek Kabelac
	<zkabelac@redhat.com>
Date: Mon, 17 Aug 2020 10:05:51 +0200
In-Reply-To: <2d9db95b-bb88-0d22-1c2d-df459415ee3d@huawei.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
	<2d9db95b-bb88-0d22-1c2d-df459415ee3d@huawei.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH 1/6] checker: remove useless name check in
 checker_get func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2020-08-16 at 09:42 +0800, Zhiqiang Liu wrote:
> In checker_get func, input name will be checked before
> calling checker_class_lookup func, in which name will
> also be checked.
> 
> Here, we just remove useless input name check in checker_get func.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/checkers.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Nack. Better safe than sorry. If you look at the generated assembly,
you'll see that the compiler optimizes this double check away, so
doesn't inflict runtime overhead, while it makes it easier to verify
the code.

I'd ack this if we had a solid convention in the multipath-tools code
to check parameters always (only) in the callee. But so far we don't.
I guess if we want to do that, we'd first need to agree on and
implement a common convention for return values, too.

If checker_class_lookup() was non-static and/or the code was executed
very often, things would also look different to me. But both is not the
case.

Regards,
Martin



> 
> diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
> index f7ddd53..ac41d64 100644
> --- a/libmultipath/checkers.c
> +++ b/libmultipath/checkers.c
> @@ -361,11 +361,10 @@ void checker_get(const char *multipath_dir,
> struct checker *dst,
>  	if (!dst)
>  		return;
> 
> -	if (name && strlen(name)) {
> -		src = checker_class_lookup(name);
> -		if (!src)
> -			src = add_checker_class(multipath_dir, name);
> -	}
> +	src = checker_class_lookup(name);
> +	if (!src)
> +		src = add_checker_class(multipath_dir, name);
> +
>  	dst->cls = src;
>  	if (!src)
>  		return;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

