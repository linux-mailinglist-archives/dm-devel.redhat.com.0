Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3A32912E6DA
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jan 2020 14:38:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577972281;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5/LruLQTR7WriFV2n3siIGmW+FXOj07lfE+iY/7mm50=;
	b=ETQOagoA+V6crNNr398eaXgtyjAZf5U0buZ1i3nUxWfXW9hRcjxddFIrvKzIc/zFENN5L+
	Lim0KJZM7r8awGChayYBbt1JKjexds/eJTPKEXbDxlI5ToFJDslmqMQPiN/xp5B/xnQKzU
	WzzbP2cjDKvbV8xFejNrx9OnCy09otk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-lxhgZTfdNIy7yyVSU6Ey2A-1; Thu, 02 Jan 2020 08:37:57 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A9D11807466;
	Thu,  2 Jan 2020 13:37:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D1F07D878;
	Thu,  2 Jan 2020 13:37:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 628F718089CD;
	Thu,  2 Jan 2020 13:37:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 002DbbTY001678 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jan 2020 08:37:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0EDE560C88; Thu,  2 Jan 2020 13:37:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5278760BF4;
	Thu,  2 Jan 2020 13:37:34 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 002DbXUW002481; Thu, 2 Jan 2020 08:37:33 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 002DbXfX002477; Thu, 2 Jan 2020 08:37:33 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 2 Jan 2020 08:37:33 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Milan Broz <mbroz@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
In-Reply-To: <alpine.LRH.2.02.2001020822080.32205@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2001020832580.2073@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2001020822080.32205@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-crypt: fix GFP flags
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
X-MC-Unique: lxhgZTfdNIy7yyVSU6Ey2A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 2 Jan 2020, Mikulas Patocka wrote:

> GFP_KERNEL is not supposed to be ored with GFP_NOFS (the result is
> equivalent to GFP_KERNEL). Also, we use GFP_NOIO instead of GFP_NOFS,
> because we don't want any I/O being submitted in the direct reclaim path.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org	# v5.4+

Also - add these lines:

Fixes: 39d13a1ac41d ("dm crypt: reuse eboiv skcipher for IV generation")
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>

> ---
>  drivers/md/dm-crypt.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: linux-2.6/drivers/md/dm-crypt.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-crypt.c	2020-01-02 14:16:21.000000000 +0100
> +++ linux-2.6/drivers/md/dm-crypt.c	2020-01-02 14:16:21.000000000 +0100
> @@ -717,7 +717,7 @@ static int crypt_iv_eboiv_gen(struct cry
>  	struct crypto_wait wait;
>  	int err;
>  
> -	req = skcipher_request_alloc(any_tfm(cc), GFP_KERNEL | GFP_NOFS);
> +	req = skcipher_request_alloc(any_tfm(cc), GFP_NOIO);
>  	if (!req)
>  		return -ENOMEM;
>  
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

