Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E5B7E24D3CC
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 13:20:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-faM9Cc_RMoaVTSJOYb9Gog-1; Fri, 21 Aug 2020 07:20:39 -0400
X-MC-Unique: faM9Cc_RMoaVTSJOYb9Gog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23BE92FD08;
	Fri, 21 Aug 2020 11:20:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A189360BF1;
	Fri, 21 Aug 2020 11:20:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56865662B3;
	Fri, 21 Aug 2020 11:20:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LBKRhN015589 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 07:20:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DAE412022797; Fri, 21 Aug 2020 11:20:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4EA420110C9
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 11:20:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B0D318AE958
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 11:20:22 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-348-pHoajEIaNPiY0HRx5pikTA-1;
	Fri, 21 Aug 2020 07:20:17 -0400
X-MC-Unique: pHoajEIaNPiY0HRx5pikTA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E7072AD04;
	Fri, 21 Aug 2020 11:20:43 +0000 (UTC)
Message-ID: <479007328bfbb4737c8e843dff563fa4ea32f246.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Date: Fri, 21 Aug 2020 13:20:15 +0200
In-Reply-To: <8e1d9d4d-a1c2-f75a-ec84-6d7968a9e0d7@huawei.com>
References: <52b3b834-6da6-99c1-a2d1-95c2387c47e3@huawei.com>
	<8e1d9d4d-a1c2-f75a-ec84-6d7968a9e0d7@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH V2 4/5] vector: add lower boundary check in
 vector_foreach_slot_after
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-21 at 19:00 +0800, Zhiqiang Liu wrote:
> In vector_foreach_slot_after macro, i is the input var, which
> may have a illegal value (i < 0). So we should add lower boundary
> check in vector_foreach_slot_after macro.
> 
> V1->V2:
> - check whether i is illegal before loop (As suggested by Martin)
> 

Reviewed-by: Martin Wilck <mwilck@suse.com>

> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/vector.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/libmultipath/vector.h b/libmultipath/vector.h
> index 2862dc28..ab80d06e 100644
> --- a/libmultipath/vector.h
> +++ b/libmultipath/vector.h
> @@ -38,11 +38,12 @@ typedef struct _vector *vector;
>  #define VECTOR_LAST_SLOT(V)   (((V) && VECTOR_SIZE(V) > 0) ? (V)-
> >slot[(VECTOR_SIZE(V) - 1)] : NULL)
> 
>  #define vector_foreach_slot(v,p,i) \
> -	for (i = 0; (v) && (int)i < VECTOR_SIZE(v) && ((p) = (v)-
> >slot[i]); i++)
> +	for ((i) = 0; (v) && (int)(i) < VECTOR_SIZE(v) && ((p) = (v)-
> >slot[i]); (i)++)
>  #define vector_foreach_slot_after(v,p,i) \
> -	for (; (v) && (int)i < VECTOR_SIZE(v) && ((p) = (v)->slot[i]);
> i++)
> +	if ((v) && (int)(i) >= 0) \
> +		for (; (int)(i) < VECTOR_SIZE(v) && ((p) = (v)-
> >slot[i]); (i)++)
>  #define vector_foreach_slot_backwards(v,p,i) \
> -	for (i = VECTOR_SIZE(v) - 1; (int)i >= 0 && ((p) = (v)-
> >slot[i]); i--)
> +	for ((i) = VECTOR_SIZE(v) - 1; (int)(i) >= 0 && ((p) = (v)-
> >slot[i]); (i)--)
> 
>  #define identity(x) (x)
>  /*


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

