Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C71CB140E54
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 16:52:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579276376;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PbP0LNkfuXP4hs37DX++mvPUMIMsqvPz5gBLNEx3L9s=;
	b=dOjPnnzieco6uCcn6SyZJPWJPHkxTCnwjNqhMHkF08mSbNfLxgRY3TliyyxL7TawXjRLXB
	MeS2lDEL5TfYZ8Dow051F/pucpf4Pg1C8SyFyz2/abBXVZa/289435xnKtio/iAgCn50jU
	MY7pWghMzPPKggokHQPgyrmgVM0wqF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-piDhmkSlNu2ErLZOL0NQoA-1; Fri, 17 Jan 2020 10:52:51 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10299800D4C;
	Fri, 17 Jan 2020 15:52:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D66145C54A;
	Fri, 17 Jan 2020 15:52:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D37A87091;
	Fri, 17 Jan 2020 15:52:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HFqcJY017993 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 10:52:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C7CF91094AA4; Fri, 17 Jan 2020 15:52:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3B711094AA6
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 15:52:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9BE81011A92
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 15:52:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-5-fYs5YXbMNiOPrvqZSABkOA-1;
	Fri, 17 Jan 2020 10:52:33 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id BD869AC22;
	Fri, 17 Jan 2020 15:52:31 +0000 (UTC)
Message-ID: <b4fa27e7ea46d659f9778ffa95d630aa2d98c73c.camel@suse.de>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Fri, 17 Jan 2020 16:53:47 +0100
In-Reply-To: <1579227500-17196-4-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-4-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: fYs5YXbMNiOPrvqZSABkOA-1
X-MC-Unique: piDhmkSlNu2ErLZOL0NQoA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00HFqcJY017993
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 03/15] Fix leak in mpathpersist
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> If the persistent in command fails, the response buffer must be
> freed.
> Found by Coverity
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  mpathpersist/main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mpathpersist/main.c b/mpathpersist/main.c
> index 278b8d51..920e686c 100644
> --- a/mpathpersist/main.c
> +++ b/mpathpersist/main.c
> @@ -499,6 +499,7 @@ static int handle_args(int argc, char * argv[],
> int nline)
>  		if (ret != MPATH_PR_SUCCESS )
>  		{
>  			fprintf (stderr, "Persistent Reserve IN command
> failed\n");
> +			free(resp);
>  			goto out_fd;
>  		}
>  

Reviewed-by: Martin Wilck <mwilck@suse.com>




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

