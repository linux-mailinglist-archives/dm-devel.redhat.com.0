Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A45B224622C
	for <lists+dm-devel@lfdr.de>; Mon, 17 Aug 2020 11:12:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-4SMt2X5vPo232dCOBdnjcw-1; Mon, 17 Aug 2020 05:12:09 -0400
X-MC-Unique: 4SMt2X5vPo232dCOBdnjcw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 200931005E60;
	Mon, 17 Aug 2020 09:12:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B1A95C63F;
	Mon, 17 Aug 2020 09:12:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1F92181A86E;
	Mon, 17 Aug 2020 09:11:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07H9BhtP017930 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 05:11:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B74DD110F752; Mon, 17 Aug 2020 09:11:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A588D1004025
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 09:11:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 829F7803DCC
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 09:11:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-339-8UeCBmbPMgalm3jHugwsyw-1;
	Mon, 17 Aug 2020 05:11:37 -0400
X-MC-Unique: 8UeCBmbPMgalm3jHugwsyw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B10F1AD76;
	Mon, 17 Aug 2020 09:12:00 +0000 (UTC)
Message-ID: <13e2afb835ace628a990ffc6de03fab195833c3a.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, bmarzins@redhat.com, Christophe
	Varoqui <christophe.varoqui@opensvc.com>, Zdenek Kabelac
	<zkabelac@redhat.com>
Date: Mon, 17 Aug 2020 11:11:34 +0200
In-Reply-To: <df68c7c3-2b86-ce72-62e9-c43ef80a2bc8@huawei.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
	<df68c7c3-2b86-ce72-62e9-c43ef80a2bc8@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH 5/6] vector: add lower boundary check in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2020-08-16 at 09:45 +0800, Zhiqiang Liu wrote:
> In vector_foreach_slot_after macro, i is the input var, which
> may have a illegal value (i < 0). So we should add lower boundary
> check in vector_foreach_slot_after macro.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/vector.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Perhaps we should write this instead? I'm unsure if compilers can
optimize away the repeated extra check in all cases.

#define vector_foreach_slot_after(v,p,i) \
	if ((v) && (int)(i) >= 0)        \
		for (; (int)(i) < VECTOR_SIZE(v) && ((p) = (v)->slot[i]); (i)++)

Regards,
Martin

> 
> diff --git a/libmultipath/vector.h b/libmultipath/vector.h
> index 2862dc2..45dbfc1 100644
> --- a/libmultipath/vector.h
> +++ b/libmultipath/vector.h
> @@ -38,11 +38,11 @@ typedef struct _vector *vector;
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
> +	for (; (v) && (int)(i) < VECTOR_SIZE(v) && (int)(i) >= 0 &&
> ((p) = (v)->slot[i]); (i)++)
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

