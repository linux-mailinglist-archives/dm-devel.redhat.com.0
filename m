Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C84521BDC0C
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 14:25:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588163147;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v2dBnybNmg7BeRX16pPi+a05qThvDfLngDV0AvNEZ7M=;
	b=ZfcNsENDo9Le3t1iNyV4iSjzeenlEb82g0JPQd0a7oiNxXFscDa+Pn0VHTOgspHsljEzC3
	zXWrp+lunMPHLLSvGYES4uyi9Ny4wasNTYRiDUIcQqb+muB5oi4/AKUoZB4GpCgc78sNQr
	xvHBw6NWJJOv09OjS8bNAkYxoA6gYvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-nLZUyMvkMdu13bVLiKJiIw-1; Wed, 29 Apr 2020 08:25:45 -0400
X-MC-Unique: nLZUyMvkMdu13bVLiKJiIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE81780058A;
	Wed, 29 Apr 2020 12:25:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 593D01002395;
	Wed, 29 Apr 2020 12:25:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B55111809542;
	Wed, 29 Apr 2020 12:25:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TCOhDN032516 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 08:24:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A44831002395; Wed, 29 Apr 2020 12:24:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [192.168.1.10] (unknown [10.40.193.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E52C3101E678;
	Wed, 29 Apr 2020 12:24:36 +0000 (UTC)
To: Zheng Bin <zhengbin13@huawei.com>, agk@redhat.com, snitzer@redhat.com,
	dm-devel@redhat.com
References: <20200429015231.107422-1-zhengbin13@huawei.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <23da0d30-d053-5a2c-d7c4-e7bdcea20968@redhat.com>
Date: Wed, 29 Apr 2020 14:24:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429015231.107422-1-zhengbin13@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm ebs: make symbol 'dm_ebs_init',
 'dm_ebs_exit' static
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 4/29/20 3:52 AM, Zheng Bin wrote:
> Fix sparse warnings:
>
> drivers/md/dm-ebs-target.c:423:12: warning: symbol 'dm_ebs_init' was not declared. Should it be static?
> drivers/md/dm-ebs-target.c:433:6: warning: symbol 'dm_ebs_exit' was not declared. Should it be static?
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
> ---
>   drivers/md/dm-ebs-target.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
> index a412647b7acc..19125dd85214 100644
> --- a/drivers/md/dm-ebs-target.c
> +++ b/drivers/md/dm-ebs-target.c
> @@ -420,7 +420,7 @@ static struct target_type ebs_target = {
>   	.iterate_devices = ebs_iterate_devices,
>   };
>
> -int __init dm_ebs_init(void)
> +static int __init dm_ebs_init(void)
>   {
>   	int r = dm_register_target(&ebs_target);
>
> @@ -430,7 +430,7 @@ int __init dm_ebs_init(void)
>   	return r;
>   }
>
> -void dm_ebs_exit(void)
> +static void dm_ebs_exit(void)
>   {
>   	dm_unregister_target(&ebs_target);
>   }
> --
> 2.26.0.106.g9fadedd
>

Acked, thanks.

Heinz

> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

