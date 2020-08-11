Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC87241917
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 11:47:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-nWtyaRvSOMKP7jL4HCEIlw-1; Tue, 11 Aug 2020 05:47:16 -0400
X-MC-Unique: nWtyaRvSOMKP7jL4HCEIlw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E08C19200C0;
	Tue, 11 Aug 2020 09:47:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42E462BE58;
	Tue, 11 Aug 2020 09:47:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F3DCA5531;
	Tue, 11 Aug 2020 09:47:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07B9kvxe014576 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 05:46:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F19EA208DD82; Tue, 11 Aug 2020 09:46:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED84F208DD80
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 09:46:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC27B186E3AA
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 09:46:54 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-277-WWORNM3TOe6P6T-M825pbw-1;
	Tue, 11 Aug 2020 05:46:50 -0400
X-MC-Unique: WWORNM3TOe6P6T-M825pbw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C0536ABE2;
	Tue, 11 Aug 2020 09:47:09 +0000 (UTC)
Message-ID: <8254cda18f6f5e98f0c097d1065a39b937ce8628.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, christophe.varoqui@opensvc.com, kabelac@redhat.com
Date: Tue, 11 Aug 2020 11:46:48 +0200
In-Reply-To: <7556f86a-0b45-8274-b9e7-0576813ca1fe@huawei.com>
References: <7556f86a-0b45-8274-b9e7-0576813ca1fe@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH V2] vector: return false if realloc fails in
 vector_alloc_slot func
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

On Tue, 2020-08-11 at 11:23 +0800, Zhiqiang Liu wrote:
> In vector_alloc_slot func, if REALLOC fails, it means new slot
> allocation fails. However, it just update v->allocated and then
> return the old v->slot without new slot. So, the caller will take
> the last old slot as the new allocated slot, and use it by calling
> vector_set_slot func. Finally, the data of last slot is lost.
> 
> Here, we rewrite vector_alloc_slot as suggested by Martin Wilck:
>  - increment v->allocated only after successful allocation,
>  - avoid the "if (v->slot)" conditional by just calling realloc(),
>  - make sure all newly allocated vector elements are set to NULL,
>  - change return value to bool.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>

Thanks a lot, this is very nice. We're almost there (see below).

> diff --git a/libmultipath/vector.c b/libmultipath/vector.c
> index 501cf4c5..39e2c20f 100644
> --- a/libmultipath/vector.c
> +++ b/libmultipath/vector.c
> @@ -35,26 +35,22 @@ vector_alloc(void)
>  }
> 
>  /* allocated one slot */
> -void *
> +bool
>  vector_alloc_slot(vector v)
>  {
>  	void *new_slot = NULL;
> 
>  	if (!v)
> -		return NULL;
> -
> -	v->allocated += VECTOR_DEFAULT_SIZE;
> -	if (v->slot)
> -		new_slot = REALLOC(v->slot, sizeof (void *) * v-
> >allocated);
> -	else
> -		new_slot = (void *) MALLOC(sizeof (void *) * v-
> >allocated);
> +		return false;
> 
> +	new_slot = REALLOC(v->slot, sizeof (void *) * (v->allocated +
> VECTOR_DEFAULT_SIZE));

Please wrap this line. We basically still use a 80-columns limit, with
the exception of string constants (mostly condlog() lines). We don't
strictly enforce it, but 92 columns is a bit too much for my taste.

>  	if (!new_slot)
> -		v->allocated -= VECTOR_DEFAULT_SIZE;
> -	else
> -		v->slot = new_slot;
> +		return false;
> 
> -	return v->slot;
> +	v->slot = new_slot;
> +	v->allocated += VECTOR_DEFAULT_SIZE;
> +	v->slot[VECTOR_SIZE(v) - 1] = NULL;

This assumes that VECTOR_DEFAULT_SIZE == 1. While that has been true
essentially forever, there's no guarantee for the future. Better use a
for loop, or memset().

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

