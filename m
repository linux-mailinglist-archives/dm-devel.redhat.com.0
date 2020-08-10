Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8A48D2406F7
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 15:49:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-Iz2W3ZyqM-GJMvZUVkUy-w-1; Mon, 10 Aug 2020 09:49:07 -0400
X-MC-Unique: Iz2W3ZyqM-GJMvZUVkUy-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4F5A1005504;
	Mon, 10 Aug 2020 13:49:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 054BD79CF3;
	Mon, 10 Aug 2020 13:48:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 351109755B;
	Mon, 10 Aug 2020 13:48:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ADmiOs027834 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 09:48:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8D6A2166B27; Mon, 10 Aug 2020 13:48:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4EF42166BA2
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 13:48:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3D758EFF00
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 13:48:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-446-Yzuftpa-OQyu6H4eTY-iJA-1;
	Mon, 10 Aug 2020 09:48:39 -0400
X-MC-Unique: Yzuftpa-OQyu6H4eTY-iJA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C47C6AC65;
	Mon, 10 Aug 2020 13:48:57 +0000 (UTC)
Message-ID: <a3a9059d2e5a3dd18bbcc649ecdb9d5564021eb1.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, bmarzins@redhat.com,
	christophe.varoqui@opensvc.com, kabelac@redhat.com
Date: Mon, 10 Aug 2020 15:48:36 +0200
In-Reply-To: <a04e1267-0f1c-3a8b-c163-1697469ffeca@huawei.com>
References: <a04e1267-0f1c-3a8b-c163-1697469ffeca@huawei.com>
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
Cc: linfeilong@huawei.com, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [dm- devel][PATCH] vector: return null when realloc
 fails in vector_alloc_slot func
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

Hello Liu,

On Fri, 2020-07-31 at 18:41 +0800, Zhiqiang Liu wrote:
> In vector_alloc_slot func, if REALLOC fails, it means new slot
> allocation fails. However, it just update v->allocated and then
> return the old v->slot without new slot. So, the caller will take
> the last old slot as the new allocated slot, and use it by calling
> vector_set_slot func. Finally, the data of last slot is lost.
> 
> Here, if REALLOC or MALLOC fails, we will return NULL.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/vector.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/libmultipath/vector.c b/libmultipath/vector.c
> index 501cf4c5..29dc9848 100644
> --- a/libmultipath/vector.c
> +++ b/libmultipath/vector.c
> @@ -49,12 +49,14 @@ vector_alloc_slot(vector v)
>  	else
>  		new_slot = (void *) MALLOC(sizeof (void *) * v-
> >allocated);
> 
> -	if (!new_slot)
> +	/* If REALLOC or MALLOC fails, it means new slot allocation
> fails, so return NULL. */
> +	if (!new_slot) {
>  		v->allocated -= VECTOR_DEFAULT_SIZE;
> -	else
> -		v->slot = new_slot;
> +		return NULL;
> +	}
> 
> -	return v->slot;
> +	v->slot = new_slot;
> +	return v->slot[VECTOR_SIZE(v) - 1];

This changes the semantics of the function by returning the last 
element of the vector rather than v->slot. That's dangerous because
these elements aren't initialized. You might as well return NULL in
case of success, which would obviously be wrong (actually, new elements
_should_ be initialized to NULL). As the return value is only ever used
to check for successful allocation, it might be best to change it into
a bool, avoiding any ambiguity about its meaning.

If you want to clean up this function (appreciated!), please do it
right:

 - increment v->allocated only after successful allocation,
 - avoid the "if (v->slot)" conditional by just calling realloc(),
 - make sure all newly allocated vector elements are set to NULL,
 - optionally, change return value to bool (see above).

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

