Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F10462D9562
	for <lists+dm-devel@lfdr.de>; Mon, 14 Dec 2020 10:40:38 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-u5rdy8GYOveoppsMdkiUaA-1; Mon, 14 Dec 2020 04:40:36 -0500
X-MC-Unique: u5rdy8GYOveoppsMdkiUaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C72C107ACFE;
	Mon, 14 Dec 2020 09:40:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C585A6E71E;
	Mon, 14 Dec 2020 09:40:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82F23180954D;
	Mon, 14 Dec 2020 09:40:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BE9e55o020803 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 04:40:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7CE221111C93; Mon, 14 Dec 2020 09:40:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 751961111C87
	for <dm-devel@redhat.com>; Mon, 14 Dec 2020 09:40:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F2C4185A794
	for <dm-devel@redhat.com>; Mon, 14 Dec 2020 09:40:03 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-446-LSYGsGkINIC8dm2SFPl9mQ-1;
	Mon, 14 Dec 2020 04:39:58 -0500
X-MC-Unique: LSYGsGkINIC8dm2SFPl9mQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6886CAC10;
	Mon, 14 Dec 2020 09:39:57 +0000 (UTC)
Message-ID: <d40f6d93d398a3bbb6b9a42d67f47521d35c4d65.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Xose Vazquez Perez <xose.vazquez@gmail.com>
Date: Mon, 14 Dec 2020 10:39:56 +0100
In-Reply-To: <CABr-GnfTqde6t2LFTHbrRkp1qMVbsRUEFBqU6tW1M_uR1svHFg@mail.gmail.com>
References: <CABr-GnfTqde6t2LFTHbrRkp1qMVbsRUEFBqU6tW1M_uR1svHFg@mail.gmail.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] uxsock_timeout default value in man page
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-12-14 at 08:56 +0100, Christophe Varoqui wrote:
> Hello,
> 
> a user brought to my attention "multipathd show config | grep
> usock_timeout" does not agree with the default value stated in the
> manpage : 4000 instead of 1000.
> 
> And indeed,
> 
> ./libmpathcmd/mpath_cmd.h:#define DEFAULT_REPLY_TIMEOUT 4000
> 
> Can you confirm this change is valid ?

Yes. 
Reviewed-by: Martin Wilck <mwilck@suse.com>

You may want to add

Fixes: 7db0c44 ("multipathd: Set CLI timeout correctly")

because that commit changed the timeout without changing the man page.

Martin


> 
> diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
> index d2101ed6..7242d39b 100644
> --- a/multipath/multipath.conf.5
> +++ b/multipath/multipath.conf.5
> @@ -1153,7 +1153,7 @@ In these cases it is recommended to increase
> the CLI timeout to avoid
>  those issues.
>  .RS
>  .TP
> -The default is: \fB1000\fR
> +The default is: \fB4000\fR
>  .RE
>  .
>  .
> 
> Best Regards,
> Christophe


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

