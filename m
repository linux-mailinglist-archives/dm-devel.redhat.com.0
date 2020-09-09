Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 48DA4263695
	for <lists+dm-devel@lfdr.de>; Wed,  9 Sep 2020 21:24:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-gcHkUSEgPoOlTPiIfEPN9g-1; Wed, 09 Sep 2020 15:24:33 -0400
X-MC-Unique: gcHkUSEgPoOlTPiIfEPN9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45F2A1882FA8;
	Wed,  9 Sep 2020 19:24:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BCAB5C1DA;
	Wed,  9 Sep 2020 19:24:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2EAD57A017;
	Wed,  9 Sep 2020 19:24:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 089JOBfO016774 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Sep 2020 15:24:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A23EC10EE6CC; Wed,  9 Sep 2020 19:24:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D47F10EE6C0
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 19:24:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E615101A53F
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 19:24:09 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-499-FRV6V4vMMf2-N2ZGbi3vBQ-1;
	Wed, 09 Sep 2020 15:24:07 -0400
X-MC-Unique: FRV6V4vMMf2-N2ZGbi3vBQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3B3FCAF99;
	Wed,  9 Sep 2020 19:24:21 +0000 (UTC)
Message-ID: <070b155d8d8d1b27c8c7be64c03b64d5b5c5e70d.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Date: Wed, 09 Sep 2020 21:24:04 +0200
In-Reply-To: <20200909154805.8210-1-xose.vazquez@gmail.com>
References: <20200909154805.8210-1-xose.vazquez@gmail.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] multipath-tools: add HPE MSA 1060/2060 to
	hwtable
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-09 at 17:48 +0200, Xose Vazquez Perez wrote:
> Cc: Martin Wilck <mwilck@suse.com>
> Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
> Cc: DM-DEVEL ML <dm-devel@redhat.com>
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>

I'm assuming you have this information from reliable sources. So:

Reviewed-by: Martin Wilck <mwilck@suse.com>

> ---
>  libmultipath/hwtable.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
> index d1fcfdb3..55162e0e 100644
> --- a/libmultipath/hwtable.c
> +++ b/libmultipath/hwtable.c
> @@ -181,9 +181,9 @@ static struct hwentry default_hw[] = {
>  		.prio_name     = PRIO_ALUA,
>  	},
>  	{
> -		/* MSA 1040, 1050, 2040 and 2050 families */
> +		/* MSA 1040, 1050, 1060, 2040, 2050 and 2060 families
> */
>  		.vendor        = "HP",
> -		.product       = "MSA [12]0[45]0 SA[NS]",
> +		.product       = "MSA [12]0[456]0 SA[NS]",
>  		.pgpolicy      = GROUP_BY_PRIO,
>  		.pgfailback    = -FAILBACK_IMMEDIATE,
>  		.no_path_retry = 18,


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

