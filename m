Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5416CC15E
	for <lists+dm-devel@lfdr.de>; Tue, 28 Mar 2023 15:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680011443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mD5Fs5rUEKeKZ1OjMij2IZ9azNDPI/ngbCnsbWvf+NY=;
	b=ckXTXGAcMY05lPHDU/isbCBRUwDgSu8M+gPQvUHuuIKVxrVHjspC/wwlwBXyw1asZKvKaX
	E8zj+xSMUD1N5GPamKN2nUKF5P4V8lnx3lJQd0WvjDO7F+zNl7dkIEpx3iyEGKUI+MRtwF
	2mZK1hrOzU7+uJjSzT24rJ5I20qqwfA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-BmYyZOMmNkykCXmio8C8-w-1; Tue, 28 Mar 2023 09:50:42 -0400
X-MC-Unique: BmYyZOMmNkykCXmio8C8-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5DBC382C97E;
	Tue, 28 Mar 2023 13:50:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80F7EC15BA0;
	Tue, 28 Mar 2023 13:50:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EB1BB19465B3;
	Tue, 28 Mar 2023 13:50:26 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0658C1946589
 for <dm-devel@listman.corp.redhat.com>; Tue, 28 Mar 2023 13:50:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BE1BE492B01; Tue, 28 Mar 2023 13:50:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D9AD492C3E;
 Tue, 28 Mar 2023 13:50:17 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 32SDoGat030650;
 Tue, 28 Mar 2023 08:50:16 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 32SDoFtw030649;
 Tue, 28 Mar 2023 08:50:15 -0500
Date: Tue, 28 Mar 2023 08:50:15 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20230328135015.GO19878@octiron.msp.redhat.com>
References: <20230323205358.29724-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20230323205358.29724-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH] libmultipath: use directio checker for LIO
 targets
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 23, 2023 at 09:53:58PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> LIO always responds with GOOD status to TUR. Thus TUR is
> not useful as path checker for LIO targets.
> 
> Fixes https://github.com/opensvc/multipath-tools/issues/54
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/hwtable.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
> index 3c4f866..c2a024c 100644
> --- a/libmultipath/hwtable.c
> +++ b/libmultipath/hwtable.c
> @@ -1067,6 +1067,7 @@ static struct hwentry default_hw[] = {
>  		.pgfailback    = -FAILBACK_IMMEDIATE,
>  		.no_path_retry = 12,
>  		.prio_name     = PRIO_ALUA,
> +		.checker_name  = DIRECTIO,
>  	},
>  	/*
>  	 * DataCore
> -- 
> 2.39.2
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

