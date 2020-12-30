Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2752E9DDE
	for <lists+dm-devel@lfdr.de>; Mon,  4 Jan 2021 20:04:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-EHfCZr5WNH6Wb5UGAQ-s7Q-1; Mon, 04 Jan 2021 14:04:23 -0500
X-MC-Unique: EHfCZr5WNH6Wb5UGAQ-s7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BC098145E4;
	Mon,  4 Jan 2021 19:04:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F08F1001281;
	Mon,  4 Jan 2021 19:04:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26C981809CA0;
	Mon,  4 Jan 2021 19:04:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BU7ccgC004667 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 30 Dec 2020 02:38:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 17C0D2026D76; Wed, 30 Dec 2020 07:38:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 139982026D49
	for <dm-devel@redhat.com>; Wed, 30 Dec 2020 07:38:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAE17858EEC
	for <dm-devel@redhat.com>; Wed, 30 Dec 2020 07:38:35 +0000 (UTC)
Received: from mail3-164.sinamail.sina.com.cn
	(mail3-164.sinamail.sina.com.cn [202.108.3.164]) by relay.mimecast.com
	with
	ESMTP id us-mta-440-m8N_T-B6NKisPv3z1I884A-1; Wed, 30 Dec 2020 02:38:32
	-0500
X-MC-Unique: m8N_T-B6NKisPv3z1I884A-1
Received: from unknown (HELO localhost.localdomain)([103.193.190.174])
	by sina.com with ESMTP
	id 5FEC2DE500036238; Wed, 30 Dec 2020 15:36:06 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 96132915074141
From: Hillf Danton <hdanton@sina.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 30 Dec 2020 15:35:57 +0800
Message-Id: <20201230073557.2253-1-hdanton@sina.com>
In-Reply-To: <20201229225714.1580-1-ignat@cloudflare.com>
References: <20201229225714.1580-1-ignat@cloudflare.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 04 Jan 2021 14:03:11 -0500
Cc: dm-crypt@saout.de, dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 1/2] dm crypt: use GFP_ATOMIC when allocating
	crypto requests from softirq
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 29 Dec 2020 22:57:13 +0000
> 
> Fixes: 39d42fa96ba1 ("dm crypt: add flags to optionally bypass kcryptd workqueues")

Looks like a seperate fix to this commit is needed if what can be found
at (Subject: [patch 00/12] UBS: Cleanup in_interupt/in_irq/in_atomic() usage)
https://lore.kernel.org/lkml/20201014145215.518912759@linutronix.de/

is correct.

> Reported-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> Cc: <stable@vger.kernel.org> # v5.9+
> Signed-off-by: Ignat Korchagin <ignat@cloudflare.com>
> ---
>  drivers/md/dm-crypt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 5f9f9b3a226d..777b5c71a2f7 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -1460,7 +1460,7 @@ static void crypt_alloc_req_skcipher(struct crypt_config *cc,
>  	unsigned key_index = ctx->cc_sector & (cc->tfms_count - 1);
>  
>  	if (!ctx->r.req)
> -		ctx->r.req = mempool_alloc(&cc->req_pool, GFP_NOIO);
> +		ctx->r.req = mempool_alloc(&cc->req_pool, in_interrupt() ? GFP_ATOMIC : GFP_NOIO);
>  
>  	skcipher_request_set_tfm(ctx->r.req, cc->cipher_tfm.tfms[key_index]);
>  
> @@ -1477,7 +1477,7 @@ static void crypt_alloc_req_aead(struct crypt_config *cc,
>  				 struct convert_context *ctx)
>  {
>  	if (!ctx->r.req_aead)
> -		ctx->r.req_aead = mempool_alloc(&cc->req_pool, GFP_NOIO);
> +		ctx->r.req_aead = mempool_alloc(&cc->req_pool, in_interrupt() ? GFP_ATOMIC : GFP_NOIO);
>  
>  	aead_request_set_tfm(ctx->r.req_aead, cc->cipher_tfm.tfms_aead[0]);
>  
> -- 
> 2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

