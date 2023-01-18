Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B734671B68
	for <lists+dm-devel@lfdr.de>; Wed, 18 Jan 2023 13:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674043330;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cd9KyzN5i+5pKcDaGH2Ged/9eHDQfn7igQkxGwSXQFY=;
	b=TX2hxISphy/Dx8CQarBm9llqn9xeI2hOj9vCifHUPE3/wqhaMiNze7oHwlJBP8gqG0KZvM
	GHiOKn/DtyFlN7OqqnMveBuf8GZTNaXoJlwh2WV6p+594MwAqi+1uitC8Fbu2231BfF02c
	vGN/BNfTeuLXpFHWq0yMevZoK9TtyAs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-96Dzm37vPC-A-1JbyMrdHQ-1; Wed, 18 Jan 2023 07:02:08 -0500
X-MC-Unique: 96Dzm37vPC-A-1JbyMrdHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ED853C10154;
	Wed, 18 Jan 2023 12:02:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C823551E5;
	Wed, 18 Jan 2023 12:02:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AE7F51946A7A;
	Wed, 18 Jan 2023 12:02:01 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9509A19465B7
 for <dm-devel@listman.corp.redhat.com>; Wed, 18 Jan 2023 11:59:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 76E00492B02; Wed, 18 Jan 2023 11:59:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 280C3492B00;
 Wed, 18 Jan 2023 11:59:04 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 30IBx3kC020549; Wed, 18 Jan 2023 06:59:03 -0500
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 30IBx2Lm020530; Wed, 18 Jan 2023 06:59:02 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Wed, 18 Jan 2023 06:59:02 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Sergey Shtylyov <s.shtylyov@omp.ru>
In-Reply-To: <c8c9df45-1d59-3195-7631-51b3a58148ee@omp.ru>
Message-ID: <alpine.LRH.2.21.2301180658250.13031@file01.intranet.prod.int.rdu2.redhat.com>
References: <c8c9df45-1d59-3195-7631-51b3a58148ee@omp.ru>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH] md: dm-ioctl: drop always-false condition
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
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@kernel.org>,
 lvc-patches@linuxtesting.org, Alasdair Kergon <agk@redhat.com>,
 linux-kernel@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 17 Jan 2023, Sergey Shtylyov wrote:

> The expression 'indata[3] > ULONG_MAX' always evaluates to false since
> indata[] is declared as an array of *unsigned long* elements and #define
> ULONG_MAX represents the max value of that exact type...
> 
> Note that gcc seems to be able to detect the dead code here and eliminate
> this check anyway...
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Reviewed-by: Mikulas Patocka <mpatocka@redhat.com>

> ---
> This patch is atop of the 'for-next' branch of the device-mapper repo...
> 
>  drivers/md/dm-ioctl.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Index: linux-dm/drivers/md/dm-ioctl.c
> ===================================================================
> --- linux-dm.orig/drivers/md/dm-ioctl.c
> +++ linux-dm/drivers/md/dm-ioctl.c
> @@ -1073,8 +1073,7 @@ static int dev_set_geometry(struct file
>  		goto out;
>  	}
>  
> -	if (indata[0] > 65535 || indata[1] > 255 ||
> -	    indata[2] > 255 || indata[3] > ULONG_MAX) {
> +	if (indata[0] > 65535 || indata[1] > 255 || indata[2] > 255) {
>  		DMERR("Geometry exceeds range limits.");
>  		goto out;
>  	}
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://listman.redhat.com/mailman/listinfo/dm-devel
> 
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

