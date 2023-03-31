Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2A86D21AE
	for <lists+dm-devel@lfdr.de>; Fri, 31 Mar 2023 15:47:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680270476;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4L31yAAZSaQIpCyPy/74yblIBHCdvB7yYqpa58B0GOY=;
	b=YYuzsh1Ie4zvyTyhLBOzsO+Q53etFkl6yZ71rLFr8p9QzdOzBw52pkjmPWudfEIYonBcl1
	XxuQGeiD6bbsjH8QN3oJ/TSqURcBIiIEau50IW+UlyQXF+fi6XGMf40/G73OzbkuEy4MIh
	mtoI42zKH5m+pHyB+7hGtGhbnl/3i8s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-H0BHGcKsOdW9yu7ZQvdpnA-1; Fri, 31 Mar 2023 09:47:53 -0400
X-MC-Unique: H0BHGcKsOdW9yu7ZQvdpnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BAA9280BF64;
	Fri, 31 Mar 2023 13:47:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C1C22166B33;
	Fri, 31 Mar 2023 13:47:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 38A501946A46;
	Fri, 31 Mar 2023 13:47:39 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EC32019465BC
 for <dm-devel@listman.corp.redhat.com>; Fri, 31 Mar 2023 13:47:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A7398140E94F; Fri, 31 Mar 2023 13:47:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04FDF1415117;
 Fri, 31 Mar 2023 13:47:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 32VDlT5S019377;
 Fri, 31 Mar 2023 08:47:29 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 32VDlS97019376;
 Fri, 31 Mar 2023 08:47:28 -0500
Date: Fri, 31 Mar 2023 08:47:28 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20230331134728.GR19878@octiron.msp.redhat.com>
References: <20230331082835.7644-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20230331082835.7644-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [dm-devel] [PATCH] fixup! libmultipath: use directio checker
 for LIO targets
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
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 31, 2023 at 10:28:35AM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> When we set the check to something other than TUR, we need
> to disable checker detection, too.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  libmultipath/hwtable.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
> index c2a024c..65bca74 100644
> --- a/libmultipath/hwtable.c
> +++ b/libmultipath/hwtable.c
> @@ -1068,6 +1068,7 @@ static struct hwentry default_hw[] = {
>  		.no_path_retry = 12,
>  		.prio_name     = PRIO_ALUA,
>  		.checker_name  = DIRECTIO,
> +		.detect_checker = DETECT_CHECKER_OFF,
>  	},
>  	/*
>  	 * DataCore
> -- 
> 2.39.2
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

