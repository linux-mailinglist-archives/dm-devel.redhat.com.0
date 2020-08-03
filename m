Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 54CC323ABD0
	for <lists+dm-devel@lfdr.de>; Mon,  3 Aug 2020 19:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596476981;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vq742NLueiDEEmJcYT/KCEOpRIWGzWk+BtuDuiGoir4=;
	b=awZ92pSpUEmB8azRoDQKBqSFHKcVwYzAv8mQLcprSQ/NvlLxIYryrpsaGkAYxAzVVKCTf2
	dNUN7M3dIRBBuYNHyWpOOqzihgmqkSJG+8aGS2Mg8RYAqrpVf/uCgHGq2DcOzbA8poizz3
	lAsz7tdRdU3SZQKTqz3nm3a7w1IU5yE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-ajrDG8LtPBej_0z0EosBZw-1; Mon, 03 Aug 2020 13:49:39 -0400
X-MC-Unique: ajrDG8LtPBej_0z0EosBZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72B1C1902EA4;
	Mon,  3 Aug 2020 17:49:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 321A872E48;
	Mon,  3 Aug 2020 17:49:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 863CF9A119;
	Mon,  3 Aug 2020 17:49:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 073HnJOY014455 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 13:49:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7472659; Mon,  3 Aug 2020 17:49:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 517931755E;
	Mon,  3 Aug 2020 17:49:16 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 073HnDw1021139; 
	Mon, 3 Aug 2020 12:49:13 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 073HnC1W021138;
	Mon, 3 Aug 2020 12:49:12 -0500
Date: Mon, 3 Aug 2020 12:49:12 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <20200803174912.GG19233@octiron.msp.redhat.com>
References: <94c8222f-a941-dee3-54eb-f243fd28b85a@huawei.com>
MIME-Version: 1.0
In-Reply-To: <94c8222f-a941-dee3-54eb-f243fd28b85a@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	linfeilong <linfeilong@huawei.com>, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>, Martin Wilck <mwilck@suse.com>
Subject: Re: [dm-devel] [dm- devel][PATCH] vector: fix upper boundary check
 of vector size in vector_del_slot
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Aug 03, 2020 at 10:39:29AM +0800, Zhiqiang Liu wrote:
> 
> In vector_del_slot func, legal value of input slot is in range of
> [0, VECTOR_SIZE(v)), it means slot value should be less then VECTOR_SIZE(v).
> 
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  libmultipath/vector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libmultipath/vector.c b/libmultipath/vector.c
> index 501cf4c5..5b047e40 100644
> --- a/libmultipath/vector.c
> +++ b/libmultipath/vector.c
> @@ -109,7 +109,7 @@ vector_del_slot(vector v, int slot)
>  {
>  	int i;
> 
> -	if (!v || !v->allocated || slot < 0 || slot > VECTOR_SIZE(v))
> +	if (!v || !v->allocated || slot < 0 || slot >= VECTOR_SIZE(v))
>  		return;
> 
>  	for (i = slot + 1; i < VECTOR_SIZE(v); i++)
> -- 
> 2.24.0.windows.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

