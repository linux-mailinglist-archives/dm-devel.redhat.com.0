Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DABD6545011
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jun 2022 17:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654786971;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RqeIqJLdzijSqpGMk10KGnYwkifkXzu0lgidawhRT7Y=;
	b=cZk01D/BFbC+o1orz7U9wCZqAL0UaRFsivHpxSOARkSnDuSOiMck6g2sjUdZEtH4mgJaSn
	aNpHHjgn824MgXybg3ItT3w3PazW87nGatdpnHmXfZT16bfdB1xfvuNJHj2ixVdeIpuHyl
	JnuLakEVgBQyDF5vNk3oO9c1P3NQDFY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-fbLU_OToP1KaEWxYr07Ycw-1; Thu, 09 Jun 2022 11:02:50 -0400
X-MC-Unique: fbLU_OToP1KaEWxYr07Ycw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 397CD294EDDE;
	Thu,  9 Jun 2022 15:02:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6891018EA3;
	Thu,  9 Jun 2022 15:02:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 61ACB1947067;
	Thu,  9 Jun 2022 15:02:40 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 18821194705E
 for <dm-devel@listman.corp.redhat.com>; Thu,  9 Jun 2022 15:02:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EBBD3C23DBF; Thu,  9 Jun 2022 15:02:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3EB5C28115;
 Thu,  9 Jun 2022 15:02:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 259F2bBg030291;
 Thu, 9 Jun 2022 10:02:37 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 259F2aFl030290;
 Thu, 9 Jun 2022 10:02:36 -0500
Date: Thu, 9 Jun 2022 10:02:36 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220609150236.GZ5254@octiron.msp.redhat.com>
References: <20220531102445.18518-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220531102445.18518-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH] libmultipath,
 kpartx: fix callers of dm_get_next_target()
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
Cc: lixiaokeng@huawei.com, Christophe Varoqui <christophe.varoqui@opensvc.com>,
 dm-devel@redhat.com, Wu Guanghao <wuguanghao3@huawei.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 31, 2022 at 12:24:45PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> dm_get_next_target() may return NULL for target_type and params
> in some situations. Follows the same idea as the previous patch
> "dm_get_map: fix segfault when can't found target" by Wu Guanghao.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  kpartx/devmapper.c       |  6 ++++--
>  libmultipath/devmapper.c | 10 ++++++++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/kpartx/devmapper.c b/kpartx/devmapper.c
> index 49ffd31..bf14c78 100644
> --- a/kpartx/devmapper.c
> +++ b/kpartx/devmapper.c
> @@ -412,8 +412,10 @@ dm_get_map(const char *mapname, char * outparams)
>  		goto out;
>  
>  	/* Fetch 1st target */
> -	dm_get_next_target(dmt, NULL, &start, &length,
> -			   &target_type, &params);
> +	if (dm_get_next_target(dmt, NULL, &start, &length,
> +			       &target_type, &params) != NULL || !params)
> +		/* more than one target or not found target */
> +		goto out;
>  
>  	if (snprintf(outparams, PARAMS_SIZE, "%s", params) <= PARAMS_SIZE)
>  		r = 0;
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index 9819e29..1ada3fb 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -1715,6 +1715,16 @@ int dm_reassign_table(const char *name, char *old, char *new)
>  	do {
>  		next = dm_get_next_target(dmt, next, &start, &length,
>  					  &target, &params);
> +		if (!target || !params) {
> +			/*
> +			 * We can't call dm_task_add_target() with
> +			 * invalid parameters. But simply dropping this
> +			 * target feels wrong, too. Abort and warn.
> +			 */
> +			condlog(1, "%s: invalid target found in map %s",
> +				__func__, name);
> +			goto out_reload;
> +		}
>  		buff = strdup(params);
>  		if (!buff) {
>  			condlog(3, "%s: failed to replace target %s, "
> -- 
> 2.36.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

