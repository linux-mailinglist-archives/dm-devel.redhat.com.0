Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DC362EF17
	for <lists+dm-devel@lfdr.de>; Fri, 18 Nov 2022 09:19:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668759596;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iDZgt9jZhtTYar6kkXTC8laIirigpXv/HOt/ExKaZro=;
	b=KKPpWo0YFTTahB2IlW6VhpzBf0flTmg61Gmt1dSxAMvNTywggNOVxhOYwnl0TowE4N/sRn
	hS+Y7li76dOoUI7qG8o0EC8wOxbJ9XiWbXCdg2j8ZQZLFXQVBsOOHjg3LqJ5AhWxI7AEJx
	wFCpBbFOcOiQKl1IB9ub0DkVPFs3dO0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-tKdhyNoBN0KgnxqJN-YcgQ-1; Fri, 18 Nov 2022 03:19:52 -0500
X-MC-Unique: tKdhyNoBN0KgnxqJN-YcgQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 962D185A59D;
	Fri, 18 Nov 2022 08:19:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DDFC4A9254;
	Fri, 18 Nov 2022 08:19:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 892C41946A42;
	Fri, 18 Nov 2022 08:19:43 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E344C1946595
 for <dm-devel@listman.corp.redhat.com>; Thu, 17 Nov 2022 14:30:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9C9E72166B3F; Thu, 17 Nov 2022 14:30:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9554B2166B29
 for <dm-devel@redhat.com>; Thu, 17 Nov 2022 14:30:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76FBE29DD996
 for <dm-devel@redhat.com>; Thu, 17 Nov 2022 14:30:03 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-BFxg0bfuNPGIinZ7Gyqz2Q-1; Thu, 17 Nov 2022 09:29:58 -0500
X-MC-Unique: BFxg0bfuNPGIinZ7Gyqz2Q-1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="293257201"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="293257201"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 06:28:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="884886569"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="884886569"
Received: from mtkaczyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.28.141])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 06:28:48 -0800
Date: Thu, 17 Nov 2022 15:28:43 +0100
From: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20221117152843.00002f30@linux.intel.com>
In-Reply-To: <alpine.LRH.2.21.2211040957470.19553@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.21.2211040957470.19553@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Fri, 18 Nov 2022 08:19:43 +0000
Subject: Re: [dm-devel] [PATCH] mdadm: fix compilation failure on the x32 ABI
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
Cc: Jes Sorensen <jsorensen@fb.com>, linux-raid@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 Guoqing Jiang <guoqing.jiang@linux.dev>, Zdenek Kabelac <zkabelac@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 4 Nov 2022 10:01:22 -0400 (EDT)
Mikulas Patocka <mpatocka@redhat.com> wrote:

> Hi
> 
> Here I'm sending a patch for the mdadm utility. It fixes compile failure 
> on the x32 ABI.
> 
> Mikulas
> 
> 
> From: Mikulas Patocka <mpatocka@redhat.com>
> 
> The x32 ABI has 32-bit long and 64-bit time_t. Consequently, it reports 
> printf arguments mismatch when attempting to print time using the "%ld" 
> format specifier.
> 
> Fix this by converting times to long long and using %lld when printing
> them.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> ---
>  monitor.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Index: mdadm/monitor.c
> ===================================================================
> --- mdadm.orig/monitor.c	2022-11-04 14:25:52.000000000 +0100
> +++ mdadm/monitor.c	2022-11-04 14:28:05.000000000 +0100
> @@ -449,9 +449,9 @@ static int read_and_act(struct active_ar
>  	}
>  
>  	gettimeofday(&tv, NULL);
> -	dprintf("(%d): %ld.%06ld state:%s prev:%s action:%s prev: %s
> start:%llu\n",
> +	dprintf("(%d): %lld.%06lld state:%s prev:%s action:%s prev: %s
> start:%llu\n", a->info.container_member,
> -		tv.tv_sec, tv.tv_usec,
> +		(long long)tv.tv_sec, (long long)tv.tv_usec,
>  		array_states[a->curr_state],
>  		array_states[a->prev_state],
>  		sync_actions[a->curr_action],
> 
Hi Mikulas,
This is just a debug log in mdmon, feel free to remove the time totally.

Thanks,
Mariusz

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

