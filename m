Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 902146CAA83
	for <lists+dm-devel@lfdr.de>; Mon, 27 Mar 2023 18:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679934274;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VsJIgldq46rkiQYeLRhcz7ZIKKyP07wFy4eBdCWacTc=;
	b=EvzS/Gz4KDUZTeCmhroxzh+ymVHVH2hAH3Y5eFioII7isbLJM+L0biDdhw0Dd4Ka1RSQEe
	7y/qd+lCdOieaNwdEV/MKPH0eswVl9k0grFQqVaasZOPOoKYf3HhsJPJ5Gf+ZIHawhpkDr
	u233ujXieXRjULRKEz9gdyq/rvbhBAU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-WL1TnIJMMaSmhFAaUmylRg-1; Mon, 27 Mar 2023 12:24:30 -0400
X-MC-Unique: WL1TnIJMMaSmhFAaUmylRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A4C6280BC9D;
	Mon, 27 Mar 2023 16:24:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B64ABC15BA0;
	Mon, 27 Mar 2023 16:24:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 55F3C19465B9;
	Mon, 27 Mar 2023 16:24:18 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 968C4194658F
 for <dm-devel@listman.corp.redhat.com>; Mon, 27 Mar 2023 16:24:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 78FB01121331; Mon, 27 Mar 2023 16:24:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 228BC1121330;
 Mon, 27 Mar 2023 16:24:17 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 32RGOFv5024219;
 Mon, 27 Mar 2023 11:24:15 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 32RGOFga024218;
 Mon, 27 Mar 2023 11:24:15 -0500
Date: Mon, 27 Mar 2023 11:24:14 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20230327162414.GN19878@octiron.msp.redhat.com>
References: <20230325222820.3392-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20230325222820.3392-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH] multipathd.service: remove
 "Also=multipathd.socket"
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

On Sat, Mar 25, 2023 at 11:28:20PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This "Also=" directive is wrong. It was meant for enabling socket activation,
> but it actually does the opposite. "Also=multipathd.socket" means that
> enabling/disabling the service will enable/disable the socket, too. This is
> not what we want: socket activation means that we can enable the socket
> while the service is disabled and will be activated by the socket on demand.
> 
> See https://github.com/dracutdevs/dracut/pull/2290,
> https://github.com/opensvc/multipath-tools/issues/65
> 
> Fixes: ca985df ("multipathd: switch to socket activation for systemd")
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipathd/multipathd.service | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
> index aec62db..5a9cde1 100644
> --- a/multipathd/multipathd.service
> +++ b/multipathd/multipathd.service
> @@ -22,4 +22,3 @@ TasksMax=infinity
>  
>  [Install]
>  WantedBy=sysinit.target
> -Also=multipathd.socket
> -- 
> 2.39.2
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

