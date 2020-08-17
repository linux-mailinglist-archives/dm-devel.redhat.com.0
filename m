Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3C825246142
	for <lists+dm-devel@lfdr.de>; Mon, 17 Aug 2020 10:52:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-7Cmsd14hP9Kl82AfIqrQ_Q-1; Mon, 17 Aug 2020 04:52:18 -0400
X-MC-Unique: 7Cmsd14hP9Kl82AfIqrQ_Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AE9581F00A;
	Mon, 17 Aug 2020 08:52:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 754CF7D67F;
	Mon, 17 Aug 2020 08:52:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8643518095FF;
	Mon, 17 Aug 2020 08:52:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07H8puwT016034 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 04:51:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02025B17F1; Mon, 17 Aug 2020 08:51:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F22AFB17EF
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 08:51:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E139980019A
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 08:51:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-162-0KRdgaJaPDC6Xi_uJQ6kTg-1;
	Mon, 17 Aug 2020 04:51:51 -0400
X-MC-Unique: 0KRdgaJaPDC6Xi_uJQ6kTg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 370C6AE8C;
	Mon, 17 Aug 2020 08:52:15 +0000 (UTC)
Message-ID: <dbe521bcacbc746969437612d639387663898f88.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, bmarzins@redhat.com, Christophe
	Varoqui <christophe.varoqui@opensvc.com>, Zdenek Kabelac
	<zkabelac@redhat.com>
Date: Mon, 17 Aug 2020 10:51:49 +0200
In-Reply-To: <4127cfc2-413f-32d9-cf76-0c0453524aeb@huawei.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
	<4127cfc2-413f-32d9-cf76-0c0453524aeb@huawei.com>
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
Subject: Re: [dm-devel] [PATCH 4/6] libmultipath: check blist before calling
 MALLOC in alloc_ble_device func
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2020-08-16 at 09:45 +0800, Zhiqiang Liu wrote:
> In alloc_ble_device func, ble is firstly allocated by calling MALLOC,
> and then input blist is checked whether it is valid. If blist is not
> valid, ble will be freed without using.
> 
> Here, we should check blist firstly.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/blacklist.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

This patch isn't wrong, but it fixes code which isn't buggy. It's
rather a style thing, an optimization for an extremely unlikely error
case. I agree with you in the sense that I prefer the "new" style over
the old (I generally dislike expressions that can fail, like malloc()
calls, being used as variable initializers), but I'm not sure if we
should start applying patches for cases like this. So far we've been
rather conservative with "style" patches, because they tend to make it
unnecessarily hard to track code history.

Ben, Christophe, what's your take on this matter?

Regards,
Martin


> 
> diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
> index db58ccc..bedcc7e 100644
> --- a/libmultipath/blacklist.c
> +++ b/libmultipath/blacklist.c
> @@ -66,12 +66,16 @@ out:
> 
>  int alloc_ble_device(vector blist)
>  {
> -	struct blentry_device * ble = MALLOC(sizeof(struct
> blentry_device));
> +	struct blentry_device *ble;
> 
> +	if (!blist)
> +		return 1;
> +
> +	ble = MALLOC(sizeof(struct blentry_device));
>  	if (!ble)
>  		return 1;
> 
> -	if (!blist || !vector_alloc_slot(blist)) {
> +	if (!vector_alloc_slot(blist)) {
>  		FREE(ble);
>  		return 1;
>  	}


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

