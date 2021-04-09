Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0ED35A1A1
	for <lists+dm-devel@lfdr.de>; Fri,  9 Apr 2021 17:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617980594;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=opa6hWrsjwLqQgkQBMw6to875183gnMxWDHBpYJ08rg=;
	b=Rymq2DWWqEieGpDh/M0NvFvSfm/PsxRgffxDAFXEh6TmHzR2CvCeZe1JggMhUM6FOEqGWP
	wLDGI6+udWOmnRPb+dOBH5GAMcSDWGMg77+gUvCV1bRCI9ELfGp331tz8roreTPbSuYKso
	w90Hta33ayHdYoCyn+fx+h7sa2AYQ5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-EjRq4tgbMxq47yR_5lMJdQ-1; Fri, 09 Apr 2021 11:01:33 -0400
X-MC-Unique: EjRq4tgbMxq47yR_5lMJdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C94AE83DD25;
	Fri,  9 Apr 2021 15:01:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EF8D6064B;
	Fri,  9 Apr 2021 15:01:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5513D180B654;
	Fri,  9 Apr 2021 15:01:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139ExEXC024156 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 10:59:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 982B86A97F; Fri,  9 Apr 2021 14:59:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 965FC60D79;
	Fri,  9 Apr 2021 14:59:10 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 139Ex8dD016305; 
	Fri, 9 Apr 2021 09:59:08 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 139Ex7fD016304;
	Fri, 9 Apr 2021 09:59:07 -0500
Date: Fri, 9 Apr 2021 09:59:07 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20210409145907.GB20773@octiron.msp.redhat.com>
References: <bdc30cf9-dcc6-dedb-dead-2aa3db6e25b4@huawei.com>
MIME-Version: 1.0
In-Reply-To: <bdc30cf9-dcc6-dedb-dead-2aa3db6e25b4@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: fix memory leak in
	checker_cleanup_thread
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 09, 2021 at 03:15:05PM +0800, lixiaokeng wrote:
> If checker_cleanup_thread is called after cleanup_checkers,
> the checker_class will not be freed.
> 
> Here, we use free_checker_class instead of checker_class_unref
> in checker_cleanup_thread.
> 
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/checkers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
> index 2dd9915d..7cc80f0b 100644
> --- a/libmultipath/checkers.c
> +++ b/libmultipath/checkers.c
> @@ -368,7 +368,7 @@ static void checker_cleanup_thread(void *arg)
>  {
>  	struct checker_class *cls = arg;
> 
> -	(void)checker_class_unref(cls);
> +	(void)free_checker_class(cls);
>  	rcu_unregister_thread();
>  }
> 
> -- 

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

