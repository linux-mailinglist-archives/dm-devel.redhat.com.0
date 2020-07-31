Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AAAE32349EC
	for <lists+dm-devel@lfdr.de>; Fri, 31 Jul 2020 19:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596215522;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pI2+bbvO6DG3q5qeI2DWRZUgIS6e+qBMth2TBZOuuDs=;
	b=haLEG+8dmUsO/3rSrENoU4IMIAyAuo4QiRyw3UCtSaPa4jPaYeTUkdxoy8s7V4iX7k/R8q
	h+bX/7Cy53SVR6Oc5rs13yXdogHVL4dqXckuhsH45UIgnROYQSDJBaXgihItNRZQEb6j0X
	+UyaYuSbTecnrWCllCcTqcPU0JRjKR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-Zgg5FslJN0OC21hnS0yrKg-1; Fri, 31 Jul 2020 13:12:00 -0400
X-MC-Unique: Zgg5FslJN0OC21hnS0yrKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6180B18C63C0;
	Fri, 31 Jul 2020 17:11:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54E675BAC3;
	Fri, 31 Jul 2020 17:11:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A9731809554;
	Fri, 31 Jul 2020 17:11:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06VHBKkA011993 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jul 2020 13:11:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D076712D9; Fri, 31 Jul 2020 17:11:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99E6F6FEDC;
	Fri, 31 Jul 2020 17:11:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06VHBC58001226; 
	Fri, 31 Jul 2020 12:11:12 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06VHBBaW001225;
	Fri, 31 Jul 2020 12:11:11 -0500
Date: Fri, 31 Jul 2020 12:11:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <20200731171111.GE19233@octiron.msp.redhat.com>
References: <a04e1267-0f1c-3a8b-c163-1697469ffeca@huawei.com>
MIME-Version: 1.0
In-Reply-To: <a04e1267-0f1c-3a8b-c163-1697469ffeca@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	linfeilong@huawei.com, dm-devel@redhat.com, kabelac@redhat.com,
	Martin Wilck <mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jul 31, 2020 at 06:41:57PM +0800, Zhiqiang Liu wrote:
> 
> In vector_alloc_slot func, if REALLOC fails, it means new slot
> allocation fails. However, it just update v->allocated and then
> return the old v->slot without new slot. So, the caller will take
> the last old slot as the new allocated slot, and use it by calling
> vector_set_slot func. Finally, the data of last slot is lost.
>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
 
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
>  		new_slot = (void *) MALLOC(sizeof (void *) * v->allocated);
> 
> -	if (!new_slot)
> +	/* If REALLOC or MALLOC fails, it means new slot allocation fails, so return NULL. */
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
>  }
> 
>  int
> -- 
> 2.24.0.windows.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

