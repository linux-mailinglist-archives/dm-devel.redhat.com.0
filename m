Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1C44ADB9B
	for <lists+dm-devel@lfdr.de>; Tue,  8 Feb 2022 15:54:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644332038;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hOobpsTLSXKJ7WxcC/rDz36sl47C2H6qEau31/fia/s=;
	b=Xqk9ruiWvHg6EdWi4Gwo3oZSg9D0AYCFFOu1pqMiE0CAUW6sgIHec1RUgIiYsvjdh7ZQo6
	LP9BBveggOtcmwi+as3XC+b98kBXrNbdknMGGldExkzl1Zlh1FV+b9DYrpGkyCiC7k70jb
	nSXMPfaGpddeTE/L8T1biKFzcqqQoM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-78iiOGW0NEyI7_oAMKUtPg-1; Tue, 08 Feb 2022 09:53:55 -0500
X-MC-Unique: 78iiOGW0NEyI7_oAMKUtPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA9341124C40;
	Tue,  8 Feb 2022 14:53:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CDE4747B4;
	Tue,  8 Feb 2022 14:53:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAC2E1809CB8;
	Tue,  8 Feb 2022 14:53:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 218Er3uj023996 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Feb 2022 09:53:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4B80F105C89A; Tue,  8 Feb 2022 14:53:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C71B310631EA;
	Tue,  8 Feb 2022 14:52:56 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 218Eqsfm009700; 
	Tue, 8 Feb 2022 08:52:54 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 218EqsdJ009699;
	Tue, 8 Feb 2022 08:52:54 -0600
Date: Tue, 8 Feb 2022 08:52:53 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220208145253.GB24684@octiron.msp.redhat.com>
References: <20220202115025.29214-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220202115025.29214-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: hwtable: use ALUA for all LIO
	targets
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 02, 2022 at 12:50:25PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> LIO supports ALUA for all backends. Use it by default.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/hwtable.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
> index c65e5e1..bd15710 100644
> --- a/libmultipath/hwtable.c
> +++ b/libmultipath/hwtable.c
> @@ -1039,7 +1039,7 @@ static struct hwentry default_hw[] = {
>  	{
>  		/* Linux-IO Target */
>  		.vendor        = "(LIO-ORG|SUSE)",
> -		.product       = "RBD",
> +		.product       = ".",
>  		.hwhandler     = "1 alua",
>  		.pgpolicy      = GROUP_BY_PRIO,
>  		.pgfailback    = -FAILBACK_IMMEDIATE,
> -- 
> 2.34.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

