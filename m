Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADD623D37D
	for <lists+dm-devel@lfdr.de>; Wed,  5 Aug 2020 23:13:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-upnnZcLXMv-eAR5NqlaIpQ-1; Wed, 05 Aug 2020 17:13:22 -0400
X-MC-Unique: upnnZcLXMv-eAR5NqlaIpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5762106B243;
	Wed,  5 Aug 2020 21:13:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CDF91A7C8;
	Wed,  5 Aug 2020 21:13:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E26B96926;
	Wed,  5 Aug 2020 21:13:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075LCuLI017745 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 17:12:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 86CEF202B16E; Wed,  5 Aug 2020 21:12:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82CAC202B171
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 21:12:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95BE1185A797
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 21:12:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-508-RqMLaDEFN_KGCmSHc7M7hg-1;
	Wed, 05 Aug 2020 17:12:51 -0400
X-MC-Unique: RqMLaDEFN_KGCmSHc7M7hg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1E32FB57F;
	Wed,  5 Aug 2020 21:13:07 +0000 (UTC)
Message-ID: <db83c4595e4e494d95c80825b1a66dfb77e14690.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Hannes Reinecke <hare@suse.de>, DM-DEVEL ML
	<dm-devel@redhat.com>
Date: Wed, 05 Aug 2020 23:12:49 +0200
In-Reply-To: <acc2f009-c4b8-0c09-c77c-9400aac38cb1@gmail.com>
References: <acc2f009-c4b8-0c09-c77c-9400aac38cb1@gmail.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: "Schremmer, Steven" <Steve.Schremmer@netapp.com>
Subject: Re: [dm-devel] [PATCH RFC] multipath-tools: *untested* use sysfs
 prio also for arrays with dual implicit/explicit alua support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Xose,

do you have a specific use case where this helps / changes matters?

The idea of the current code is to use PRIO_SYSFS always, except for
RDAC arrays with implicit ALUA, where periodic RTPGs are necessary (see
7e2f46d). This patch would change matters only for RDAC arrays which
advertise both explicit and implicit ALUA support.

Maybe Steven can clarify if such RDAC arrays exist, and whether we
should use PRIO_SYSFS or PRIO_ALUA for them.

Martin


On Sat, 2020-07-25 at 00:34 +0200, Xose Vazquez Perez wrote:
> Cc: Martin Wilck <mwilck@suse.com>
> Cc: Benjamin Marzinski <bmarzins@redhat.com>
> Cc: Hannes Reinecke <hare@suse.de>
> Cc: DM-DEVEL ML <dm-devel@redhat.com>
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> ---
> diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
> index 897e48ca..5a82234f 100644
> --- a/libmultipath/propsel.c
> +++ b/libmultipath/propsel.c
> @@ -595,7 +595,7 @@ detect_prio(struct config *conf, struct path *
> pp)
>   		tpgs = path_get_tpgs(pp);
>   		if (tpgs == TPGS_NONE)
>   			return;
> -		if ((tpgs == TPGS_EXPLICIT || !check_rdac(pp)) &&
> +		if ((tpgs == TPGS_EXPLICIT || tpgs == TPGS_BOTH ||
> !check_rdac(pp)) &&
>   		    sysfs_get_asymmetric_access_state(pp, buff, 512) >=
> 0)
>   			default_prio = PRIO_SYSFS;
>   		else
> 
> In short:
> 
> diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
> index 897e48ca..a9609a01 100644
> --- a/libmultipath/propsel.c
> +++ b/libmultipath/propsel.c
> @@ -595,7 +595,7 @@ detect_prio(struct config *conf, struct path *
> pp)
>   		tpgs = path_get_tpgs(pp);
>   		if (tpgs == TPGS_NONE)
>   			return;
> -		if ((tpgs == TPGS_EXPLICIT || !check_rdac(pp)) &&
> +		if ((tpgs != TPGS_IMPLICIT || !check_rdac(pp)) &&
>   		    sysfs_get_asymmetric_access_state(pp, buff, 512) >=
> 0)
>   			default_prio = PRIO_SYSFS;
>   		else
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

