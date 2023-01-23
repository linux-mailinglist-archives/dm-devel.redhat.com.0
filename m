Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7FD6774BD
	for <lists+dm-devel@lfdr.de>; Mon, 23 Jan 2023 06:09:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674450582;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z+OQ+qlPh1kEB/AEwVM4nvvx5+FsSpZCQUan3xRp6Kk=;
	b=Dz5ep6nXJcf6V22JtAnP8SiF8gaKv4C45nr+ETgtlwqCmTPcUdZYwqvXn0IU/zj9nDTm18
	ybmDDgIqgdd6K0o5+Wnzoa3K2AjdUaR9TdcNP/FV45rzCZbzE8GYSoT3LzgkkbFoDfWocM
	lw02HykGulX6xCcm8QiQx0bF2XOQCus=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-gwmMEtkHO_29dA0vUtPKsg-1; Mon, 23 Jan 2023 00:09:41 -0500
X-MC-Unique: gwmMEtkHO_29dA0vUtPKsg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C5BB3C02535;
	Mon, 23 Jan 2023 05:09:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36EF6492C3C;
	Mon, 23 Jan 2023 05:09:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1D0891946595;
	Mon, 23 Jan 2023 05:09:30 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6CC091946586
 for <dm-devel@listman.corp.redhat.com>; Mon, 23 Jan 2023 05:09:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 596C12166B33; Mon, 23 Jan 2023 05:09:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 527732166B32
 for <dm-devel@redhat.com>; Mon, 23 Jan 2023 05:09:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34A1D8533DA
 for <dm-devel@redhat.com>; Mon, 23 Jan 2023 05:09:29 +0000 (UTC)
Received: from box.fidei.email (box.fidei.email [71.19.144.250]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-148-SJJu0knvPheJ5JqI6a3osg-1; Mon,
 23 Jan 2023 00:09:25 -0500
X-MC-Unique: SJJu0knvPheJ5JqI6a3osg-1
Received: from authenticated-user (box.fidei.email [71.19.144.250])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by box.fidei.email (Postfix) with ESMTPSA id 3EA0282767
 for <dm-devel@redhat.com>; Sun, 22 Jan 2023 23:59:40 -0500 (EST)
Message-ID: <2b416f93-9368-24c3-dd5f-8e2d42429020@dorminy.me>
Date: Sun, 22 Jan 2023 23:59:39 -0500
MIME-Version: 1.0
To: dm-devel@redhat.com
References: <alpine.LRH.2.21.2301221402130.15312@file01.intranet.prod.int.rdu2.redhat.com>
From: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
In-Reply-To: <alpine.LRH.2.21.2301221402130.15312@file01.intranet.prod.int.rdu2.redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [dm-devel] [PATCH 1/3] dm-flakey: don't corrupt the zero page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"



On 1/22/23 14:02, Mikulas Patocka wrote:
> When we need to zero some range on a block device, the function
> __blkdev_issue_zero_pages submits a write bio with the bio vector pointing
> to the zero page. If we use dm-flakey with corrupt bio writes option, it
> will corrupt the content of the zero page which results in crashes of
> various userspace programs. Glibc assumes that memory returned by mmap is
> zeroed and it uses it for calloc implementation; if the newly mapped
> memory is not zeroed, calloc will return non-zeroed memory.
> 
> This patches fixes the bug by testing if the page is equal to ZERO_PAGE(0)
> and avoiding the corruption in this case.

Nice catch!
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org
Reviewed-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
> 
> ---
>   drivers/md/dm-flakey.c |    7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> Index: bcachefs/drivers/md/dm-flakey.c
> ===================================================================
> --- bcachefs.orig/drivers/md/dm-flakey.c	2023-01-22 16:56:35.000000000 +0100
> +++ bcachefs/drivers/md/dm-flakey.c	2023-01-22 16:58:40.000000000 +0100
> @@ -303,8 +303,11 @@ static void corrupt_bio_data(struct bio
>   	 */
>   	bio_for_each_segment(bvec, bio, iter) {
>   		if (bio_iter_len(bio, iter) > corrupt_bio_byte) {
> -			char *segment = (page_address(bio_iter_page(bio, iter))
> -					 + bio_iter_offset(bio, iter));
> +			char *segment;
> +			struct page *page = bio_iter_page(bio, iter);
> +			if (unlikely(page == ZERO_PAGE(0)))
> +				break;
> +			segment = (page_address(page) + bio_iter_offset(bio, iter));
>   			segment[corrupt_bio_byte] = fc->corrupt_bio_value;
>   			DMDEBUG("Corrupting data bio=%p by writing %u to byte %u "
>   				"(rw=%c bi_opf=%u bi_sector=%llu size=%u)\n",
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://listman.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

