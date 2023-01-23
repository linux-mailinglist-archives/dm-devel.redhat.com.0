Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEDA6774BE
	for <lists+dm-devel@lfdr.de>; Mon, 23 Jan 2023 06:09:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674450583;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hsUF7X5MMnoOqZLA4SlTnYYBDYqLcPkG92mvuh9wEGU=;
	b=eVNPnIQkVAWfZzwMxp+E96crY67XmkJwlzfCGTWK/ffwPoofx0Utfk86hYbfD3v34Yj+Gx
	LZX+XZqzLBVtafSuIT0uIQFN4QiZhBirP3zKAJsI7w3+lF1el7pBIXxNm8yf3cS/X7J+1B
	oSGk/Hm3gXwpLtGlmN3QfXOMLYZOtuE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-VdUKD5pZNcWNgrEIRyXAWQ-1; Mon, 23 Jan 2023 00:09:40 -0500
X-MC-Unique: VdUKD5pZNcWNgrEIRyXAWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C9F280D0EA;
	Mon, 23 Jan 2023 05:09:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C0F0C15BA0;
	Mon, 23 Jan 2023 05:09:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 232E11946597;
	Mon, 23 Jan 2023 05:09:35 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BB1F81946586
 for <dm-devel@listman.corp.redhat.com>; Mon, 23 Jan 2023 05:09:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AC73F492C3F; Mon, 23 Jan 2023 05:09:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C3C1492C3E
 for <dm-devel@redhat.com>; Mon, 23 Jan 2023 05:09:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8146A8533DD
 for <dm-devel@redhat.com>; Mon, 23 Jan 2023 05:09:33 +0000 (UTC)
Received: from box.fidei.email (box.fidei.email [71.19.144.250]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-148-uXmjlSsbMCOkKE6v1IVtjg-1; Mon,
 23 Jan 2023 00:09:25 -0500
X-MC-Unique: uXmjlSsbMCOkKE6v1IVtjg-1
Received: from authenticated-user (box.fidei.email [71.19.144.250])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by box.fidei.email (Postfix) with ESMTPSA id B7EA680447
 for <dm-devel@redhat.com>; Mon, 23 Jan 2023 00:00:22 -0500 (EST)
Message-ID: <542c8a66-667b-7360-afa5-79b5e74fe960@dorminy.me>
Date: Mon, 23 Jan 2023 00:00:21 -0500
MIME-Version: 1.0
To: dm-devel@redhat.com
References: <alpine.LRH.2.21.2301221402580.15312@file01.intranet.prod.int.rdu2.redhat.com>
From: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
In-Reply-To: <alpine.LRH.2.21.2301221402580.15312@file01.intranet.prod.int.rdu2.redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [dm-devel] [PATCH 2/3] dm-flakey: fix a bug with 32-bit highmem
 systems
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"



On 1/22/23 14:03, Mikulas Patocka wrote:
> The function page_address does not work with 32-bit systems with high
> memory. Use bvec_kmap_local/kunmap_local instead.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org
Reviewed-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
> 
> ---
>   drivers/md/dm-flakey.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Index: bcachefs/drivers/md/dm-flakey.c
> ===================================================================
> --- bcachefs.orig/drivers/md/dm-flakey.c	2023-01-22 16:58:40.000000000 +0100
> +++ bcachefs/drivers/md/dm-flakey.c	2023-01-22 17:13:53.000000000 +0100
> @@ -307,8 +307,9 @@ static void corrupt_bio_data(struct bio
>   			struct page *page = bio_iter_page(bio, iter);
>   			if (unlikely(page == ZERO_PAGE(0)))
>   				break;
> -			segment = (page_address(page) + bio_iter_offset(bio, iter));
> +			segment = bvec_kmap_local(&bvec);
>   			segment[corrupt_bio_byte] = fc->corrupt_bio_value;
> +			kunmap_local(segment);
>   			DMDEBUG("Corrupting data bio=%p by writing %u to byte %u "
>   				"(rw=%c bi_opf=%u bi_sector=%llu size=%u)\n",
>   				bio, fc->corrupt_bio_value, fc->corrupt_bio_byte,
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://listman.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

