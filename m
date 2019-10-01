Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D39C43E3
	for <lists+dm-devel@lfdr.de>; Wed,  2 Oct 2019 00:43:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6FD0356C9;
	Tue,  1 Oct 2019 22:43:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1C045D9CD;
	Tue,  1 Oct 2019 22:43:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65E244E589;
	Tue,  1 Oct 2019 22:42:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x91Mgfvp025294 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Oct 2019 18:42:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 46B4A60624; Tue,  1 Oct 2019 22:42:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 420DB60619
	for <dm-devel@redhat.com>; Tue,  1 Oct 2019 22:42:36 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F7733DE31
	for <dm-devel@redhat.com>; Tue,  1 Oct 2019 22:42:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r3so17373326wrj.6
	for <dm-devel@redhat.com>; Tue, 01 Oct 2019 15:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:cc:references:from:message-id:date:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=awztSnB5hoo/FQRf1nvu0k1r3raB9rjhQttK/ILVBZg=;
	b=pejSu2yL+rDHpEuq01zvlGWa1Yknjh9Dj0XcchTW8jfWW24PGBX7Ny9N+IC3uyd3Us
	EfU7kKhTjpGG0Vl69+0OgVySinDP/zPoUPRqkZ9SFPizqxVaBxR7icFeFYHFkm9vvu9+
	gdXW7Tct6TteQLzK61RdT9tO34lE6adOjPU4aE74c2dqeQydG0YN35ir7bktRD8OQVnL
	V7Wz3u8O7PJGQpysvKRobS413yfS2rwcxSMQkDjfQwR93Aju4QlGRD8p9z2cl9txjqT3
	UyGO4UO326wBNCyWuq4dfqlh4iD4CF4gsz01W8uLkTtV7GVUDLqkKTBOpfBeVFaAoPVx
	nV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:cc:references:from:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=awztSnB5hoo/FQRf1nvu0k1r3raB9rjhQttK/ILVBZg=;
	b=bcqZ1F5fOdceT8yPZ/qgTvus3Ks8N3yzEUyPmpPtS81DH7LNfaEam1AOvL5fYH+AEh
	veYPWA8ytte58x/61UBaqZx+QVJ4XvMa39ulsoPTpVvUNcFYpr1cmq5s+Wfl5b8gSfsL
	E0jiKBZFKG8GOhR0VUyf3a9R4CVhCND565ErF6N+0kWBF4hjb/WzKp2JAyJTWK1tKcuD
	sNwEjtidkjAmvOJCcXHnHWTrXqrNTT399+NGveyBF6lY7Jr+5ZN7J4ab0hGPcfqK/+RZ
	M6ru2fSFMwsAcJcJmEYPDCATbU3pKBvVClkFpAOa0Wnl+jLWF8YfPGI87wu/cMJoEOIS
	TdvA==
X-Gm-Message-State: APjAAAVnXo3IVv+s1o9XVrTWY2SV3iMczQjyxUju1qTQlF9nr+pu+/eC
	MRugt6juD+uGRHn9AyesTfj50Qo=
X-Google-Smtp-Source: APXvYqyqumT23zhidn7uhwtIhLqyBZQsWKwhPIZy+CqI+ThO8iKEHZitvEaG0E/6AIAlFKi2JcMf1Q==
X-Received: by 2002:a5d:5384:: with SMTP id d4mr51326wrv.255.1569969753598;
	Tue, 01 Oct 2019 15:42:33 -0700 (PDT)
Received: from localhost (30.red-83-46-161.dynamicip.rima-tde.net.
	[83.46.161.30]) by smtp.gmail.com with ESMTPSA id
	h125sm7311072wmf.31.2019.10.01.15.42.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 01 Oct 2019 15:42:33 -0700 (PDT)
References: <20190921234039.26515-1-xose.vazquez@gmail.com>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <617b928c-cbf2-a8b3-723b-b0066c96e24a@gmail.com>
Date: Wed, 2 Oct 2019 00:42:32 +0200
MIME-Version: 1.0
In-Reply-To: <20190921234039.26515-1-xose.vazquez@gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 01 Oct 2019 22:42:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Tue, 01 Oct 2019 22:42:35 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: 2.475 ** (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, MALFORMED_FREEMAIL, MISSING_HEADERS,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] multipath-tools: cosmetic changes in hwtable
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 01 Oct 2019 22:43:15 +0000 (UTC)

On 9/22/19 1:40 AM, Xose Vazquez Perez wrote:

> Tegile IntelliFlash was acquired by DDN, from WD.
> 
> HPE Primera is also identified as 3PARdata/VV

Christophe, this one is missing. Thanks.

> Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
> Cc: DM-DEVEL ML <dm-devel@redhat.com>
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> ---
>   libmultipath/hwtable.c | 25 +++++++++++--------------
>   1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
> index a06872e..7a8f276 100644
> --- a/libmultipath/hwtable.c
> +++ b/libmultipath/hwtable.c
> @@ -107,7 +107,7 @@ static struct hwentry default_hw[] = {
>   	 * HPE
>   	 */
>   	{
> -		/* 3PAR */
> +		/* 3PAR / Primera */
>   		.vendor        = "3PARdata",
>   		.product       = "VV",
>   		.pgpolicy      = GROUP_BY_PRIO,
> @@ -311,6 +311,16 @@ static struct hwentry default_hw[] = {
>   		.pgpolicy      = GROUP_BY_SERIAL,
>   		.no_path_retry = 30,
>   	},
> +	{
> +		/* Tegile IntelliFlash */
> +		.vendor        = "TEGILE",
> +		.product       = "(ZEBI-(FC|ISCSI)|INTELLIFLASH)",
> +		.hwhandler     = "1 alua",
> +		.pgpolicy      = GROUP_BY_PRIO,
> +		.pgfailback    = -FAILBACK_IMMEDIATE,
> +		.prio_name     = PRIO_ALUA,
> +		.no_path_retry = 10,
> +	},
>   	/*
>   	 * Dell EMC
>   	 */
> @@ -1074,19 +1084,6 @@ static struct hwentry default_hw[] = {
>   		.product       = "K2",
>   		.pgpolicy      = MULTIBUS,
>   	},
> -	/*
> -	 * Western Digital (Tegile Systems)
> -	 */
> -	{
> -		/* IntelliFlash */
> -		.vendor        = "TEGILE",
> -		.product       = "(ZEBI-(FC|ISCSI)|INTELLIFLASH)",
> -		.hwhandler     = "1 alua",
> -		.pgpolicy      = GROUP_BY_PRIO,
> -		.pgfailback    = -FAILBACK_IMMEDIATE,
> -		.prio_name     = PRIO_ALUA,
> -		.no_path_retry = 10,
> -	},
>   	/*
>   	 * Imation/Nexsan
>   	 */
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
