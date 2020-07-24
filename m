Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E58D722CB27
	for <lists+dm-devel@lfdr.de>; Fri, 24 Jul 2020 18:35:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595608517;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LBcPHRvxe/e2Q6QqRnr6GJm4us19snztliHtEx5MXTw=;
	b=FBm2MnLKIA7jzix+2Y/8V2NcCQRna0Mz1bgvFiSWzubymZ7wMBlIiRB9txJcEs21lQccOt
	IYcQv0RkajI28yWWzlQxuZsFKeamgrQKmYueTpxZZ+g/sL00TeEmOtZz15mcCULd4ZQ09q
	s1wpTC8Q/EYHWx1Cl7BVSmbFw8+9X0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-Drtw8jIBOR6QZbEWWZ6IPQ-1; Fri, 24 Jul 2020 12:35:12 -0400
X-MC-Unique: Drtw8jIBOR6QZbEWWZ6IPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCE9C8017FB;
	Fri, 24 Jul 2020 16:35:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5D6F7269A;
	Fri, 24 Jul 2020 16:35:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0BF1FA358C;
	Fri, 24 Jul 2020 16:34:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OGYaOn003176 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 12:34:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CBB437DD; Fri, 24 Jul 2020 16:34:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15ABD70107;
	Fri, 24 Jul 2020 16:34:32 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06OGYVBE015999; 
	Fri, 24 Jul 2020 11:34:31 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06OGYUQZ015998;
	Fri, 24 Jul 2020 11:34:30 -0500
Date: Fri, 24 Jul 2020 11:34:30 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <20200724163430.GM11089@octiron.msp.redhat.com>
References: <40a7ea22-8897-363a-5821-99add9de6dc5@huawei.com>
MIME-Version: 1.0
In-Reply-To: <40a7ea22-8897-363a-5821-99add9de6dc5@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: yanxiaodan@huawei.com, linfeilong@huawei.com, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>, Martin Wilck <mwilck@suse.com>
Subject: Re: [dm-devel] [PATCH V2] libmultipath: free pp if store_path fails
 in disassemble_map
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

On Fri, Jul 24, 2020 at 09:40:18AM +0800, Zhiqiang Liu wrote:
> In disassemble_map func, one pp will be allocated and stored in
> pgp->paths. However, if store_path fails, pp will not be freed,
> then memory leak problem occurs.
> 
> Here, we will call free_path to free pp when store_path fails.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
> V1->V2: update based on ups/submit-2007 branch.
> 
>  libmultipath/dmparser.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> index b9858fa5..8a0501ba 100644
> --- a/libmultipath/dmparser.c
> +++ b/libmultipath/dmparser.c
> @@ -143,6 +143,7 @@ int disassemble_map(const struct _vector *pathvec,
>  	int def_minio = 0;
>  	struct path * pp;
>  	struct pathgroup * pgp;
> +	int pp_alloc_flag = 0;
> 
>  	assert(pathvec != NULL);
>  	p = params;
> @@ -292,6 +293,7 @@ int disassemble_map(const struct _vector *pathvec,
> 
>  		for (j = 0; j < num_paths; j++) {
>  			pp = NULL;
> +			pp_alloc_flag = 0;
>  			p += get_word(p, &word);
> 
>  			if (!word)
> @@ -304,13 +306,16 @@ int disassemble_map(const struct _vector *pathvec,
> 
>  				if (!pp)
>  					goto out1;
> -
> +				pp_alloc_flag = 1;
>  				strlcpy(pp->dev_t, word, BLK_DEV_SIZE);
>  			}
>  			FREE(word);
> 
> -			if (store_path(pgp->paths, pp))
> +			if (store_path(pgp->paths, pp)) {
> +				if (pp_alloc_flag)
> +					free_path(pp);
>  				goto out;
> +			}
> 
>  			pgp->id ^= (long)pp;
>  			pp->pgindex = i + 1;
> -- 
> 2.24.0.windows.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

