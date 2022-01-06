Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 094AC4865FB
	for <lists+dm-devel@lfdr.de>; Thu,  6 Jan 2022 15:25:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641479158;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FhstvuMGrAbx/6aOHHHLgHeObzb4N+oi/KWXOpL9vQ4=;
	b=TxQVtCHvChPEOAHM70ZoOcr7luSay5hUtTEc2Su6MS2MylQIRCKqBdtjef7rO4M1RRU8UM
	7bSsnlbfFklzCiiroc6v2w7Q9WpRVeGHc1zaDx8bkCaJIFX4KMjnavSMDHgwHhA6xmwu/m
	CXKHW15rwIY7svF6LnV8FJkp+ZhDdjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-kJq238wPM5-pz895ekNNJA-1; Thu, 06 Jan 2022 09:25:56 -0500
X-MC-Unique: kJq238wPM5-pz895ekNNJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73B43801ADB;
	Thu,  6 Jan 2022 14:25:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9F0B78AA6;
	Thu,  6 Jan 2022 14:25:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 324534BB7C;
	Thu,  6 Jan 2022 14:25:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 206EPFQ1026944 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Jan 2022 09:25:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F2E9C40FF707; Thu,  6 Jan 2022 14:25:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDF8F40FF706
	for <dm-devel@redhat.com>; Thu,  6 Jan 2022 14:25:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3A1280029D
	for <dm-devel@redhat.com>; Thu,  6 Jan 2022 14:25:14 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
	[209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-380-Vj7MXOiqOYawk__pE2q-Gw-1; Thu, 06 Jan 2022 09:25:13 -0500
X-MC-Unique: Vj7MXOiqOYawk__pE2q-Gw-1
Received: by mail-qv1-f71.google.com with SMTP id
	jr7-20020a0562142a8700b00411a73d8adaso2217796qvb.3
	for <dm-devel@redhat.com>; Thu, 06 Jan 2022 06:25:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=zjWVs4zPgcDdd1aPB3vpvvfX4YAHpkfDtqx3W+FXTKs=;
	b=gkSOcievCpxQ45vgYaoS+xUTwCfRj0kYx6OL5OkSjIB7JzAG7XS3PWwZt0tMwaij0f
	Lw2196xwebvfy2C5enpA7oYd0qlccXizP7RIJLqyTsoxnR46jtLr9MxkPwuuzj/9I2JR
	rhj31HObGUhdkHSkcnCCMkxiMP+Y7oaeVpRPPx4N15cH7b5o7LIwFSgRi+ZvccOcQG4v
	ogY/OooImUHvdduOsrhs4dWSI6L9RsMCRCzv6Cz/L2XN/WrlvRLWlkeGm5ktI15JmBwb
	3bKazCaFVxG3w9CA2csHtOrvKm7cRWYkywJcHD8S9e79Fvo3+vkJDJ9upD4dSNN/lKFc
	VoVg==
X-Gm-Message-State: AOAM533PtywNjN0SXBGWr2UslCUwJoEHvf+78TU2UaZ3CAyUn5e/Uxxv
	7PtRULxKSY7LM7KWLrWyw2qKlpb/lyUgZJVUtw8N237/XPukQnudZ1ycoESvvZiitA1BKwwn5zw
	XX/anWWsYgiAQgw==
X-Received: by 2002:ad4:5bc1:: with SMTP id t1mr55388662qvt.72.1641479113111; 
	Thu, 06 Jan 2022 06:25:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKOVTax9MmJ/BsDVA698jC46T1CAe6gjkx43IVQTeQeAFAMpgK/80f1GePVibIat+L71jWbA==
X-Received: by 2002:ad4:5bc1:: with SMTP id t1mr55388644qvt.72.1641479112906; 
	Thu, 06 Jan 2022 06:25:12 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id u9sm1834967qta.17.2022.01.06.06.25.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Jan 2022 06:25:12 -0800 (PST)
Date: Thu, 6 Jan 2022 09:25:11 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <Ydb7xzmOC8VN8miQ@redhat.com>
References: <20220106100231.3278554-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20220106100231.3278554-1-gregkh@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm sysfs: use default_groups in kobj_type
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 06 2022 at  5:02P -0500,
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> There are currently 2 ways to create a set of sysfs files for a
> kobj_type, through the default_attrs field, and the default_groups
> field.  Move the dm sysfs code to use default_groups field which has
> been the preferred way since aa30f47cf666 ("kobject: Add support for
> default attribute groups to kobj_type") so that we can soon get rid of
> the obsolete default_attrs field.
> 
> Cc: Alasdair Kergon <agk@redhat.com>
> Cc: Mike Snitzer <snitzer@redhat.com>
> Cc: dm-devel@redhat.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/md/dm-sysfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-sysfs.c b/drivers/md/dm-sysfs.c
> index a05fcd50e1b9..e28c92478536 100644
> --- a/drivers/md/dm-sysfs.c
> +++ b/drivers/md/dm-sysfs.c
> @@ -112,6 +112,7 @@ static struct attribute *dm_attrs[] = {
>  	&dm_attr_rq_based_seq_io_merge_deadline.attr,
>  	NULL,
>  };
> +ATTRIBUTE_GROUPS(dm);

Bit strange to pass "dm" but then have ATTRIBUTE_GROUPS assume dm_attrs defined.
Feels like it'll invite janitors sending patches, that they never
compile, to remove dm_attrs.

>  
>  static const struct sysfs_ops dm_sysfs_ops = {
>  	.show	= dm_attr_show,
> @@ -120,7 +121,7 @@ static const struct sysfs_ops dm_sysfs_ops = {
>  
>  static struct kobj_type dm_ktype = {
>  	.sysfs_ops	= &dm_sysfs_ops,
> -	.default_attrs	= dm_attrs,
> +	.default_groups	= dm_groups,
>  	.release	= dm_kobject_release,
>  };
>  
> -- 
> 2.34.1
> 

But I've picked this patch up for 5.17.  Thanks.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

